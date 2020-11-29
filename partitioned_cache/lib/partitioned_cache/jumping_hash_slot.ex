defmodule PartitionedCache.JumpingHashSlot do
  use Nebulex.Adapter.Keyslot

  @doc """
  This function uses [Jump Consistent Hash](https://github.com/cabol/jchash).
  """
  @impl true
  def hash_slot(key, range) do
    key
    |> :erlang.phash2()
    |> :jchash.compute(range)
  end
end
