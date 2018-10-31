defmodule NebulexBench.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      NebulexBench.LocalCache
    ]

    opts = [strategy: :one_for_one, name: NebulexBench.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
