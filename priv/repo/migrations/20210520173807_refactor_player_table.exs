defmodule Tennis.Repo.Migrations.RefactorPlayerTable do
  use Ecto.Migration

  def change do

    alter table("players_in_tours") do
      add(:player_id, references(:player, on_delete: :delete_all))
      add(:tour_id, references(:gladiator, on_delete: :delete_all))
      add(:id, :bigserial, primary_key: true)
    end

    create unique_index(:players_in_tours, [:player_id, :tour_id], name: :player_tour_unique_index)


  end
end
