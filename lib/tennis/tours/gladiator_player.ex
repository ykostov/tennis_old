defmodule Tennis.Tours.GladiatorPlayer do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tennis.Tours.Gladiators
  alias Tennis.Players.Player

  schema "gladiator_player" do

    belongs_to :gladiators, Gladiators
    belongs_to :player, Player

    timestamps()
  end

  @doc false

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:gladiators_id, :player_id])
    |> validate_required([:gladiators_id, :player_id])
  end
end
