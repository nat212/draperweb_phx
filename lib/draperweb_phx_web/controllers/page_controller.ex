defmodule DraperwebPhxWeb.PageController do
  use DraperwebPhxWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> assign(:active_route, :home)
    |> render(:home)
  end
end
