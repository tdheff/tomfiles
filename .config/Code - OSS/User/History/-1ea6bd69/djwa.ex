defmodule Gwordle.WordleServer do
  use GenServer

  # Client

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def get_wordle_day() do
    GenServer.call(__MODULE__, :get_wordle_day)
  end

  # Server

  @impl true
  def init(_data) do
    with {:ok, response} <- Gwordle.ApiClients.WordleApi.get_wordle_day(),
         {wordle_day, _} <- Integer.parse(response.body) do
      schedule()
      {:ok, %{wordle_day: wordle_day}}
    end
  end

  @impl true
  def handle_call(:get_wordle_day, _from, state) do
    {:reply, state.wordle_day, state}
  end

  @impl true
  def handle_info(:update_data, _state) do
    schedule()

    with {:ok, response} <- Gwordle.ApiClients.WordleApi.get_wordle_day(),
         {wordle_day, _} <- Integer.parse(response.body) do
      {:noreply, %{wordle_day: wordle_day}}
    end
  end

  defp schedule() do
    Process.send_after(self(), :update_data, 1000 * 60)
  end
end
