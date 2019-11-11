defmodule NearCache.JumpingHashSlot do
  @behaviour Nebulex.Adapter.HashSlot

  @doc """
  This function uses [Jump Consistent Hash](https://github.com/cabol/jchash).
  """
  @impl true
  def keyslot(key, range) do
    key
    |> :erlang.phash2()
    |> :jchash.compute(range)
  end
end
