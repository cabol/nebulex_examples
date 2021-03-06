defmodule NearCache do
  use Nebulex.Cache,
    otp_app: :near_cache,
    adapter: Nebulex.Adapters.Multilevel

  defmodule L1 do
    use Nebulex.Cache,
      otp_app: :near_cache,
      adapter: Nebulex.Adapters.Local
  end

  defmodule L2 do
    use Nebulex.Cache,
      otp_app: :near_cache,
      adapter: Nebulex.Adapters.Partitioned
  end
end
