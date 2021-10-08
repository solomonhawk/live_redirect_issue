defmodule LiveRedirectIssueWeb.BranchALive do
  use LiveRedirectIssueWeb, :live_view

  def mount(params, session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      Branch A

      <button phx-click="request_redirect">Redirect to Destination with Flash Please</button>
    </div>
    """
  end

  def handle_event("request_redirect", params, socket) do
    {:noreply,
     socket
     |> put_flash(:info, "Redirected from A...")
     |> push_redirect(to: "/destination")}
  end
end
