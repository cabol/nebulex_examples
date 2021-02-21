defmodule NebulexEctoExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :nebulex_ecto_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ecto_sql, :postgrex],
      mod: {NebulexEctoExample.Application, []}
    ]
  end

  defp deps do
    [
      {:nebulex, "~> 2.0"},
      {:shards, "~> 1.0"},
      {:decorator, "~> 1.3"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
