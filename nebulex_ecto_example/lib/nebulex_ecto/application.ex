defmodule NebulexEctoExample.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      NebulexEctoExample.Repo,
      NebulexEctoExample.Cache
    ]

    opts = [strategy: :one_for_one, name: NebulexEctoExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
