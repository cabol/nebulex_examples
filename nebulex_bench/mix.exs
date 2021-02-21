defmodule NebulexBench.MixProject do
  use Mix.Project

  def project do
    [
      app: :nebulex_bench,
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
      mod: {NebulexBench.Application, []}
    ]
  end

  defp deps do
    [
      {:nebulex, "~> 2.0"},
      {:shards, "~> 1.0"},
      {:basho_bench, github: "mrallen1/basho_bench", ref: "mra-rebar3"}
    ]
  end
end
