defmodule UnrealReplicationEx.Flows.UdpTest do
  use ExUnit.Case
  doctest UnrealReplicationEx.Flows.Udp
  alias UnrealReplicationEx.{
    Flow,
    Flows.Udp,
    Protocols.NilProtocol
  }

  test "can be started", do: flow()
  test "can send data" do
    assert {:ok, _} = flow() |> Flow.send("abc")
  end

  defp flow do
    {:ok, new_flow} = Udp.create(%{
      address: %{port: 4444},
      protocol: NilProtocol
    })

    new_flow
  end
end
