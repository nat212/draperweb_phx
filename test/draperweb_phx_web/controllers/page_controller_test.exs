defmodule DraperwebPhxWeb.PageControllerTest do
  use DraperwebPhxWeb.ConnCase

  test "Should redirect to /session/new", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 302) =~ "/session/new?request_path=%2F"
  end
end
