defmodule GwordleWeb.HomeLive.Index do
  use GwordleWeb, :live_view

  alias Gwordle.Submissions
  alias Gwordle.Competitions
  alias Gwordle.WordleServer

  @impl true
  def mount(_params, session, socket) do
    current_user = session["current_user"]
    wordle_day = WordleServer.get_wordle_day()

    submission =
      Submissions.get_submission_by_user_id_wordle_day(
        current_user.id,
        wordle_day
      )

    rows =
      if !!submission do
        count = Enum.count(submission.guesses)
        padding = for _n <- 1..(30 - count), do: -1

        submission.guesses
        |> Enum.concat(padding)
        |> Enum.chunk_every(5)
      else
        []
      end

    socket =
      socket
      |> assign(:current_user, current_user)
      |> assign(:leagues, list_leagues(current_user.id))
      |> assign(:submission, submission)
      |> assign(:rows, rows)
      |> assign(:wordle_day, wordle_day)

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  # defp apply_action(socket, :edit, %{"id" => id}) do
  #   socket
  #   |> assign(:page_title, "Edit League")
  #   |> assign(:league, Competitions.get_league!(id))
  # end

  # defp apply_action(socket, :new, _params) do
  #   IO.inspect(socket)

  #   socket
  #   |> assign(:page_title, "New League")
  #   |> assign(:league, %League{})
  #   |> assign(:current_user, socket.assigns.current_user)
  # end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Leagues")
    |> assign(:league, nil)
  end

  # @impl true
  # def handle_event("delete", %{"id" => id}, socket) do
  #   league = Competitions.get_league!(id)
  #   {:ok, _} = Competitions.delete_league(league)

  #   {:noreply, assign(socket, :leagues, list_leagues(socket.assigns.current_user.id))}
  # end

  defp list_leagues(user_id) do
    Competitions.list_user_leagues(user_id)
  end
end
