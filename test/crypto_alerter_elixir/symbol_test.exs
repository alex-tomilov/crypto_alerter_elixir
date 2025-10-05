defmodule CryptoAlerterElixir.SymbolTest do
  use CryptoAlerterElixir.DataCase, async: true
  alias CryptoAlerterElixir.{Symbol, Repo}

  @valid_attrs %{name: "ABC", provider: :binance, enabled: true}

  test "name must be at least 3 characters long" do
    changeset = Symbol.changeset(%Symbol{}, %{name: "AB"})
    assert "should be at least 3 character(s)" in errors_on(changeset).name
  end

  test "name must be less than 255 characters long" do
    changeset = Symbol.changeset(%Symbol{}, %{name: String.duplicate("A", 256)})
    assert "should be at most 255 character(s)" in errors_on(changeset).name
  end

  test "changeset has no name errors if the name is valid" do
    changeset = Symbol.changeset(%Symbol{}, %{name: "ABC"})
    assert false == Enum.member?(changeset.errors, :name)
  end

  test "changeset is invalid if a name per a provide is used already" do
    %Symbol{} |> Symbol.changeset(@valid_attrs) |> Repo.insert!()
    another_symbol = %Symbol{} |> Symbol.changeset(@valid_attrs)
    assert {:error, changeset} = Repo.insert(another_symbol)
    assert "has already been taken" in errors_on(changeset).name
  end
end
