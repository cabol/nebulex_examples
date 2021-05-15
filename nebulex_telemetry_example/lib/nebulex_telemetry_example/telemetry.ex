defmodule NebulexTelemetryExample.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  @telemetry_prefix "nebulex_telemetry_example.cache"

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      # Configure `:telemetry_poller` for reporting the cache stats
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000},

      # For example, we use the console reporter, but you can change it.
      # See `:telemetry_metrics` for for information.
      {Telemetry.Metrics.ConsoleReporter, metrics: metrics()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  defp metrics do
    [
      # Cache command events
      summary(
        @telemetry_prefix <> ".command.stop.duration",
        unit: {:native, :millisecond},
        tags: [:cache, :function_name],
        tag_values: &Map.put(&1, :cache, &1.adapter_meta.cache)
      ),
      summary(
        @telemetry_prefix <> ".command.exception.duration",
        unit: {:native, :millisecond},
        tags: [:function_name, :kind]
      ),

      # Cache stats
      last_value(@telemetry_prefix <> ".stats.hits", tags: [:cache]),
      last_value(@telemetry_prefix <> ".stats.misses", tags: [:cache]),
      last_value(@telemetry_prefix <> ".stats.writes", tags: [:cache]),
      last_value(@telemetry_prefix <> ".stats.updates", tags: [:cache, :node]),
      last_value(@telemetry_prefix <> ".stats.evictions", tags: [:cache]),
      last_value(@telemetry_prefix <> ".stats.expirations", tags: [:cache]),

      # Custom metrics
      last_value(@telemetry_prefix <> ".size.value", tags: [:cache])
    ]
  end

  defp periodic_measurements do
    [
      {NebulexTelemetryExample.Cache, :dispatch_stats, []},
      {NebulexTelemetryExample.Cache, :dispatch_cache_size, []}
    ]
  end
end
