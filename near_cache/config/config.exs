use Mix.Config

# L1 Cache
config :near_cache, NearCache.Local,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400 # 24 hrs

# L2 Cache
config :near_cache, NearCache.Dist,
  adapter: Nebulex.Adapters.Dist,
  local: NearCache.Dist.Local,
  node_picker: NearCache.NodePicker

# Internal local cache used by NearCache.Dist
config :near_cache, NearCache.Dist.Local,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400 # 24 hrs

# Multilevel Cache – wrapper for L1 and L2 caches
config :near_cache, NearCache.Multilevel,
  adapter: Nebulex.Adapters.Multilevel,
  cache_model: :inclusive,
  levels: [NearCache.Local, NearCache.Dist]

# NearCache config
config :near_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "[$level] $message\n"
