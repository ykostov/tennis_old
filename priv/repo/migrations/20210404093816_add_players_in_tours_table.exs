defmodule Tennis.Repo.Migrations.AddPlayersInToursTable do
  use Ecto.Migration

  def change do
    create table(:players_in_tours) do
      add :gladiators, references(:players)
      add :players, references(:gladiators)
      add :points, :decimal
      timestamps()

    end

    create unique_index(:players_in_tours, [:players, :gladiators])


  end
end
