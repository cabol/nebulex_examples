defmodule RedisCache.Standalone do
  use Nebulex.Cache,
    otp_app: :redis_cache,
    adapter: NebulexRedisAdapter
end
