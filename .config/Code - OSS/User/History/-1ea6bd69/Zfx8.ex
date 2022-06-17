defmodule Gwordle.WordleServer do
  use GenServer

  @impl true
  def init(_data) do
    wordle_day = Gwordle.ApiClients.WordleApi.get_wordle_day()
    schedule()
    {:ok, %{wordle_day: wordle_day}}
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
end
