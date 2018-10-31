use Mix.Config

config :nebulex_ecto_example,
  ecto_repos: [NebulexEctoExample.Repo]

config :nebulex_ecto_example, NebulexEctoExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "nebulex_ecto_example",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :nebulex_ecto_example, NebulexEctoExample.Cache,
  gc_interval: 86_400

config :nebulex_ecto_example, NebulexEctoExample.CacheableRepo,
  cache: NebulexEctoExample.Cache,
  repo: NebulexEctoExample.Repo
