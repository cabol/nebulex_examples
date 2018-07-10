use Mix.Config

# Multilevel Cache – wrapper for L1 and L2 caches
config :near_cache, NearCache.Multilevel,
  adapter: Nebulex.Adapters.Multilevel,
  cache_model: :inclusive,
  levels: [NearCache.Multilevel.L1, NearCache.Multilevel.L2]

# L1 Cache
config :near_cache, NearCache.Multilevel.L1,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400 # 24 hrs

# L2 Cache
config :near_cache, NearCache.Multilevel.L2,
  adapter: Nebulex.Adapters.Dist,
  local: NearCache.Multilevel.L2.Primary,
  node_picker: NearCache.NodePicker

# Internal local cache used by NearCache.Multilevel.L2
config :near_cache, NearCache.Multilevel.L2.Primary,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400 # 24 hrs

# NearCache config
config :near_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "[$level] $message\n"
