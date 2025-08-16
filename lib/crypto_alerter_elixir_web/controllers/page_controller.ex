defmodule CryptoAlerterElixirWeb.PageController do
  use CryptoAlerterElixirWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
