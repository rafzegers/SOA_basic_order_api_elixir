defmodule Orders.KlantContextTest do
  use Orders.DataCase

  alias Orders.KlantContext

  describe "klanten" do
    alias Orders.KlantContext.Klant

    @valid_attrs %{achternaam: "some achternaam", adres: "some adres", telefoon: "some telefoon", voornaam: "some voornaam"}
    @update_attrs %{achternaam: "some updated achternaam", adres: "some updated adres", telefoon: "some updated telefoon", voornaam: "some updated voornaam"}
    @invalid_attrs %{achternaam: nil, adres: nil, telefoon: nil, voornaam: nil}

    def klant_fixture(attrs \\ %{}) do
      {:ok, klant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> KlantContext.create_klant()

      klant
    end

    test "list_klanten/0 returns all klanten" do
      klant = klant_fixture()
      assert KlantContext.list_klanten() == [klant]
    end

    test "get_klant!/1 returns the klant with given id" do
      klant = klant_fixture()
      assert KlantContext.get_klant!(klant.id) == klant
    end

    test "create_klant/1 with valid data creates a klant" do
      assert {:ok, %Klant{} = klant} = KlantContext.create_klant(@valid_attrs)
      assert klant.achternaam == "some achternaam"
      assert klant.adres == "some adres"
      assert klant.telefoon == "some telefoon"
      assert klant.voornaam == "some voornaam"
    end

    test "create_klant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = KlantContext.create_klant(@invalid_attrs)
    end

    test "update_klant/2 with valid data updates the klant" do
      klant = klant_fixture()
      assert {:ok, %Klant{} = klant} = KlantContext.update_klant(klant, @update_attrs)
      assert klant.achternaam == "some updated achternaam"
      assert klant.adres == "some updated adres"
      assert klant.telefoon == "some updated telefoon"
      assert klant.voornaam == "some updated voornaam"
    end

    test "update_klant/2 with invalid data returns error changeset" do
      klant = klant_fixture()
      assert {:error, %Ecto.Changeset{}} = KlantContext.update_klant(klant, @invalid_attrs)
      assert klant == KlantContext.get_klant!(klant.id)
    end

    test "delete_klant/1 deletes the klant" do
      klant = klant_fixture()
      assert {:ok, %Klant{}} = KlantContext.delete_klant(klant)
      assert_raise Ecto.NoResultsError, fn -> KlantContext.get_klant!(klant.id) end
    end

    test "change_klant/1 returns a klant changeset" do
      klant = klant_fixture()
      assert %Ecto.Changeset{} = KlantContext.change_klant(klant)
    end
  end
end
