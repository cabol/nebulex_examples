import Config

config :nebulex_bench,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1", :"node3@127.0.0.1"]

config :nebulex_bench, NebulexBench.LocalCache,
  gc_interval: :timer.seconds(86_400),
  backend: :shards

config :nebulex_bench, NebulexBench.PartitionedCache,
  primary: [
    gc_interval: 3_600_000,
    backend: :shards
  ]

config :nebulex_bench, NebulexBench.Bench, bench_cache: NebulexBench.PartitionedCache
