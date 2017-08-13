use Mix.Config

config :erlang_cache, NbxCache,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400,
  stats: true
