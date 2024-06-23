defmodule UnrealReplicationEx.Flows.Udp do
  use GenServer

  def start_link(binding, opts \\ []), do: GenServer.start_link(__MODULE__, binding, opts)

  def init(%{address: %{port: port}, protocol: protocol}) do
     {:ok, socket} = :gen_udp.open(port, [:binary, active: true])
     {:ok, proto} = protocol.start_link()

     {:ok, %{socket: socket, proto: proto}}
  end

  def handle_info({:udp, _socket, _address, _port, data}, socket) do
    handle_packet(data, socket)
  end

  defp handle_packet("quit\n", socket) do
    IO.puts("Received: quit")

    :gen_udp.close(socket)
    {:stop, :normal, nil}
  end

  defp handle_packet(data, socket) do
    IO.puts("Received: #{String.trim data}")

    {:noreply, socket}
  end
end