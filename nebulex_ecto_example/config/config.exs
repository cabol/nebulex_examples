use Mix.Config

config :nebulex_ecto_example,
  ecto_repos: [NebulexEctoExample.Repo]

config :nebulex_ecto_example, NebulexEctoExample.Repo,
  database: "nebulex_ecto_example",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :nebulex_ecto_example, NebulexEctoExample.Cache,
  gc_interval: :timer.seconds(86_400)
