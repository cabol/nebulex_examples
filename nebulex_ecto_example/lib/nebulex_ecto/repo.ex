defmodule NebulexEctoExample.Repo do
  use Ecto.Repo,
    otp_app: :nebulex_ecto_example,
    adapter: Ecto.Adapters.Postgres
end
