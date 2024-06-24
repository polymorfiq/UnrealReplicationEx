defmodule UnrealReplicationEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :unreal_replication_ex,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {UnrealReplicationEx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:msgpax, "~> 2.4"},
      {:tethys, "~> 0.1.0"},
      {:tethys_msgpack, "~> 0.1.0"},
    ]
  end
end
