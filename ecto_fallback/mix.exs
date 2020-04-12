defmodule EctoFallback.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_fallback,
      version: "0.1.0",
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:logger, :ecto_sql, :postgrex],
      mod: {EctoFallback.Application, []}
    ]
  end

  defp deps do
    [
      {:nebulex, "~> 1.2"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
