import Config

config :erlang_cache, NbxCache,
  gc_interval: :timer.seconds(86_400),
  backend: :shards
