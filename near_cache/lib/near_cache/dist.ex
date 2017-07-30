defmodule NearCache.Dist do
  use Nebulex.Cache, otp_app: :near_cache
  use NearCache.Hooks

  defmodule Local do
    use Nebulex.Cache, otp_app: :near_cache
  end
end
