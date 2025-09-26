defmodule CryptoAlerterElixir.EmailChannelConfig do
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
  end
end
