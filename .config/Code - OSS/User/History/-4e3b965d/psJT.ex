defmodule Gwordle.Matches do
  @moduledoc """
  The Matches context.
  """

  import Ecto.Query, warn: false
  alias Gwordle.Repo

  alias Gwordle.Competitions
  alias Gwordle.Matches.Match
  alias Gwordle.Matches.MatchParticipant
  alias Gwordle.Matches.Matchday
  alias Gwordle.Matches.MatchdaySubmission

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches do
    Repo.all(Match)
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id), do: Repo.get!(Match, id)

  @doc """
  Gets the single most recent match for a league.

  Returns nil if no such match exists.

  ## Examples

      iex> get_most_recent_league_match(123)
      %Match{}

      iex> get_most_recent_league_match(456)
      nil

  """
  def get_most_recent_league_match(league_id) do
    Repo.one(
      from m in Match,
        where: m.league_id == ^league_id,
        order_by: [desc: m.match_index],
        limit: 1,
        preload: [:matchdays, match_participants: :user]
    )
  end

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}, user_ids \\ []) do
    with {:ok, response} <- Gwordle.ApiClients.WordleApi.get_wordle_day(),
         {wordle_day, _} <- Integer.parse(response.body) do
      matchdays =
        for n <- wordle_day..(wordle_day + 13) do
          n * n

          %Matchday{}
          |> Matchday.changeset(%{wordle_index: n})
        end

      participants =
        Enum.map(user_ids, fn user_id ->
          %MatchParticipant{user_id: user_id, score: 0}
        end)

      IO.inspect(participants)

      %Match{matchdays: matchdays, match_participants: participants}
      |> Match.changeset(attrs)
      |> Repo.insert()
    else
      err ->
        raise err
    end
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: n`ew_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{data: %Match{}}

  """
  def change_match(%Match{} = match, attrs \\ %{}) do
    Match.changeset(match, attrs)
  end

  alias Gwordle.Matches.Matchday

  @doc """
  Returns the list of weeks.

  ## Examples

      iex> list_weeks()
      [%Matchday{}, ...]

  """
  def list_weeks do
    Repo.all(Matchday)
  end

  @doc """
  Gets a single week.

  Raises `Ecto.NoResultsError` if the Matchday does not exist.

  ## Examples

      iex> get_week!(123)
      %Matchday{}

      iex> get_week!(456)
      ** (Ecto.NoResultsError)

  """
  def get_week!(id), do: Repo.get!(Matchday, id)

  @doc """
  Creates a week.

  ## Examples

      iex> create_week(%{field: value})
      {:ok, %Matchday{}}

      iex> create_week(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_week(attrs \\ %{}) do
    %Matchday{}
    |> Matchday.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a week.

  ## Examples

      iex> update_week(week, %{field: new_value})
      {:ok, %Matchday{}}

      iex> update_week(week, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_week(%Matchday{} = week, attrs) do
    week
    |> Matchday.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a week.

  ## Examples

      iex> delete_week(week)
      {:ok, %Matchday{}}

      iex> delete_week(week)
      {:error, %Ecto.Changeset{}}

  """
  def delete_week(%Matchday{} = week) do
    Repo.delete(week)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking week changes.

  ## Examples

      iex> change_week(week)
      %Ecto.Changeset{data: %Matchday{}}

  """
  def change_week(%Matchday{} = week, attrs \\ %{}) do
    Matchday.changeset(week, attrs)
  end

  def get_matchday_submission_by_matchday_and_user(matchday_id, user_id) do
    Repo.get_by(MatchdaySubmission, %{matchday_id: matchday_id, user_id: user_id})
  end

  def is_user_in_match(match_id, user_id) do
    Repo.exists?(
      from mp in MatchParticipant, where: mp.user_id == ^user_id and mp.match_id == ^match_id
    )
  end
end
