defmodule NebulexBench.LocalCache do
  use Nebulex.Cache,
    otp_app: :nebulex_bench,
    adapter: Nebulex.Adapters.Local
end
