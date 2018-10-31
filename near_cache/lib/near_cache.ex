defmodule NearCache do
  use Nebulex.Cache,
    otp_app: :near_cache,
    adapter: Nebulex.Adapters.Multilevel

  use NearCache.Hooks

  defmodule L1 do
    use Nebulex.Cache,
      otp_app: :near_cache,
      adapter: Nebulex.Adapters.Local
  end

  defmodule L2 do
    use Nebulex.Cache,
      otp_app: :near_cache,
      adapter: Nebulex.Adapters.Dist

    defmodule Primary do
      use Nebulex.Cache,
        otp_app: :near_cache,
        adapter: Nebulex.Adapters.Local
    end
  end
end
