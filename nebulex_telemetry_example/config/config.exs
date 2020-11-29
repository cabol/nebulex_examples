import Config

config :nebulex_telemetry_example, NebulexTelemetryExample.Cache,
  stats: true,
  gc_interval: :timer.seconds(86_400)
