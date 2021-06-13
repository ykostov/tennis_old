defmodule Tennis.PlayerTour do
  @moduledoc """
  The WebsiteTag context.
  """
  import Ecto.Query, warn: false
  alias Tennis.Repo
  alias Tennis.Tours.PlayerTour

  def update_playertour(%PlayerTour{} = playertour, attrs) do
    playertour
    |> PlayerTour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns the list of websites tags.
  """
end
