defmodule CryptoAlerterElixir.EmailChannelConfigTest do
  use CryptoAlerterElixir.DataCase, async: true
  alias CryptoAlerterElixir.{EmailChannelConfig, Alert, Repo}

  test "to must be a valid email address" do
    changeset = %EmailChannelConfig{} |> EmailChannelConfig.changeset(%{to: "test@example.com"})
    refute errors_on(changeset)[:to]

    changeset =
      %EmailChannelConfig{} |> EmailChannelConfig.changeset(%{to: "test@example.comcom"})

    assert "must be a valid email address" in errors_on(changeset).to
  end

  # TODO: add tests for the has_one :email_config relationship
end
