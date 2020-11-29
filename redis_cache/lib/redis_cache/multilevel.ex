defmodule RedisCache.Multilevel do
  use Nebulex.Cache,
    otp_app: :redis_cache,
    adapter: Nebulex.Adapters.Multilevel

  # Local
  defmodule L1 do
    use Nebulex.Cache,
      otp_app: :redis_cache,
      adapter: Nebulex.Adapters.Local
  end

  # Redis
  defmodule L2 do
    use Nebulex.Cache,
      otp_app: :redis_cache,
      adapter: NebulexRedisAdapter
  end
end
