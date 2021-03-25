defmodule Tennis.Pages.Home do
  use Ecto.Schema
  import Ecto.Changeset

  schema "homes" do
    field :email, :string
    field :name, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(home, attrs) do
    home
    |> cast(attrs, [:name, :email, :text])
    |> validate_required([:name, :email, :text])
  end
end
