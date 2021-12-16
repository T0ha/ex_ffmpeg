defmodule Jpeg2videoWeb.ImageLive.Index do
  use Jpeg2videoWeb, :live_view

  @frames_upload_path Application.get_env(:jpeg2video, :tmp_path, "./tmp")

  @impl true
  def mount(_params, _session, socket) do
    socket = 
      socket
      |> assign(:frames, [])
      |> allow_upload(:frame, accept: ~w(.jpg .jpeg), max_entries: 2000)
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => _id}) do
    socket
    |> assign(:page_title, "Edit Image")
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Image")
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Images")
    |> assign(:image, nil)
  end

  @impl true
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("upload", _params, socket) do
    images = 
    consume_uploaded_entries(socket, :frame, fn %{path: path}, entry ->
      file_name = Path.join([@frames_upload_path, entry.upload_ref, "frame#{entry.ref}.jpeg"])
      File.mkdir(Path.join(@frames_upload_path, entry.upload_ref))
      File.cp!(path, file_name)
      file_name
    end)
    {:noreply, update(socket, :frames, &(&1 ++ images))}
  end

  def handle_event("convert", _params, socket) do
    path = convert_to_avi(socket.assigns.frames)
    {:noreply, redirect(socket, to: Routes.page_path(socket, :download, path: path))}
  end

  defp convert_to_avi(frames) do
    path = 
      frames
      |> hd()
      |> Path.dirname()

    frames
    |> length()
    |> (&(&1 / 60)).()
    |> ffmpeg_command(path)
    |> System.shell()

    File.rm_rf(Path.join(path, "*.jpeg"))
    Path.join(path, "out.avi")
  end

  defp ffmpeg_command(rate, path), do:
    "ffmpeg -f image2 -r #{rate} -i #{path}/frame%d.jpeg #{path}/out.avi"
end
