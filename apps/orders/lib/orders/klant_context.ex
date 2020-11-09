defmodule Orders.KlantContext do
  @moduledoc """
  The KlantContext context.
  """

  import Ecto.Query, warn: false
  alias Orders.Repo

  alias Orders.KlantContext.Klant

  @doc """
  Returns the list of klanten.

  ## Examples

      iex> list_klanten()
      [%Klant{}, ...]

  """
  def list_klanten do
    Repo.all(Klant)
  end

  @doc """
  Gets a single klant.

  Raises `Ecto.NoResultsError` if the Klant does not exist.

  ## Examples

      iex> get_klant!(123)
      %Klant{}

      iex> get_klant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_klant!(id), do: Repo.get!(Klant, id)

  @doc """
  Creates a klant.

  ## Examples

      iex> create_klant(%{field: value})
      {:ok, %Klant{}}

      iex> create_klant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_klant(attrs \\ %{}) do
    %Klant{}
    |> Klant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a klant.

  ## Examples

      iex> update_klant(klant, %{field: new_value})
      {:ok, %Klant{}}

      iex> update_klant(klant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_klant(%Klant{} = klant, attrs) do
    klant
    |> Klant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a klant.

  ## Examples

      iex> delete_klant(klant)
      {:ok, %Klant{}}

      iex> delete_klant(klant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_klant(%Klant{} = klant) do
    Repo.delete(klant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking klant changes.

  ## Examples

      iex> change_klant(klant)
      %Ecto.Changeset{source: %Klant{}}

  """
  def change_klant(%Klant{} = klant) do
    Klant.changeset(klant, %{})
  end
end
