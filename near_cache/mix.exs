defmodule NearCache.MixProject do
  use Mix.Project

  def project do
    [
      app: :near_cache,
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
      mod: {NearCache.Application, []}
    ]
  end

  defp deps do
    [
      {:nebulex, "~> 2.1"},
      {:shards, "~> 1.0"},
      {:decorator, "~> 1.4"},
      {:jchash, "~> 0.1", app: false}
    ]
  end
end
