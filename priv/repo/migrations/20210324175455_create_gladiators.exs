defmodule Tennis.Repo.Migrations.CreateGladiators do
  use Ecto.Migration

  def change do
    create table(:gladiators) do
      add :title, :string
      add :description, :string
      add :start_date, :naive_datetime

      timestamps()
    end

  end
end
