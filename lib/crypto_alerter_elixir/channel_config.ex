defmodule CryptoAlerterElixir.ChannelConfig do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channel_configs" do
    field :kind, Ecto.Enum, values: [email: 0, telegram: 1, webhook: 2, slack: 3], default: :email
    field :name, :string
    field :enabled, :boolean, default: false
    field :secrets_ref, :string
    field :rate_limit_per_min, :integer

    timestamps(type: :utc_datetime)

    has_one :email_config, CryptoAlerterElixir.EmailChannelConfig

    many_to_many :alerts, CryptoAlerterElixir.Alert,
      join_through: CryptoAlerterElixir.AlertChannel
  end

  @doc false
  def changeset(channel_config, attrs) do
    channel_config
    |> cast(attrs, [:kind, :name, :enabled, :secrets_ref, :rate_limit_per_min])
    |> validate_required([:kind, :name, :enabled])
  end
end
