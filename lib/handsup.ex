defmodule Handsup do
  @moduledoc """
    Simple chat app
  """
  use Application
  alias Handsup.Endpoint

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Handsup.Repo, []),
      # Start the endpoint when the application starts
      supervisor(Handsup.Endpoint, []),
      # Start your own worker by calling:
      #   Handsup.Worker.start_link(arg1, arg2, arg3)
      # worker(Handsup.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Handsup.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Endpoint.config_change(changed, removed)
    :ok
  end
end
