defmodule PartitionedCache do
  use Nebulex.Cache,
    otp_app: :partitioned_cache,
    adapter: Nebulex.Adapters.Partitioned,
    primary: PartitionedCache.Primary,
    hash_slot: PartitionedCache.JumpingHashSlot

  defmodule Primary do
    use Nebulex.Cache,
      otp_app: :partitioned_cache,
      adapter: Nebulex.Adapters.Local
  end
end
