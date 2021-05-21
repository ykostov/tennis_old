defmodule Tennis.Tours.Tour do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tennis.Players.Player
  alias Tennis.Tours.Tour

  schema "tours" do
    field :title, :string
    field :description, :string
    field :start_date, :naive_datetime


    timestamps()

    many_to_many(
      :players,
      Player,
      join_through: "player_tour",
      on_replace: :delete
    )
  end

  @doc false
  def changeset(tour, attrs) do
    tour
    |> cast(attrs, [:title, :description, :start_date])
    |> validate_required([:title, :description, :start_date])
  end
end
