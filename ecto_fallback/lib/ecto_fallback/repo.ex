defmodule EctoFallback.Repo do
  use Ecto.Repo,
    otp_app: :ecto_fallback,
    adapter: Ecto.Adapters.Postgres
end
