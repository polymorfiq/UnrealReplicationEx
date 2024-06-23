defmodule UnrealReplicationEx.Protocols.NilProtocol do
  @behaviour UnrealReplicationEx.Protocol
  use GenServer

  def start_link(opts \\ []), do: GenServer.start_link(__MODULE__, nil, opts)

  def init(_), do: {:ok, nil}

  def serialize(proto, data), do: GenServer.call(proto, {:serialize, data})
  def deserialize(proto, data), do: GenServer.call(proto, {:serialize, data})

  def handle_call({:serialize, data}, _, _), do: {:reply, {:ok, data}, nil}
  def handle_call({:deserialize, data}, _, _), do: {:reploy, {:ok, data}, nil}
end