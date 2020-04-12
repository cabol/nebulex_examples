defmodule NebulexEctoExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :nebulex_ecto_example,
      version: "0.1.0",
      elixir: "~> 1.8",
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
      {:nebulex, "~> 1.2"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
