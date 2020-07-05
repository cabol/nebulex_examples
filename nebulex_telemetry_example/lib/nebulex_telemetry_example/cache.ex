defmodule NebulexEctoExample.Cache do
  use Nebulex.Cache,
    otp_app: :nebulex_telemetry_example,
    adapter: Nebulex.Adapters.Local

  use Nebulex.Cache.Stats

  def dispatch_cache_size do
    :telemetry.execute(
      [:nebulex, :cache, :size],
      %{value: size()},
      %{cache: __MODULE__}
    )
  end
end
