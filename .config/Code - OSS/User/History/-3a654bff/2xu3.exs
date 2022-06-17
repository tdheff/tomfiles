defmodule Gwordle.Repo.Migrations.CreateLeagueParticipants do
  use Ecto.Migration

  def change do
    create table(:league_participants) do
      add :is_admin, :boolean
      add :league_id, references(:leagues, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:league_participants, [:league_id])
    create index(:league_participants, [:user_id])
  end
end
