defmodule PartitionedCache do
  use Nebulex.Cache,
    otp_app: :partitioned_cache,
    adapter: Nebulex.Adapters.Partitioned

  use Nebulex.Cache.Stats
end
