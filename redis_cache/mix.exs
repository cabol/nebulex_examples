defmodule RedisCache.MixProject do
  use Mix.Project

  def project do
    [
      app: :redis_cache,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RedisCache.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nebulex_redis_adapter, "~> 2.0.0-rc.1"},
      {:crc, "~> 0.10"},
      {:jchash, "~> 0.1.2"}
    ]
  end
end
