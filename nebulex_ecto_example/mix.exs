defmodule NebulexEctoExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :nebulex_ecto_example,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ecto, :postgrex],
      mod: {NebulexEctoExample.Application, []}
    ]
  end

  defp deps do
    [
      {:nebulex_ecto, github: "cabol/nebulex_ecto"},
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"}
    ]
  end
end
