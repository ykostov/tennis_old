defmodule Tennis.Tours do
  @moduledoc """
  The Tours context.
  """

  import Ecto.Query, warn: false
  alias Tennis.Repo

  alias Tennis.Tours.Gladiator


  def upsert_players_in_tours(gladiator, player_id) do
   player =
     Players
     |> where([player], player.id == ^player_id)
     |> Repo.all()

   with {:ok, struct} <-
     gladiator
     |> Gladiators.changeset_update_players(gladiator, player)
     |> Repo.update() do
     {:ok, Gladiator.get_gladiator(gladiator.id) }
   else
     error ->
       error
   end
 end

 def get_tag_status_for(website, tag_id) do
   status = from(wt in WebsiteTag, where: wt.website_id == ^website.id and wt.tag_id == ^tag_id)
   |> Repo.one
   if status, do: :true, else: :false
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
  def get_gladiator!(id), do: Repo.get!(Gladiator, id)

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
