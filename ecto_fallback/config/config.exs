use Mix.Config

config :ecto_fallback,
  ecto_repos: [EctoFallback.Repo]

config :ecto_fallback, EctoFallback.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "ecto_fallback_repo",
  username: "postgres",
  password: "password",
  hostname: "localhost"

config :ecto_fallback, EctoFallback.Cache,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400, # 24 hrs
  post_hooks_strategy: :pipe
