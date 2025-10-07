defmodule CryptoAlerterElixir.AlertTest do
  use CryptoAlerterElixir.DataCase, async: true
  alias CryptoAlerterElixir.{Alert, Repo}

  test "direction must be one of the supported directions" do
    changeset = %Alert{} |> Alert.changeset(%{direction: :random})
    assert "is invalid" in errors_on(changeset).direction
  end

  test "changeset has no direction errors if the direction is valid" do
    changeset = %Alert{} |> Alert.changeset(%{direction: :above})
    refute errors_on(changeset)[:direction]

    changeset = %Alert{} |> Alert.changeset(%{direction: :below})
    refute errors_on(changeset)[:direction]
  end

  test "threshold must be a decimal" do
    changeset = %Alert{} |> Alert.changeset(%{threshold: "abc"})
    assert "is invalid" in errors_on(changeset).threshold
  end

  test "changeset has no threshold errors if the threshold is valid" do
    changeset = %Alert{} |> Alert.changeset(%{threshold: 123})
    refute errors_on(changeset)[:threshold]
  end

  test "mode must be one of the supported modes" do
    changeset = %Alert{} |> Alert.changeset(%{mode: :random})
    assert "is invalid" in errors_on(changeset).mode
  end

  test "changeset has no mode errors if the mode is valid" do
    changeset = %Alert{} |> Alert.changeset(%{mode: :oneshot})
    refute errors_on(changeset)[:mode]

    changeset = %Alert{} |> Alert.changeset(%{mode: :persistent})
    refute errors_on(changeset)[:mode]
  end

  test "cooldown_seconds must be an integer" do
    changeset = %Alert{} |> Alert.changeset(%{cooldown_seconds: "abc"})
    assert "is invalid" in errors_on(changeset).cooldown_seconds
  end

  test "changeset has no cooldown_seconds errors if the cooldown_seconds is valid" do
    changeset = %Alert{} |> Alert.changeset(%{cooldown_seconds: 123})
    refute errors_on(changeset)[:cooldown_seconds]
  end

  test "hysteresis_pct must be a decimal" do
    changeset = %Alert{} |> Alert.changeset(%{hysteresis_pct: "abc"})
    assert "is invalid" in errors_on(changeset).hysteresis_pct
  end

  test "changeset has no hysteresis_pct errors if the hysteresis_pct is valid" do
    changeset = %Alert{} |> Alert.changeset(%{hysteresis_pct: 123})
    refute errors_on(changeset)[:hysteresis_pct]
  end
end
