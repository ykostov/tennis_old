defmodule Tennis.Gladiators.PlayersInTours do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players_in_tours" do

    field :gladiator_id, :decimal
    field :player_id, :decimal

    timestamps()
  end

  @doc false

  def changeset(players_in_tours, attrs) do
    player
    |> cast(attrs, [:name, :nickname, :email])
    |> validate_required([:name, :nickname, :email])
  end
end
