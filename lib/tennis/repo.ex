defmodule Tennis.Repo do
  use Ecto.Repo,
    otp_app: :tennis,
    adapter: Ecto.Adapters.Postgres
end
