defmodule Jpeg2videoWeb.PageController do
  use Jpeg2videoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
