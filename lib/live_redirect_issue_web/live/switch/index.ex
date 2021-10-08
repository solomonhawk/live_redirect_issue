defmodule LiveRedirectIssueWeb.SwitchLive do
  use LiveRedirectIssueWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"branch" => "a"}, _uri, socket) do
    {:noreply,
     socket
     |> assign(view: LiveRedirectIssueWeb.BranchALive)}
  end

  def handle_params(%{"branch" => "b"}, _uri, socket) do
    {:noreply,
     socket
     |> assign(view: LiveRedirectIssueWeb.BranchBLive)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= live_render(assigns.socket, assigns.view, id: "branch") %>
    </div>
    """
  end
end
