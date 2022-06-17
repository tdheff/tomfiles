defmodule Gwordle.Competitions.LeagueParticipant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gwordle.Competitions.League
  alias Gwordle.Accounts.User

  schema "league_participants" do
    field :is_admin, :boolean
    belongs_to :league, League
    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(league_participant, attrs) do
    league_participant
    |> cast(attrs, [])
    |> validate_required([])
  end
end
