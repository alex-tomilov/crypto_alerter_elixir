defmodule CryptoAlerterElixir.Repo.Migrations.CreateDeliveries do
  use Ecto.Migration

  def change do
    create table(:deliveries) do
      add :channel_config_id, references(:channel_configs, on_delete: :delete_all), null: false
      add :channel_kind, :integer, default: 0, null: false
      add :idempotency_key, :string, null: false
      add :attempt_no, :integer, default: 0, null: false
      add :status, :integer, default: 0, null: false
      add :error, :text
      add :attempted_at, :utc_datetime_usec
      add :finished_at, :utc_datetime_usec
      add :latency_ms, :integer
      add :provider_message_id, :text
      add :config_snapshot, :map, default: %{}

      timestamps(type: :utc_datetime)
    end

    create index(:deliveries, [:channel_config_id])
    create index(:deliveries, [:channel_kind, :status])
    create index(:deliveries, [:idempotency_key, :attempt_no], unique: true)
    create index(:deliveries, [:attempted_at], using: :brin)
    create index(:deliveries, [:finished_at], using: :brin)
  end
end
