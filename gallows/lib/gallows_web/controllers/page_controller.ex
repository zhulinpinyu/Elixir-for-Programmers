defmodule GallowsWeb.PageController do
  use GallowsWeb, :controller

  def index(conn, _params) do
    data = %{name: "Apple", count: 2}
    render conn, "index.html", data
  end
end
