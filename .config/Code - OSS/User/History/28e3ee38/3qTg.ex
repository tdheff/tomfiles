defmodule Gwordle.Submissions.Submission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "submissions" do
    field :guesses, {:array, :integer}
    field :raw_submission, :string
    field :score, :integer
    field :wordle_day, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(submission, attrs) do
    submission
    |> cast(attrs, [:wordle_day, :raw_submission, :guesses, :score])
    |> validate_required([:wordle_day, :raw_submission, :guesses, :score])
    |> unique_constraint([:user_id, :wordle_day])
  end
end
