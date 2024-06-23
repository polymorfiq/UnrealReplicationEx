defmodule UnrealReplicationEx.Flows.Udp do
  use GenServer
  alias UnrealReplicationEx.Protocol
  defstruct [:pid]

  def create(binding) do
    {:ok, pid} = GenServer.start_link(__MODULE__, {self(), binding})
    {:ok, %__MODULE__{pid: pid}}
  end

  def init({parent, %{address: %{port: port}, protocol: protocol}}) do
     {:ok, socket} = :gen_udp.open(port, [:binary, active: true])
     {:ok, proto} = protocol.init()

     {:ok, %{parent: parent, socket: socket, proto: proto}}
  end

  def handle_info({:udp, _socket, _address, _port, data}, state) do
    msg = state.proto |> Protocol.deserialize(data)
    state.parent |> send(msg)

    {:noreply, state}
  end
end

defimpl UnrealReplicationEx.Flow, for: UnrealReplicationEx.Flows.Udp do
  def create(spec), do: UnrealReplicationEx.Flows.Udp.create(spec)
  def send(flow, spec), do: {:error, "Not implemented!"}
end