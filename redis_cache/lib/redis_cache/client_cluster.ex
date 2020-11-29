defmodule RedisCache.ClientCluster do
  use Nebulex.Cache,
    otp_app: :redis_cache,
    adapter: NebulexRedisAdapter
end
