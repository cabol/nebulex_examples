# Instrumenting out caches with Telemetry

This example illustrates how to instrument our Nebulex caches using Telemetry.

See also [Nebulex.Cache.Stats](http://hexdocs.pm/nebulex/Nebulex.Cache.Stats.html)
and [Telemetry Guide](http://hexdocs.pm/nebulex/telemetry.html).

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

You should see the metrics popping out:

```
[Telemetry.Metrics.ConsoleReporter] Got new event!
Event name: nebulex.cache.stats
All measurements: %{evictions: 2, expirations: 1, hits: 1, misses: 2, writes: 2}
All metadata: %{cache: NebulexTelemetryExample.Cache}

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

[Telemetry.Metrics.ConsoleReporter] Got new event!
Event name: nebulex.cache.size
All measurements: %{value: 0}
All metadata: %{cache: NebulexTelemetryExample.Cache}

Metric measurement: :value (last_value)
With value: 0
Tag values: %{cache: NebulexTelemetryExample.Cache}
```
