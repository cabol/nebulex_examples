defmodule NearCache.Mixfile do
  use Mix.Project

  def project do
    [
      app: :near_cache,
      version: "0.1.0",
      elixir: "~> 1.8",
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
      {:nebulex, "~> 1.2"},
      {:jchash, "~> 0.1", app: false}
    ]
  end
end
