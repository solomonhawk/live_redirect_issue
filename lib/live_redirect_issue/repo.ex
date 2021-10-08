defmodule LiveRedirectIssue.Repo do
  use Ecto.Repo,
    otp_app: :live_redirect_issue,
    adapter: Ecto.Adapters.Postgres
end
