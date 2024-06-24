defmodule UnrealReplicationEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: UnrealReplicationEx.Worker.start_link(arg)
      # {UnrealReplicationEx.Worker, arg}
    ]

    Tethys.Springs.UdpSpring.seed(%{address: %{port: 4444}})

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UnrealReplicationEx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
