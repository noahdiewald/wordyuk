defmodule Wordyuk.Repo do
  use Ecto.Repo,
    otp_app: :wordyuk,
    adapter: Ecto.Adapters.Postgres
end
