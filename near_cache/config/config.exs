use Mix.Config

# Multilevel Cache – wrapper for L1 and L2 caches
config :near_cache, NearCache,
  cache_model: :inclusive,
  levels: [NearCache.L1, NearCache.L2]

# L1 Cache
config :near_cache, NearCache.L1,
  gc_interval: 86_400

# L2 Cache
config :near_cache, NearCache.L2,
  local: NearCache.L2.Primary,
  node_selector: NearCache.NodeSelector

# Internal local cache used by NearCache.L2
config :near_cache, NearCache.L2.Primary,
  gc_interval: 86_400

# NearCache config
config :near_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]

# Configures Elixir's Logger
config :logger, :console, format: "[$level] $message\n"
