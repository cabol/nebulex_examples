defmodule NearCache do
  use Nebulex.Cache,
    otp_app: :near_cache,
    adapter: Nebulex.Adapters.Multilevel,
    cache_model: :inclusive,
    levels: [NearCache.L1, NearCache.L2]

  use NearCache.Hooks

  defmodule L1 do
    use Nebulex.Cache,
      otp_app: :near_cache,
      adapter: Nebulex.Adapters.Local
  end

  defmodule L2 do
    use Nebulex.Cache,
      otp_app: :near_cache,
      adapter: Nebulex.Adapters.Partitioned,
      primary: NearCache.L2.Primary,
      hash_slot: NearCache.JumpingHashSlot

    defmodule Primary do
      use Nebulex.Cache,
        otp_app: :near_cache,
        adapter: Nebulex.Adapters.Local
    end
  end
end
