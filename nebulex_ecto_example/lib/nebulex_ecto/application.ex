defmodule NebulexEctoExample.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(NebulexEctoExample.Repo, []),
      supervisor(NebulexEctoExample.Cache, [])
    ]

    opts = [strategy: :one_for_one, name: NebulexEctoExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
