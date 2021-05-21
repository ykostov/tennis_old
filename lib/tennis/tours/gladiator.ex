defmodule Tennis.Tours.Gladiator do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tennis.Players.Player
  alias Tennis.Tours.Gladiator

  schema "gladiators" do
    field :description, :string
    field :start_date, :naive_datetime
    field :title, :string

    timestamps()

    many_to_many(
      :players,
      Player,
      join_through: "player_tour",
      on_replace: :delete
    )
  end

  @doc false
  def changeset(gladiator, attrs) do
    gladiator
    |> cast(attrs, [:title, :description, :start_date])
    |> validate_required([:title, :description, :start_date])
  end
end
