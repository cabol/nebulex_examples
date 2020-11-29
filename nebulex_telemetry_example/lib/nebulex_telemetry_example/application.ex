defmodule NebulexTelemetryExample.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      NebulexTelemetryExample.Cache,
      NebulexTelemetryExample.Telemetry
    ]

    opts = [strategy: :one_for_one, name: NebulexTelemetryExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
