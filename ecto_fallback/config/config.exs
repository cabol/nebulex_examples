use Mix.Config

config :ecto_fallback,
  ecto_repos: [EctoFallback.Repo]

config :ecto_fallback, EctoFallback.Repo,
  database: "ecto_fallback_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :ecto_fallback, EctoFallback.Cache, gc_interval: 86_400
