defmodule CryptoAlerterElixir.Alert do
  use Ecto.Schema
  import Ecto.Changeset

  schema "alerts" do
    field :symbol_id, :integer
    field :direction, Ecto.Enum, values: [above: 0, below: 1], default: :above
    field :threshold, :decimal
    field :mode, Ecto.Enum, values: [oneshot: 0, persistent: 1], default: :oneshot
    field :cooldown_seconds, :integer
    field :hysteresis_pct, :decimal
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(alert, attrs) do
    alert
    |> cast(attrs, [:symbol_id, :direction, :threshold, :mode, :cooldown_seconds, :hysteresis_pct])
    |> validate_required([:symbol_id, :direction, :threshold, :mode])
  end
end
