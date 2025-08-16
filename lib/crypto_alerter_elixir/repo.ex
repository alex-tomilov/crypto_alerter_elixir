defmodule CryptoAlerterElixir.Repo do
  use Ecto.Repo,
    otp_app: :crypto_alerter_elixir,
    adapter: Ecto.Adapters.Postgres
end
