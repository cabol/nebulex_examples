defmodule NbxCache do
  use Nebulex.Cache,
    otp_app: :erlang_cache,
    adapter: Nebulex.Adapters.Local
end
