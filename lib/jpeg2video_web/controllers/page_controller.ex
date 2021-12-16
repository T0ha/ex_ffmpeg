defmodule Jpeg2videoWeb.PageController do
  use Jpeg2videoWeb, :controller

  @frames_upload_path Application.get_env(:jpeg2video, :tmp_path, "./tmp")

  def download(conn, _params) do
    send_download(conn, {:file, "#{@frames_upload_path}/out.avi"})
  end
end
