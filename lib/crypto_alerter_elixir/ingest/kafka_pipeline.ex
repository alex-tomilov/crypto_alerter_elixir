defmodule CryptoAlerterElixir.Ingest.KafkaPipeline do
  use Broadway

  @app :crypto_alerter_elixir

  def start_link(_opts) do
    opts = config!()

    broadway_opts = [
      name: __MODULE__,
      producer: [
        # required keys: :hosts, :group_id, :topics
        module: {BroadwayKafka.Producer, opts[:kafka]},
        concurrency: 1
      ],
      processors: [default: [concurrency: System.schedulers_online()]]
    ]

    Broadway.start_link(__MODULE__, broadway_opts)
  end

  # Pull runtime config (runtime.exs) for hosts/group_id/topics, etc.
  defp config! do
    # Raises if missing, so you fail fast in envs where Kafka must run
    Application.fetch_env!(@app, __MODULE__)
  end

  @impl true
  def handle_message(_proc, message, _ctx) do
    # TODO: your processing
    message
  end
end
