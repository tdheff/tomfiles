defmodule Gwordle.Repo.Migrations.CreateSubmissions do
  use Ecto.Migration

  def change do
    create table(:submissions) do
      add :wordle_day, :integer
      add :raw_submission, :string
      add :guesses, {:array, :integer}
      add :score, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:submissions, [:user_id])
    create unique_index(:submissions, [:user_id, :wordle_day])
  end
end
