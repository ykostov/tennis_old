defmodule Tennis.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tennis.Tours.Gladiator

  schema "players" do
    field :email, :string
    field :name, :string
    field :nickname, :string

    timestamps()

    many_to_many(
      :gladiator,
      Gladiator,
      join_through: "gladiator_player",
      on_replace: :delete
    )
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :nickname, :email])
    |> validate_required([:name, :nickname, :email])
  end
end
