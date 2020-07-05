use Mix.Config

# Partitioned Cache
config :partitioned_cache, PartitionedCache,
  hash_slot: PartitionedCache.JumpingHashSlot,
  primary: [
    gc_interval: :timer.seconds(86_400),
    backend: :shards
  ]

# NearCache config
config :partitioned_cache,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]
