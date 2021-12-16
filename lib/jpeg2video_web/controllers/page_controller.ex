defmodule Jpeg2videoWeb.PageController do
  use Jpeg2videoWeb, :controller


  def download(conn, %{"path" => path}) do
    send_download(conn, {:file, path})
  end
end
