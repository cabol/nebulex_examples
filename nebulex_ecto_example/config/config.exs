use Mix.Config

config :nebulex_ecto_example,
  ecto_repos: [NebulexEctoExample.Repo]

config :nebulex_ecto_example, NebulexEctoExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "nebulex_ecto_example",
  username: "postgres",
  password: "password",
  hostname: "localhost"

config :nebulex_ecto_example, NebulexEctoExample.Cache,
  adapter: Nebulex.Adapters.Local,
  gc_interval: 86_400 # 24 hrs

config :nebulex_ecto_example, NebulexEctoExample.CacheableRepo,
  cache: NebulexEctoExample.Cache,
  repo: NebulexEctoExample.Repo
