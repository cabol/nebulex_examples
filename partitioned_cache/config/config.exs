use Mix.Config

# Distributed Cache
config :partitioned_cache, PartitionedCache,
  local: PartitionedCache.Local,
  node_selector: PartitionedCache.NodeSelector

# Internal local cache used by PartitionedCache.Dist
config :partitioned_cache, PartitionedCache.Local,
  # 24 hrs
  gc_interval: 86_400

# NearCache config
config :partitioned_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]
