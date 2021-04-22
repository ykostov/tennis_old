defmodule Tennis.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tennis.Tours.Gladiators

  schema "players" do
    field :email, :string
    field :name, :string
    field :nickname, :string

    timestamps()

    many_to_many(
      :gladiators,
      Gladiators,
      join_through: "players_in_tours",
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
