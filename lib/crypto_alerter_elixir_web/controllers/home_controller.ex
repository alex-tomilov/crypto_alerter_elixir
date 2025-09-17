defmodule CryptoAlerterElixirWeb.HomeController do
  use CryptoAlerterElixirWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
