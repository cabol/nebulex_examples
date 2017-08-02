defmodule PartitionedCache.NodePicker do
  @behaviour Nebulex.Adapters.Dist.NodePicker

  @doc """
  This function uses [Jump Consistent Hash](https://github.com/cabol/jchash).
  """
  def pick_node(nodes, key) do
    key
    |> :erlang.phash2()
    |> :jchash.compute(length(nodes))
    |> Kernel.+(1)
    |> :lists.nth(nodes)
  end
end
