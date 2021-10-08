defmodule LiveRedirectIssueWeb.PageController do
  use LiveRedirectIssueWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
