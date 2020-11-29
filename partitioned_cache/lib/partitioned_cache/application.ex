defmodule PartitionedCache.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Setup the cluster
    :ok = setup_cluster()

    children = [
      PartitionedCache,
      PartitionedCache.Telemetry
    ]

    opts = [strategy: :one_for_one, name: PartitionedCache.Application.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp setup_cluster do
    :partitioned_cache
    |> Application.get_env(:nodes, [])
    |> Enum.each(&:net_adm.ping/1)
  end
end
