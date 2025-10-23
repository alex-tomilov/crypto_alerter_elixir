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

  # TODO: add tests for the belongs_to :channel_config relationship
end
