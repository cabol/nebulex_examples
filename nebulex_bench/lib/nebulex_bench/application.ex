defmodule NebulexBench.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    :ok = setup_cluster()

    children = [
      NebulexBench.LocalCache,
      NebulexBench.PartitionedCache
    ]

    opts = [strategy: :one_for_one, name: NebulexBench.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp setup_cluster do
    :nebulex_bench
    |> Application.get_env(:nodes, [])
    |> Enum.each(&:net_adm.ping/1)
  end
end
