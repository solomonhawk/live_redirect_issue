defmodule LiveRedirectIssueWeb.SwitchController do
  use LiveRedirectIssueWeb, :controller

  import Phoenix.LiveView.Controller

  def live(conn, %{"branch" => "a"}) do
    live_render(conn, LiveRedirectIssueWeb.BranchALive)
  end

  def live(conn, %{"branch" => "b"}) do
    live_render(conn, LiveRedirectIssueWeb.BranchBLive)
  end

  def live_router(conn, %{"branch" => "a"}) do
    live_render(conn, LiveRedirectIssueWeb.BranchALive, router: LiveRedirectIssueWeb.Router)
  end

  def live_router(conn, %{"branch" => "b"}) do
    live_render(conn, LiveRedirectIssueWeb.BranchBLive, router: LiveRedirectIssueWeb.Router)
  end
end
