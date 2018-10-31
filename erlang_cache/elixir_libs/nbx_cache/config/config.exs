use Mix.Config

config :erlang_cache, NbxCache,
  gc_interval: 86_400,
  stats: true
