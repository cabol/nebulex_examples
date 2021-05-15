# Instrumenting out caches with Telemetry

This example illustrates how to instrument our Nebulex caches using Telemetry.

For more information about Telemetry events and stats, see:

  * [Telemetry Events](https://hexdocs.pm/nebulex/Nebulex.Cache.html#module-telemetry-events)
  * [Cache Stats](http://hexdocs.pm/nebulex/Nebulex.Cache.Stats.html)
  * [Telemetry Guide](http://hexdocs.pm/nebulex/telemetry.html)

## Getting started

Start an IEx session:

```
iex -S mix
```

Then, we can try it out:

```
iex(1)> NebulexTelemetryExample.Cache.get 1
nil
iex(2)> NebulexTelemetryExample.Cache.put 1, 1, ttl: 10
:ok
iex(3)> NebulexTelemetryExample.Cache.get 1
1
iex(4)> NebulexTelemetryExample.Cache.put 2, 2
:ok
iex(5)> NebulexTelemetryExample.Cache.delete 2
:ok
iex(6)> Process.sleep(20)
:ok
iex(7)> NebulexTelemetryExample.Cache.get 1
nil
```

For the event `nebulex_telemetry_example.cache.command.stop.duration` you should
see something like:

```
[Telemetry.Metrics.ConsoleReporter] Got new event!
Event name: nebulex_telemetry_example.cache.command.stop
All measurements: %{duration: 13000}
All metadata: %{adapter_meta: %{backend: :ets, cache: NebulexTelemetryExample.Cache, meta_tab: #Reference<0.1959874111.2908094469.85946>, pid: #PID<0.216.0>, started_at: ~U[2021-05-15 15:14:52.603317Z], stats_counter: {:write_concurrency, #Reference<0.1959874111.2908094469.85953>}, telemetry: true, telemetry_prefix: [:nebulex_telemetry_example, :cache]}, args: [1, 1, 10, :put, [ttl: 10]], function_name: :put, result: true, telemetry_span_context: #Reference<0.1959874111.2907963407.84960>}

Metric measurement: #Function<4.70336728/1 in Telemetry.Metrics.maybe_convert_measurement/2> (summary)
With value: 0.013 millisecond
Tag values: %{cache: NebulexTelemetryExample.Cache, function_name: :put}
```

For the stats:

```
[Telemetry.Metrics.ConsoleReporter] Got new event!
Event name: nebulex_telemetry_example.cache.stats
All measurements: %{evictions: 2, expirations: 1, hits: 1, misses: 2, writes: 2}
All metadata: %{cache: NebulexTelemetryExample.Cache, started_at: ~U[2021-05-15 15:14:52.603317Z]}

Metric measurement: :hits (last_value)
With value: 1
Tag values: %{cache: NebulexTelemetryExample.Cache}

Metric measurement: :misses (last_value)
With value: 2
Tag values: %{cache: NebulexTelemetryExample.Cache}

Metric measurement: :writes (last_value)
With value: 2
Tag values: %{cache: NebulexTelemetryExample.Cache}

Metric measurement: :updates (last_value)
With value: 0
Tag values: %{cache: NebulexTelemetryExample.Cache}

Metric measurement: :evictions (last_value)
With value: 2
Tag values: %{cache: NebulexTelemetryExample.Cache}

Metric measurement: :expirations (last_value)
With value: 1
Tag values: %{cache: NebulexTelemetryExample.Cache}
```

And for the custome event:

```
[Telemetry.Metrics.ConsoleReporter] Got new event!
Event name: nebulex_telemetry_example.cache.size
All measurements: %{value: 0}
All metadata: %{cache: NebulexTelemetryExample.Cache}

Metric measurement: :value (last_value)
With value: 0
Tag values: %{cache: NebulexTelemetryExample.Cache}
```
