defmodule CryptoAlerterElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CryptoAlerterElixirWeb.Telemetry,
      CryptoAlerterElixir.Repo,
      {DNSCluster, query: Application.get_env(:crypto_alerter_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CryptoAlerterElixir.PubSub},
      # Start a worker by calling: CryptoAlerterElixir.Worker.start_link(arg)
      # {CryptoAlerterElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      CryptoAlerterElixirWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CryptoAlerterElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CryptoAlerterElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
