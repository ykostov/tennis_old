defmodule Tennis.Tours do
  @moduledoc """
  The Tours context.
  """

  import Ecto.Query, warn: false
  alias Tennis.Repo
  alias Tennis.Tours.Tour



def toggle_player_tour(%Tour{} = tour, player_id) do
   ww = tour.id
   query = from(wt in PlayerTour, where: wt.tour_id == ^ww and wt.player_id == ^player_id)
   assoc = Repo.one(query)
   # require IEx; IEx.pry
   if assoc == nil do
     %PlayerTour{}
     |> PlayerTour.changeset(%{tour_id: tour.id, player_id: player_id})
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
  Returns the list of tours.

  ## Examples

      iex> list_tours()
      [%tour{}, ...]

  """
  def list_tour do
    Repo.all(Tour)
  end

  @doc """
  Gets a single tour.

  Raises `Ecto.NoResultsError` if the tour does not exist.

  ## Examples

      iex> get_tour!(123)
      %tour{}

      iex> get_tour!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tour!(id) do
    Repo.get!(Tour, id)
    |> Repo.preload(:players)
  end

  @doc """
  Creates a tour.

  ## Examples

      iex> create_tour(%{field: value})
      {:ok, %tour{}}

      iex> create_tour(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tour(attrs \\ %{}) do
    %Tour{}
    |> Tour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tour.

  ## Examples

      iex> update_tour(tour, %{field: new_value})
      {:ok, %tour{}}

      iex> update_tour(tour, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tour(%Tour{} = tour, attrs) do
    tour
    |> Tour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tour.

  ## Examples

      iex> delete_tour(tour)
      {:ok, %tour{}}

      iex> delete_tour(tour)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tour(%Tour{} = tour) do
    Repo.delete(tour)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tour changes.

  ## Examples

      iex> change_tour(tour)
      %Ecto.Changeset{data: %tour{}}

  """
  def change_tour(%Tour{} = tour, attrs \\ %{}) do
    Tour.changeset(tour, attrs)
  end
end
