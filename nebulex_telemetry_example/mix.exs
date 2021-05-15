defmodule NebulexTelemetryExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :nebulex_telemetry_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NebulexTelemetryExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nebulex, "~> 2.1"},
      {:decorator, "~> 1.4"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5"},
      {:telemetry_metrics_statsd, "~> 0.5.0"}
    ]
  end
end
