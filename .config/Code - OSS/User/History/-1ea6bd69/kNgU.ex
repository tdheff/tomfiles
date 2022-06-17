defmodule Gwordle.WordleServer do
  use GenServer

  @impl true
  def init(_data) do
    wordle_day = Gwordle.ApiClients.WordleApi.get_wordle_day()
    {:ok, %{wordle_day: wordle_day}}
  end

  defp schedule do
    Process.send_after(self(), :something, 1000 * 60)
  end
end
