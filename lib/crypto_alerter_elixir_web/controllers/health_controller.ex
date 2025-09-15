defmodule CryptoAlerterElixirWeb.HealthController do
  use CryptoAlerterElixirWeb, :controller

  def up(conn, _params) do
    json(conn, %{status: "OK"})
  end
end
