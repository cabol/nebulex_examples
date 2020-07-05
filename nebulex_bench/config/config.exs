use Mix.Config

config :nebulex_bench, NebulexBench.LocalCache,
  gc_interval: :timer.seconds(86_400),
  backend: :shards

config :nebulex_bench, NebulexBench.Bench, bench_cache: NebulexBench.LocalCache
