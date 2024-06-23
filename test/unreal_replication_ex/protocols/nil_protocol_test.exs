defmodule UnrealReplicationEx.Protocols.NilProtocolTest do
  use ExUnit.Case
  alias UnrealReplicationEx.Protocols.NilProtocol

  test "can be started and killed", do: proto() |> Process.exit(:kill)

  test "can serialize data" do
    assert {:ok, "Some Data"} = proto() |> NilProtocol.serialize("Some Data")
  end

  test "can deserialize data" do
    assert {:ok, "Other Data"} = proto() |> NilProtocol.deserialize("Other Data")
  end

  defp proto do
    {:ok, new_proto} = NilProtocol.start_link()

    new_proto
  end
end
