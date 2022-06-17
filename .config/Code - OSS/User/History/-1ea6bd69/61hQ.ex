defmodule Gwordle.WordleServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(_data) do
    wordle_day = Gwordle.ApiClients.WordleApi.get_wordle_day()
    schedule()
    {:ok, %{wordle_day: wordle_day}}
  end

  @impl true
  def handle_call(:get_wordle_day, _from, state) do
    {:reply, state.wordle_day}
  end

  @impl true
  def handle_info(:update_data, _state) do
    schedule()
    wordle_day = Gwordle.ApiClients.WordleApi.get_wordle_day()
    {:noreply, %{wordle_day: wordle_day}}
  end

  defp schedule() do
    Process.send_after(self(), :update_data, 1000 * 60)
  end

  def get_wordle_day() do
    GenServer.call(__MODULE__, :get_wordle_day)
  end
end
