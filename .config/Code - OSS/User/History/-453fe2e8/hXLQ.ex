defmodule Gwordle.Competitions do
  @moduledoc """
  The Competitions context.
  """

  import Ecto.Query, warn: false
  alias Gwordle.Repo

  alias Gwordle.Competitions.League
  alias Gwordle.Competitions.LeagueParticipant

  @doc """
  Returns the list of leagues that a user belongs to.

  ## Examples

      iex> list_leagues(123)
      [%League{}, ...]

  """
  def list_user_leagues(user_id) do
    Repo.all(
      from l in League, join: lp in assoc(l, :league_participants), where: lp.user_id == ^user_id
    )
  end

  @doc """
  Gets a single league.

  Raises `Ecto.NoResultsError` if the League does not exist.

  ## Examples

      iex> get_league!(123)
      %League{}

      iex> get_league!(456)
      ** (Ecto.NoResultsError)

  """
  def get_league!(id), do: Repo.get!(League, id) |> Repo.preload([:league_participants])

  @doc """
  Creates a league.

  ## Examples

      iex> create_league(%{field: value})
      {:ok, %League{}}

      iex> create_league(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_league(attrs \\ %{}, user_to_add) do
    %League{league_participants: [%LeagueParticipant{user: user_to_add}]}
    |> League.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a league.

  ## Examples

      iex> update_league(league, %{field: new_value})
      {:ok, %League{}}

      iex> update_league(league, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_league(%League{} = league, attrs) do
    league
    |> League.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a league.

  ## Examples

      iex> delete_league(league)
      {:ok, %League{}}

      iex> delete_league(league)
      {:error, %Ecto.Changeset{}}

  """
  def delete_league(%League{} = league) do
    Repo.delete(league)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking league changes.

  ## Examples

      iex> change_league(league)
      %Ecto.Changeset{data: %League{}}

  """
  def change_league(%League{} = league, attrs \\ %{}) do
    League.changeset(league, attrs)
  end

  def is_user_in_league(league_id, user_id) do
    Repo.exists?(
      from mp in LeagueParticipant,
        where: mp.user_id == ^user_id and mp.league_id == ^league_id
    )
  end

  def add_user_to_league(league_id, user_id) do
    %LeagueParticipant{league_id: league_id, user_id: user_id}
    |> Repo.insert()
  end
end
