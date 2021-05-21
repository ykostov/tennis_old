defmodule Tennis.Tours.PlayerTour do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tennis.Tours
  alias Tennis.Players.Player
  alias Tennis.Tours.Gladiator

  schema "player_tour" do

    belongs_to :tours, Gladiator
    belongs_to :players, Player

    timestamps()
  end

  @doc false

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:gladiator_id, :player_id])
    |> validate_required([:gladiator_id, :player_id])
  end
end
