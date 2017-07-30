defmodule NearCache.Local do
  use Nebulex.Cache, otp_app: :near_cache
  use NearCache.Hooks
end
