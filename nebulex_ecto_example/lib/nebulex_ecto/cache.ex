defmodule NebulexEctoExample.Cache do
  use Nebulex.Cache,
    otp_app: :nebulex_ecto_example,
    adapter: Nebulex.Adapters.Local
end
