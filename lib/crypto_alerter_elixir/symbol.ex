defmodule CryptoAlerterElixir.Symbol do
  use Ecto.Schema
  import Ecto.Changeset

  schema "symbols" do
    field :name, :string
    field :provider, Ecto.Enum, values: [:binance], default: :binance
    field :enabled, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(symbol, attrs) do
    symbol
    |> cast(attrs, [:name, :provider, :enabled])
    |> validate_required([:name, :provider, :enabled])
    |> validate_length(:name, min: 1)
  end
end
