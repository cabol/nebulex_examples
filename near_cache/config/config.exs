use Mix.Config

# L1 Cache
config :near_cache, NearCache,
  model: :inclusive,
  levels: [
    l1: [
      adapter: Nebulex.Adapters.Local,
      gc_interval: :timer.seconds(86_400),
      backend: :shards
    ],
    l2: [
      adapter: Nebulex.Adapters.Partitioned,
      primary: [
        adapter: Nebulex.Adapters.Local,
        gc_interval: :timer.seconds(86_400),
        backend: :shards
      ]
    ]
  ]

# NearCache config
config :near_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]

# Configures Elixir's Logger
config :logger, :console, format: "[$level] $message\n"
