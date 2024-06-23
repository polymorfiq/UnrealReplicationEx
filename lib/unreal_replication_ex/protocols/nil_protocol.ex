defmodule UnrealReplicationEx.Protocols.NilProtocol do
  defstruct [:pid]
  use GenServer

  def init() do
    {:ok, pid} = GenServer.start_link(__MODULE__, nil)
    {:ok, %__MODULE__{pid: pid}}
  end

  def init(_), do: {:ok, nil}

  def handle_call({:serialize, data}, _, _), do: {:reply, {:ok, data}, nil}
  def handle_call({:deserialize, data}, _, _), do: {:reply, {:ok, data}, nil}
end

defimpl UnrealReplicationEx.Protocol, for: UnrealReplicationEx.Protocols.NilProtocol do
  def init(), do: UnrealReplicationEx.Protocols.NilProtocol.init()
  def serialize(%{pid: proto}, data), do: GenServer.call(proto, {:serialize, data})
  def deserialize(%{pid: proto}, data), do: GenServer.call(proto, {:deserialize, data})
end