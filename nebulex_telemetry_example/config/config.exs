import Config

config :nebulex_telemetry_example, NebulexEctoExample.Cache,
  stats: true,
  gc_interval: :timer.seconds(86_400)
