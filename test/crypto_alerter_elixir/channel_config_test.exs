defmodule CryptoAlerterElixir.ChannelConfigTest do
  use CryptoAlerterElixir.DataCase, async: true
  alias CryptoAlerterElixir.{ChannelConfig, Alert, Repo}

  test "kind must be one of the supported kinds" do
    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{kind: :random})
    assert "is invalid" in errors_on(changeset).kind
  end

  test "changeset has no kind errors if the kind is valid" do
    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{kind: :email})
    refute errors_on(changeset)[:kind]

    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{kind: :telegram})
    refute errors_on(changeset)[:kind]

    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{kind: :webhook})
    refute errors_on(changeset)[:kind]

    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{kind: :slack})
    refute errors_on(changeset)[:kind]
  end

  test "enabled must be a boolean" do
    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{enabled: 1})
    assert "is invalid" in errors_on(changeset).enabled
  end

  test "changeset has no enabled errors if the enabled is valid" do
    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{enabled: false})
    refute errors_on(changeset)[:enabled]
  end

  test "rate_limit_per_min must be an integer" do
    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{rate_limit_per_min: "abc"})
    assert "is invalid" in errors_on(changeset).rate_limit_per_min
  end

  test "changeset has no rate_limit_per_min errors if the rate_limit_per_min is valid" do
    changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{rate_limit_per_min: 123})
    refute errors_on(changeset)[:rate_limit_per_min]
  end

  # TODO: add tests for the has_one :email_config relationship
  # TODO: add tests for the many_to_many relationship
end
