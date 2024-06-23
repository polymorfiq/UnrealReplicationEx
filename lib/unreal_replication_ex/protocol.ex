defprotocol UnrealReplicationEx.Protocol do
  @callback init() :: {:ok, proto :: term} | {:error, reason :: term}

  @spec serialize(proto :: pid, data :: term) :: {:ok, serialized :: term} | {:error, reason :: term}
  def serialize(proto, data)

  @spec deserialize(proto :: pid, data :: term) :: {:ok, serialized :: term} | {:error, reason :: term}
  def deserialize(proto, data)
end