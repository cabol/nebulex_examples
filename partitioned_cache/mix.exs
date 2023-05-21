defmodule PartitionedCache.MixProject do
  use Mix.Project

  def project do
    [
      app: :partitioned_cache,
      version: "0.1.0",
      elixir: "~> 1.10",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PartitionedCache.Application, []}
    ]
  end

  defp deps do
    [
      {:nebulex, "~> 2.5"},
      {:shards, "~> 1.1"},
      {:decorator, "~> 1.4"},
      {:jchash, "~> 0.1"},
      {:telemetry, "~> 0.4"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5"}
    ]
  end
end
