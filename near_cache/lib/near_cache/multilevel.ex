defmodule NearCache.Multilevel do
  use Nebulex.Cache, otp_app: :near_cache

  defmodule L1 do
    use Nebulex.Cache, otp_app: :near_cache
    use NearCache.Hooks
  end

  defmodule L2 do
    use Nebulex.Cache, otp_app: :near_cache
    use NearCache.Hooks

    defmodule Primary do
      use Nebulex.Cache, otp_app: :near_cache
    end
  end
end
