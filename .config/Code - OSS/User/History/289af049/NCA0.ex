defmodule GwordleWeb.LeagueLive.FormComponent do
  use GwordleWeb, :live_component

  alias Gwordle.Competitions

  @impl true
  def update(%{league: league} = assigns, socket) do
    changeset = Competitions.change_league(league)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:current_user, socket.assigns.current_user)}
  end

  @impl true
  def handle_event("validate", %{"league" => league_params}, socket) do
    changeset =
      socket.assigns.league
      |> Competitions.change_league(league_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"league" => league_params}, socket) do
    save_league(socket, socket.assigns.action, league_params)
  end

  defp save_league(socket, :edit, league_params) do
    case Competitions.update_league(socket.assigns.league, league_params) do
      {:ok, _league} ->
        {:noreply,
         socket
         |> put_flash(:info, "League updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_league(socket, :new, league_params) do
    case Competitions.create_league(league_params, socket.assigns.current_user) do
      {:ok, _league} ->
        {:noreply,
         socket
         |> put_flash(:info, "League created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
