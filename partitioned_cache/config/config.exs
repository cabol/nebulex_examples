use Mix.Config

# Distributed Cache
config :partitioned_cache, PartitionedCache,
  adapter: Nebulex.Adapters.Dist,
  local: PartitionedCache.Local,
  node_picker: PartitionedCache.NodePicker

# Internal local cache used by PartitionedCache.Dist
config :partitioned_cache, PartitionedCache.Local,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400 # 24 hrs

# NearCache config
config :partitioned_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]
