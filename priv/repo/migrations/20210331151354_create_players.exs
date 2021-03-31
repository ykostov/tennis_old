defmodule Tennis.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :nickname, :string
      add :email, :string

      timestamps()
    end

  end
end
