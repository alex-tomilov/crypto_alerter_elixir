defmodule CryptoAlerterElixir.Delivery do
  @moduledoc """
  This module provides a structure for a delivery, which can be used to track the status of a message sent through a channel.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "deliveries" do
    field :channel_kind, Ecto.Enum,
      values: [email: 0, telegram: 1, webhook: 2, slack: 3],
      default: :email

    field :idempotency_key, :string
    field :attempt_no, :integer

    field :status, Ecto.Enum,
      values: [ok: 0, error: 1, rate_limited: 2, timeout: 3, skipped: 4, cancelled: 5],
      default: :ok

    field :error, :string
    field :attempted_at, :utc_datetime
    field :finished_at, :utc_datetime
    field :latency_ms, :integer
    field :provider_message_id, :string
    field :config_snapshot, :map, default: %{}

    belongs_to :channel_config, CryptoAlerterElixir.ChannelConfig

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(delivery, attrs) do
    delivery
    |> cast(attrs, [
      :channel_config_id,
      :channel_kind,
      :idempotency_key,
      :attempt_no,
      :status,
      :error,
      :attempted_at,
      :finished_at,
      :latency_ms,
      :provider_message_id,
      :config_snapshot
    ])
    |> validate_required([
      :channel_config_id,
      :channel_kind,
      :idempotency_key,
      :attempt_no,
      :status
    ])
  end
end
