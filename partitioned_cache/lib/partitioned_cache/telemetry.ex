defmodule PartitionedCache.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      # Configure `:telemetry_poller` for reporting the cache stats
      {:telemetry_poller, measurements: periodic_measurements(), period: 60_000},

      # For example, we use the console reporter, but you can change it.
      # See `:telemetry_metrics` for for information.
      {Telemetry.Metrics.ConsoleReporter, metrics: metrics()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  defp metrics do
    [
      # Nebulex Stats Metrics
      last_value("nebulex.cache.stats.hits", tags: [:cache]),
      last_value("nebulex.cache.stats.misses", tags: [:cache]),
      last_value("nebulex.cache.stats.writes", tags: [:cache]),
      last_value("nebulex.cache.stats.updates", tags: [:cache]),
      last_value("nebulex.cache.stats.evictions", tags: [:cache]),
      last_value("nebulex.cache.stats.expirations", tags: [:cache])
    ]
  end

  defp periodic_measurements do
    [
      {PartitionedCache, :dispatch_stats, []}
    ]
  end
end
