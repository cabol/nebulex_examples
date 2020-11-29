import Config

# L1 Cache
config :near_cache, NearCache,
  model: :inclusive,
  levels: [
    {
      NearCache.L1,
      gc_interval: :timer.seconds(86_400),
      backend: :shards
    },
    {
      NearCache.L2,
      primary: [
        adapter: Nebulex.Adapters.Local,
        gc_interval: :timer.seconds(86_400),
        backend: :shards
      ]
    }
  ]

# NearCache config
config :near_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]

# Configures Elixir's Logger
config :logger, :console, format: "[$level] $message\n"
