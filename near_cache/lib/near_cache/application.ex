defmodule NearCache.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Setup the cluster
    :ok = setup_cluster()

    # Define workers and child supervisors to be supervised
    children = [
      NearCache
    ]

    opts = [strategy: :one_for_one, name: NearCache.Application.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp setup_cluster do
    :near_cache
    |> Application.get_env(:nodes, [])
    |> Enum.each(&:net_adm.ping/1)
  end
end
