defmodule Tennis.Repo.Migrations.AddPlayersInToursTable do
  use Ecto.Migration

  def change do

      create table(:players_in_tours, primary_key: false) do
        add(:gladiator_id, references(:gladiators, on_delete: :delete_all), primary_key: true)
        add(:player_id, references(:players, on_delete: :delete_all), primary_key: true)
        add(:point_id, references(:points, on_delete: :delete_all), primary_key: true)

        timestamps()
      end

      create(index(:gladiator_tag, [:gladiator_id]))
      create(index(:gladiator_tag, [:player_id]))
      create(index(:gladiator_tag, [:point_id]))
    end
  end
