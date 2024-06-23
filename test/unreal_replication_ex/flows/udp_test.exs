defmodule UnrealReplicationEx.Flows.UdpTest do
  use ExUnit.Case
  doctest UnrealReplicationEx.Flows.Udp
  alias UnrealReplicationEx.{
    Flows.Udp,
    Protocols.NilProtocol
  }

  test "can be started and killed", do: flow() |> Process.exit(:kill)

  defp flow do
    {:ok, new_flow} = Udp.start_link(%{
      address: %{port: 4444},
      protocol: NilProtocol
    })

    new_flow
  end
end
