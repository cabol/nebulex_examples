defmodule PartitionedCache.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Setup the cluster
    :ok = setup_cluster()

    children = [
      supervisor(PartitionedCache, []),
      supervisor(PartitionedCache.Local, []),
    ]

    opts = [strategy: :one_for_one, name: PartitionedCache.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp setup_cluster do
    :partitioned_cache
    |> Application.get_env(:nodes, [])
    |> Enum.each(&:net_adm.ping/1)
  end
end