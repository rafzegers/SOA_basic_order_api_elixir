defmodule OrdersWeb.KlantControllerTest do
  use OrdersWeb.ConnCase

  alias Orders.KlantContext
  alias Orders.KlantContext.Klant

  @create_attrs %{
    achternaam: "some achternaam",
    adres: "some adres",
    telefoon: "some telefoon",
    voornaam: "some voornaam"
  }
  @update_attrs %{
    achternaam: "some updated achternaam",
    adres: "some updated adres",
    telefoon: "some updated telefoon",
    voornaam: "some updated voornaam"
  }
  @invalid_attrs %{achternaam: nil, adres: nil, telefoon: nil, voornaam: nil}

  def fixture(:klant) do
    {:ok, klant} = KlantContext.create_klant(@create_attrs)
    klant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all klanten", %{conn: conn} do
      conn = get(conn, Routes.klant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create klant" do
    test "renders klant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.klant_path(conn, :create), klant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.klant_path(conn, :show, id))

      assert %{
               "id" => id,
               "achternaam" => "some achternaam",
               "adres" => "some adres",
               "telefoon" => "some telefoon",
               "voornaam" => "some voornaam"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.klant_path(conn, :create), klant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update klant" do
    setup [:create_klant]

    test "renders klant when data is valid", %{conn: conn, klant: %Klant{id: id} = klant} do
      conn = put(conn, Routes.klant_path(conn, :update, klant), klant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.klant_path(conn, :show, id))

      assert %{
               "id" => id,
               "achternaam" => "some updated achternaam",
               "adres" => "some updated adres",
               "telefoon" => "some updated telefoon",
               "voornaam" => "some updated voornaam"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, klant: klant} do
      conn = put(conn, Routes.klant_path(conn, :update, klant), klant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete klant" do
    setup [:create_klant]

    test "deletes chosen klant", %{conn: conn, klant: klant} do
      conn = delete(conn, Routes.klant_path(conn, :delete, klant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.klant_path(conn, :show, klant))
      end
    end
  end

  defp create_klant(_) do
    klant = fixture(:klant)
    {:ok, klant: klant}
  end
end
