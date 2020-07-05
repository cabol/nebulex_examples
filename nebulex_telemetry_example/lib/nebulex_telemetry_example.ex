defmodule NebulexEctoExample do
  @moduledoc false

  use Nebulex.Caching

  alias NebulexEctoExample.Cache

  @decorate cacheable(cache: Cache, key: {:test, map.key}, match: &match_fun/1)
  def get_something(map) do
    {:ok, map}
  end

  @decorate cacheable(cache: Cache, key: {:test, map.key})
  def get_something2(map) do
    map
  end

  defp match_fun(nil) do
    false
  end

  defp match_fun({:ok, res}) do
    {true, res}
  end
end
