defmodule Tennis.Tours do
  @moduledoc """
  The Tours context.
  """

  import Ecto.Query, warn: false
  alias Tennis.Repo
  alias Tennis.Tours.Tour
  alias Tennis.Tours.PlayerTour



def toggle_player_tour(%Tour{} = tour, player_id) do
   tt = tour.id
   query = from(tp in PlayerTour, where: tp.tour_id == ^tt and tp.player_id == ^player_id)
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




  @doc """
  Returns the list of tours.

  ## Examples

      iex> list_tours()
      [%tour{}, ...]

  """
  def list_tours do
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
