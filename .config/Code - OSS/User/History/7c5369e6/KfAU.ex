defmodule Gwordle.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gwordle.Repo,
      # Start the Telemetry supervisor
      GwordleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gwordle.PubSub},
      # Start the Endpoint (http/https)
      GwordleWeb.Endpoint,
      # Start a worker by calling: Gwordle.Worker.start_link(arg)
      # {Gwordle.Worker, arg}
      Gwordle.ApiClients.WordleApi.child_spec(),
      Gwordle.WordleServer
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gwordle.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GwordleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
