defmodule Tennis.Tours.GladiatorPlayer do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tennis.Tours.Gladiator
  alias Tennis.Players.Player

  schema "gladiator_player" do

    belongs_to :gladiator, Gladiator
    belongs_to :player, Player

    timestamps()
  end

  @doc false

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:gladiator_id, :player_id])
    |> validate_required([:gladiator_id, :player_id])
  end
end
