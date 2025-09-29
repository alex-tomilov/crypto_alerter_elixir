defmodule CryptoAlerterElixir.Repo.Migrations.CreateAlerts do
  use Ecto.Migration

  def change do
    create table(:alerts) do
      add :symbol_id, references(:symbols, on_delete: :delete_all), null: false
      add :direction, :integer, default: 0, null: false
      add :threshold, :decimal, precision: 18, scale: 8, null: false
      add :mode, :integer, default: 0, null: false
      add :cooldown_seconds, :integer, default: 300
      add :hysteresis_pct, :decimal, default: 0

      timestamps(type: :utc_datetime)
    end

    create index(:alerts, [:symbol_id])
  end
end
