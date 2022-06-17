defmodule Gwordle.Submissions do
  import Ecto.Query, warn: false

  alias Gwordle.Repo
  alias Gwordle.Submissions.Submission

  @doc """
  Creates a submission based on raw text copied from Wordle

  Example submission:

  Wordle 362 3/6

  ⬜⬜⬜⬜⬜
  ⬜🟨🟨🟨⬜
  🟩🟩🟩🟩🟩

  This function parses the submission to create the needed submission.

    ## Examples

      iex> create_submission(<a valid submission>)
      {:ok, %Submission{}}

      iex> create_submission(<invalid submission>)
      {:error, "Failed to parse submission. Try to copy paste exactly from Wordle."}

      iex> create_submission(<already submitted>)
      {:error, "You have already submitted your results today!"}
  """
  def create_submission(user_id, raw_submission) do
    stripped_submission = String.replace(raw_submission, "\n", "")
    capture_regex = ~r/Wordle (?<day>[0-9]*) (?<score>[1-6X])..(?<guesses>.*)/
    captures = Regex.named_captures(capture_regex, stripped_submission)

    score =
      case captures["score"] do
        "X" ->
          -1

        num ->
          {val, ""} = Integer.parse(num)
          val
      end

    {day, ""} = Integer.parse(captures["day"])

    IO.inspect(captures)

    guesses =
      Enum.map(String.graphemes(captures["guesses"]), fn c ->
        case c do
          "⬜" -> 0
          "🟨" -> 1
          "🟩" -> 2
        end
      end)

    %Submission{
      wordle_day: day,
      score: score,
      user_id: user_id,
      raw_submission: raw_submission,
      guesses: guesses
    }
    |> Submission.changeset(%{})
    |> Repo.insert()
  end

  def get_submission_by_user_id_wordle_day(user_id, wordle_day) do
    Repo.one(from s in Submission, where: s.user_id == ^user_id and s.wordle_day == ^wordle_day)
  end
end
