defmodule PartitionedCache do
  use Nebulex.Cache,
    otp_app: :partitioned_cache,
    adapter: Nebulex.Adapters.Dist

  defmodule Local do
    use Nebulex.Cache,
      otp_app: :partitioned_cache,
      adapter: Nebulex.Adapters.Local
  end
end
