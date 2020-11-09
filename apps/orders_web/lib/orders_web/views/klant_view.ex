defmodule OrdersWeb.KlantView do
  use OrdersWeb, :view
  alias OrdersWeb.KlantView

  def render("index.json", %{klanten: klanten}) do
    %{data: render_many(klanten, KlantView, "klant.json")}
  end

  def render("show.json", %{klant: klant}) do
    %{data: render_one(klant, KlantView, "klant.json")}
  end

  def render("klant.json", %{klant: klant}) do
    %{id: klant.id,
      voornaam: klant.voornaam,
      achternaam: klant.achternaam,
      telefoon: klant.telefoon,
      adres: klant.adres}
  end
end
