defmodule CryptoAlerterElixir.Alert do
  @moduledoc """
  This module provides a structure for an alert, which can be used to configure different types of alerts for different symbols.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "alerts" do
    field :direction, Ecto.Enum, values: [above: 0, below: 1], default: :above
    field :threshold, :decimal
    field :mode, Ecto.Enum, values: [oneshot: 0, persistent: 1], default: :oneshot
    field :cooldown_seconds, :integer
    field :hysteresis_pct, :decimal

    timestamps(type: :utc_datetime)

    belongs_to :symbol, CryptoAlerterElixir.Symbol

    many_to_many :channel_configs, CryptoAlerterElixir.ChannelConfig,
      join_through: CryptoAlerterElixir.AlertChannel
  end

  @doc false
  def changeset(alert, attrs) do
    alert
    |> cast(attrs, [:symbol_id, :direction, :threshold, :mode, :cooldown_seconds, :hysteresis_pct])
    |> validate_required([:symbol_id, :direction, :threshold, :mode])
    |> assoc_constraint(:symbol)
  end
end
