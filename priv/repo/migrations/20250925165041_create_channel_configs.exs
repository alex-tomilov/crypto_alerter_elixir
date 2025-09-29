defmodule CryptoAlerterElixir.Repo.Migrations.CreateChannelConfigs do
  use Ecto.Migration

  def change do
    create table(:channel_configs) do
      add :kind, :integer, default: 0, null: false
      add :name, :string, null: false
      add :enabled, :boolean, default: false, null: false
      add :secrets_ref, :string
      add :rate_limit_per_min, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
