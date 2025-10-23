defmodule CryptoAlerterElixir.DeliveryTest do
  use CryptoAlerterElixir.DataCase, async: true
  alias CryptoAlerterElixir.{Symbol, Delivery, Repo}

  test "channel_kind must be one of the supported channel_kinds" do
    changeset = %Delivery{} |> Delivery.changeset(%{channel_kind: :random})
    assert "is invalid" in errors_on(changeset).channel_kind
  end

  test "changeset has no channel_kind errors if the channel_kind is valid" do
    changeset = %Delivery{} |> Delivery.changeset(%{channel_kind: :email})
    refute errors_on(changeset)[:channel_kind]

    changeset = %Delivery{} |> Delivery.changeset(%{channel_kind: :telegram})
    refute errors_on(changeset)[:channel_kind]

    changeset = %Delivery{} |> Delivery.changeset(%{channel_kind: :webhook})
    refute errors_on(changeset)[:channel_kind]

    changeset = %Delivery{} |> Delivery.changeset(%{channel_kind: :slack})
    refute errors_on(changeset)[:channel_kind]
  end

  test "idempotency_key must be a string" do
    changeset = %Delivery{} |> Delivery.changeset(%{idempotency_key: 123})
    assert "is invalid" in errors_on(changeset).idempotency_key
  end

  test "changeset has no idempotency_key errors if the idempotency_key is valid" do
    changeset = %Delivery{} |> Delivery.changeset(%{idempotency_key: "123"})
    refute errors_on(changeset)[:idempotency_key]
  end

  test "attempt_no must be an integer" do
    changeset = %Delivery{} |> Delivery.changeset(%{attempt_no: "abc"})
    assert "is invalid" in errors_on(changeset).attempt_no
  end

  test "changeset has no attempt_no errors if the attempt_no is valid" do
    changeset = %Delivery{} |> Delivery.changeset(%{attempt_no: 123})
    refute errors_on(changeset)[:attempt_no]
  end

  test "status must be one of the supported statuss" do
    changeset = %Delivery{} |> Delivery.changeset(%{status: :random})
    assert "is invalid" in errors_on(changeset).status
  end

  test "changeset has no status errors if the status is valid" do
    changeset = %Delivery{} |> Delivery.changeset(%{status: :ok})
    refute errors_on(changeset)[:status]

    changeset = %Delivery{} |> Delivery.changeset(%{status: :error})
    refute errors_on(changeset)[:status]

    changeset = %Delivery{} |> Delivery.changeset(%{status: :rate_limited})
    refute errors_on(changeset)[:status]

    changeset = %Delivery{} |> Delivery.changeset(%{status: :timeout})
    refute errors_on(changeset)[:status]

    changeset = %Delivery{} |> Delivery.changeset(%{status: :skipped})
    refute errors_on(changeset)[:status]

    changeset = %Delivery{} |> Delivery.changeset(%{status: :cancelled})
    refute errors_on(changeset)[:status]
  end

  # test "hysteresis_pct must be a decimal" do
  #   changeset = %Delivery{} |> Delivery.changeset(%{hysteresis_pct: "abc"})
  #   assert "is invalid" in errors_on(changeset).hysteresis_pct
  # end

  # test "changeset has no hysteresis_pct errors if the hysteresis_pct is valid" do
  #   changeset = %Delivery{} |> Delivery.changeset(%{hysteresis_pct: 123})
  #   refute errors_on(changeset)[:hysteresis_pct]
  # end

  # test "changeset is invalid when symbol reference to unexisting symbol" do
  #   {:error, changeset} =
  #     %Delivery{} |> Delivery.changeset(%{symbol_id: 0, threshold: 123}) |> Repo.insert()

  #   assert "does not exist" in errors_on(changeset).symbol
  # end

  # test "an alert created if a symbol's reference is valid" do
  #   symbol_record =
  #     %Symbol{}
  #     |> Symbol.changeset(%{name: "ABC", provider: :binance, enabled: true})
  #     |> Repo.insert!()

  #   {:ok, alert} =
  #     %Delivery{}
  #     |> Delivery.changeset(%{symbol_id: symbol_record.id, threshold: 123})
  #     |> Repo.insert()

  #   assert alert.symbol_id == symbol_record.id
  # end

  # TODO: add tests for the many_to_many relationship
end
