defmodule PartitionedCache do
  use Nebulex.Cache, otp_app: :partitioned_cache

  defmodule Local do
    use Nebulex.Cache, otp_app: :partitioned_cache
  end
end
