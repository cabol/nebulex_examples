defmodule PartitionedCache.NodeSelector do
  @behaviour Nebulex.Adapter.NodeSelector

  @doc """
  This function uses [Jump Consistent Hash](https://github.com/cabol/jchash).
  """
  def get_node(nodes, key) do
    key
    |> :erlang.phash2()
    |> :jchash.compute(length(nodes))
    |> Kernel.+(1)
    |> :lists.nth(nodes)
  end
end
