defmodule NbxCache.MixProject do
  use Mix.Project

  def project do
    [
      app: :nbx_cache,
      version: "0.1.0",
      elixir: "~> 1.10",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:nebulex, "~> 2.5"},
      {:shards, "~> 1.1"}
    ]
  end
end
