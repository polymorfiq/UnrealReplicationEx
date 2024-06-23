defmodule UnrealReplicationEx.Protocol do
  @callback start_link() :: {:ok, proto :: pid} | {:error, reason :: term}
  @callback serialize(proto :: pid, data :: term) :: {:ok, serialized :: term} | {:error, reason :: term}
  @callback deserialize(proto :: pid, data :: term) :: {:ok, serialized :: term} | {:error, reason :: term}
end