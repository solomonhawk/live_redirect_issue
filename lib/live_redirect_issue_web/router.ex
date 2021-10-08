defmodule LiveRedirectIssueWeb.Router do
  use LiveRedirectIssueWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveRedirectIssueWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveRedirectIssueWeb do
    pipe_through :browser

    get "/", PageController, :index

    # renders a live view with render_live/2
    get "switch-dead", SwitchController, :live

    # renders a live view with render_live/3 passing a :router option
    get "switch-dead-router", SwitchController, :live_router

    # renders a live route
    live "switch-live", SwitchLive

    # place to redirect to
    live "destination", DestinationLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveRedirectIssueWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: LiveRedirectIssueWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
