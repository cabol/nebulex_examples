defmodule NearCache.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Setup the cluster
    :ok = setup_cluster()

    # Define workers and child supervisors to be supervised
    children = [
      supervisor(NearCache.Multilevel.L2.Primary, []),
      supervisor(NearCache.Multilevel.L2, []),
      supervisor(NearCache.Multilevel.L1, []),
      supervisor(NearCache.Multilevel, [])
    ]

    opts = [strategy: :one_for_one, name: NearCache.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp setup_cluster do
    :near_cache
    |> Application.get_env(:nodes, [])
    |> Enum.each(&:net_adm.ping/1)
  end
end
