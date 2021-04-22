defmodule Tennis.Gladiators.PlayersInTours do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players_in_tours" do
    field :gladiator_id, :decimal
    field :player_id, :decimal
    field :points, :decimal

    timestamps()
  end

  @doc false

  def changeset(players_in_tours, attrs) do
    @player
    |> cast(attrs, [:gladiator_id, :player_id, :points])
    |> validate_required([:gladiator_id, :player_id])
  end
end
