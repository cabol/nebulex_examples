defmodule NbxCache.MixProject do
  use Mix.Project

  def project do
    [
      app: :nbx_cache,
      version: "0.1.0",
      elixir: "~> 1.9",
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
      {:nebulex, "~> 2.0"},
      {:shards, "~> 1.0"}
    ]
  end
end
