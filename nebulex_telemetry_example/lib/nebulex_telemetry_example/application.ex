defmodule NebulexEctoExample.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      NebulexEctoExample.Cache,
      NebulexEctoExample.Telemetry
    ]

    opts = [strategy: :one_for_one, name: NebulexEctoExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
