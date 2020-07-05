defmodule NebulexEctoExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :nebulex_telemetry_example,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NebulexEctoExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nebulex, "~> 2.0-pre"},
      {:decorator, "~> 1.3"},
      {:dialyxir, "~> 1.0", optional: true, only: [:dev, :test], runtime: false},
      {:telemetry_metrics, "~> 0.5"},
      {:telemetry_poller, "~> 0.5"}
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:mix, :eex, :logger],
      flags: [
        :unmatched_returns,
        :error_handling,
        :race_conditions,
        :no_opaque,
        :unknown,
        :no_return
      ]
    ]
  end
end
