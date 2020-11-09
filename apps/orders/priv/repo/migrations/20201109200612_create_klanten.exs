defmodule Orders.Repo.Migrations.CreateKlanten do
  use Ecto.Migration

  def change do
    create table(:klanten) do
      add :voornaam, :string
      add :achternaam, :string
      add :telefoon, :string
      add :adres, :string

      #timestamps()
    end

  end
end
