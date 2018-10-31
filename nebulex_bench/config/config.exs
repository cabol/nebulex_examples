use Mix.Config

config :nebulex_bench, NebulexBench.LocalCache,
  gc_interval: 86_400

config :nebulex_bench, NebulexBench.Bench, bench_cache: NebulexBench.LocalCache
