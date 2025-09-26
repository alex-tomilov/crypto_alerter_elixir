defmodule CryptoAlerterElixir.Repo.Migrations.CreateAlertChannels do
  use Ecto.Migration

  def change do
    create table(:alert_channels) do
      add :alert_id, references(:alerts, on_delete: :delete_all), null: false
      add :channel_config_id, references(:channel_configs, on_delete: :delete_all), null: false
      add :enabled, :boolean, default: false, null: false
      add :priority, :integer, default: 0, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:alert_channels, [:alert_id, :channel_config_id], unique: true)
  end
end
