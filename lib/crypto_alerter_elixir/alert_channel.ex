defmodule CryptoAlerterElixir.AlertChannel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "alert_channels" do
    field :enabled, :boolean, default: false
    field :priority, Ecto.Enum, values: [low: 0, medium: 1, high: 2]

    timestamps(type: :utc_datetime)

    belongs_to :alert, CryptoAlerterElixir.Alert
    belongs_to :channel_config, CryptoAlerterElixir.ChannelConfig
  end

  @doc false
  def changeset(alert_channel, attrs) do
    alert_channel
    |> cast(attrs, [:alert_id, :channel_config_id, :enabled, :priority])
    |> validate_required([:alert_id, :channel_config_id, :enabled, :priority])
  end
end
