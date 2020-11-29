defmodule RedisCache.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias RedisCache.{
    ClientCluster,
    Multilevel,
    RedisCluster,
    Standalone
  }

  @impl true
  def start(_type, _args) do
    children = [
      Standalone,
      ClientCluster,
      RedisCluster,
      Multilevel
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RedisCache.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
