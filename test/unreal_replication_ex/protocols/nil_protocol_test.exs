defmodule UnrealReplicationEx.Protocols.NilProtocolTest do
  use ExUnit.Case
  alias UnrealReplicationEx.{Protocol, Protocols.NilProtocol}

  test "can be started", do: proto()

  test "can serialize data" do
    assert {:ok, "Some Data"} = proto() |> Protocol.serialize("Some Data")
  end

  test "can deserialize data" do
    assert {:ok, "Other Data"} = proto() |> Protocol.deserialize("Other Data")
  end

  defp proto do
    {:ok, new_proto} = NilProtocol.init()

    new_proto
  end
end
