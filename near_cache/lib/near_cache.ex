defmodule NearCache do
  use Nebulex.Cache,
    otp_app: :near_cache,
    adapter: Nebulex.Adapters.Multilevel
end
