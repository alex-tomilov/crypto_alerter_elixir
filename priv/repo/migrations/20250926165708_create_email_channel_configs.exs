defmodule CryptoAlerterElixir.Repo.Migrations.CreateEmailChannelConfigs do
  use Ecto.Migration

  def change do
    create table(:email_channel_configs) do
      add :channel_config_id, references(:channel_configs, on_delete: :delete_all), null: false
      add :to, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:email_channel_configs, [:channel_config_id])
  end
end
