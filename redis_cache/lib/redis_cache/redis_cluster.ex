defmodule RedisCache.RedisCluster do
  use Nebulex.Cache,
    otp_app: :redis_cache,
    adapter: NebulexRedisAdapter
end
