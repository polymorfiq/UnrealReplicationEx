defprotocol UnrealReplicationEx.Flow do
  @type flow_spec :: %{address: map(), protocol: module()}

  @spec create(spec :: flow_spec) :: {:ok, flow :: term} | {:error, reason :: term}
  def create(spec)

  @spec send(flow :: term, data :: term) :: :ok | {:error, reason :: term}
  def send(flow, data)
end