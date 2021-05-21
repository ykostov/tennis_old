defmodule Tennis.Tours do
  @moduledoc """
  The Tours context.
  """

  import Ecto.Query, warn: false
  alias Tennis.Repo

  alias Tennis.Tours.Gladiator


def toggle_gladiators_players(%Gladiator{} = gladiator, player_id) do
   ww = gladiator.id
   query = from(wt in PlayerTour, where: wt.gladiator_id == ^ww and wt.player_id == ^player_id)
   assoc = Repo.one(query)
   # require IEx; IEx.pry
   if assoc == nil do
     %PlayerTour{}
     |> PlayerTour.changeset(%{gladiator_id: gladiator.id, player_id: player_id})
     |> Repo.insert()
   else
     Repo.delete(assoc)
   end
 end


def player_tour(%Tours{} = tour) do
  tour_id = tour.id
  query_join_table = from(wt in PlayerTour, where: wt.tour_id == ^tour_id)
  Repo.all(query_join_table)
end


  @doc """
  Returns the list of gladiators.

  ## Examples

      iex> list_gladiators()
      [%Gladiator{}, ...]

  """
  def list_gladiators do
    Repo.all(Gladiator)
  end

  @doc """
  Gets a single gladiator.

  Raises `Ecto.NoResultsError` if the Gladiator does not exist.

  ## Examples

      iex> get_gladiator!(123)
      %Gladiator{}

      iex> get_gladiator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gladiator!(id) do
    Repo.get!(Gladiator, id)
    |> Repo.preload(:players)
  end

  @doc """
  Creates a gladiator.

  ## Examples

      iex> create_gladiator(%{field: value})
      {:ok, %Gladiator{}}

      iex> create_gladiator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gladiator(attrs \\ %{}) do
    %Gladiator{}
    |> Gladiator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gladiator.

  ## Examples

      iex> update_gladiator(gladiator, %{field: new_value})
      {:ok, %Gladiator{}}

      iex> update_gladiator(gladiator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gladiator(%Gladiator{} = gladiator, attrs) do
    gladiator
    |> Gladiator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gladiator.

  ## Examples

      iex> delete_gladiator(gladiator)
      {:ok, %Gladiator{}}

      iex> delete_gladiator(gladiator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gladiator(%Gladiator{} = gladiator) do
    Repo.delete(gladiator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gladiator changes.

  ## Examples

      iex> change_gladiator(gladiator)
      %Ecto.Changeset{data: %Gladiator{}}

  """
  def change_gladiator(%Gladiator{} = gladiator, attrs \\ %{}) do
    Gladiator.changeset(gladiator, attrs)
  end
end
