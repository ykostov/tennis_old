defmodule Tennis.Repo.Migrations.AddToursTable do
  use Ecto.Migration

  def change do
    create table(:tours) do
      add :title, :string
      add :description, :string
      add :start_date, :naive_datetime

      timestamps()
    end
  end
end
