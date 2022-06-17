defmodule Gwordle.Submissions do
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
  def create_submission(user_id, raw_text) do
    capture_regex = ~r/Wordle (?<day>[0-9]*) (?<score>[1-6X])..(?<rows>.*)/
    captures = Regex.named_captures(capture_regex, raw_text)

    score =
      case captures["score"] do
        "X" ->
          -1

        num ->
          {val, ""} = Integer.parse(num)
          val
      end

    {day, ""} = Integer.parse(captures["day"])
  end
end
