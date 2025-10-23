defmodule CryptoAlerterElixir.EmailChannelConfig do
  @moduledoc """
  This module provides a structure for an email channel configuration, which can be used to send email alerts.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "email_channel_configs" do
    field :to, :string

    timestamps(type: :utc_datetime)

    belongs_to :channel_config, CryptoAlerterElixir.ChannelConfig
  end

  @doc false
  def changeset(email_channel_config, attrs) do
    email_channel_config
    |> cast(attrs, [:to, :channel_config_id])
    |> validate_required([:to, :channel_config_id])
    |> validate_format(:to, ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/,
      message: "must be a valid email address"
    )
  end
end
