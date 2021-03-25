defmodule Tennis.Repo.Migrations.CreateHomes do
  use Ecto.Migration

  def change do
    create table(:homes) do
      add :name, :string
      add :email, :string
      add :text, :string

      timestamps()
    end

  end
end
