defmodule LiveRedirectIssueWeb.DestinationLive do
  use LiveRedirectIssueWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <p>^ I should have a flash message displayed above ^</p>

      Destination
    </div>
    """
  end
end
