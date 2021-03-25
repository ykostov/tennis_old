defmodule Tennis.Tours.Gladiator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gladiators" do
    field :description, :string
    field :start_date, :naive_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(gladiator, attrs) do
    gladiator
    |> cast(attrs, [:title, :description, :start_date])
    |> validate_required([:title, :description, :start_date])
  end
end
