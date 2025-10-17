defmodule CryptoAlerterElixir.AlertChannelTest do
  use CryptoAlerterElixir.DataCase, async: true
  alias CryptoAlerterElixir.{AlertChannel, Alert, Repo}

  test "priority must be one of the supported prioritys" do
    changeset = %AlertChannel{} |> AlertChannel.changeset(%{priority: :random})
    assert "is invalid" in errors_on(changeset).priority
  end

  test "changeset has no priority errors if the priority is valid" do
    changeset = %AlertChannel{} |> AlertChannel.changeset(%{priority: :low})
    refute errors_on(changeset)[:priority]

    changeset = %AlertChannel{} |> AlertChannel.changeset(%{priority: :medium})
    refute errors_on(changeset)[:priority]

    changeset = %AlertChannel{} |> AlertChannel.changeset(%{priority: :high})
    refute errors_on(changeset)[:priority]
  end

  test "enabled must be a boolean" do
    changeset = %AlertChannel{} |> AlertChannel.changeset(%{enabled: 1})
    assert "is invalid" in errors_on(changeset).enabled
  end

  test "changeset has no enabled errors if the enabled is valid" do
    changeset = %AlertChannel{} |> AlertChannel.changeset(%{enabled: false})
    refute errors_on(changeset)[:enabled]
  end

  # test "rate_limit_per_min must be an integer" do
  #   changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{rate_limit_per_min: "abc"})
  #   assert "is invalid" in errors_on(changeset).rate_limit_per_min
  # end

  # test "changeset has no rate_limit_per_min errors if the rate_limit_per_min is valid" do
  #   changeset = %ChannelConfig{} |> ChannelConfig.changeset(%{rate_limit_per_min: 123})
  #   refute errors_on(changeset)[:rate_limit_per_min]
  # end

  # TODO: add tests for the has_one :email_config relationship
  # TODO: add tests for the many_to_many relationship
end
