defmodule OrdersWeb.KlantController do
  use OrdersWeb, :controller

  alias Orders.KlantContext
  alias Orders.KlantContext.Klant

  action_fallback OrdersWeb.FallbackController

  def index(conn, _params) do
    klanten = KlantContext.list_klanten()
    render(conn, "index.json", klanten: klanten)
  end

  def create(conn, %{"klant" => klant_params}) do
    with {:ok, %Klant{} = klant} <- KlantContext.create_klant(klant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.klant_path(conn, :show, klant))
      |> render("show.json", klant: klant)
    end
  end

  def show(conn, %{"id" => id}) do
    klant = KlantContext.get_klant!(id)
    render(conn, "show.json", klant: klant)
  end

  def update(conn, %{"id" => id, "klant" => klant_params}) do
    klant = KlantContext.get_klant!(id)

    with {:ok, %Klant{} = klant} <- KlantContext.update_klant(klant, klant_params) do
      render(conn, "show.json", klant: klant)
    end
  end

  def delete(conn, %{"id" => id}) do
    klant = KlantContext.get_klant!(id)

    with {:ok, %Klant{}} <- KlantContext.delete_klant(klant) do
      send_resp(conn, :no_content, "")
    end
  end
end
