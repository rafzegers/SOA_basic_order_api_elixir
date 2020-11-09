defmodule Orders.KlantContext.Klant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "klanten" do
    field :achternaam, :string
    field :adres, :string
    field :telefoon, :string
    field :voornaam, :string

    #timestamps()
  end

  @doc false
  def changeset(klant, attrs) do
    klant
    |> cast(attrs, [:voornaam, :achternaam, :telefoon, :adres])
    |> validate_required([:voornaam, :achternaam, :telefoon, :adres])
  end
end
