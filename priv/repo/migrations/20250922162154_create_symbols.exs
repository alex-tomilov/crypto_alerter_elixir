defmodule CryptoAlerterElixir.Repo.Migrations.CreateSymbols do
  use Ecto.Migration

  def change do
    create table(:symbols) do
      add :name, :string, null: false
      add :provider, :integer, default: 0, null: false
      add :enabled, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
