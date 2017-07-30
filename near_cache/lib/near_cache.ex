defmodule NearCache do
  @moduledoc """
  Near Cache Wrapper.
  """

  defdelegate get(key, opts \\ []), to: NearCache.Multilevel

  defdelegate get!(key, opts \\ []), to: NearCache.Multilevel

  defdelegate set(key, value, opts \\ []), to: NearCache.Dist

  defdelegate delete(key, opts \\ []), to: NearCache.Dist

  defdelegate has_key?(key), to: NearCache.Dist

  defdelegate size(), to: NearCache.Dist

  defdelegate flush(), to: NearCache.Dist

  defdelegate keys(), to: NearCache.Dist

  defdelegate reduce(acc, reducer, opts \\ []), to: NearCache.Dist

  defdelegate to_map(opts \\ []), to: NearCache.Dist

  defdelegate pop(key, opts \\ []), to: NearCache.Dist

  defdelegate get_and_update(key, fun, opts \\ []), to: NearCache.Dist

  defdelegate update(key, initial, fun, opts \\ []), to: NearCache.Dist

  defdelegate transaction(key, fun), to: NearCache.Dist
end
