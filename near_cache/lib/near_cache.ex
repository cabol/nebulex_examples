defmodule NearCache do
  @moduledoc """
  Near Cache Wrapper.
  """

  defdelegate get(key, opts \\ []), to: NearCache.Multilevel

  defdelegate get!(key, opts \\ []), to: NearCache.Multilevel

  defdelegate set(key, value, opts \\ []), to: NearCache.Multilevel

  defdelegate delete(key, opts \\ []), to: NearCache.Multilevel

  defdelegate has_key?(key), to: NearCache.Multilevel

  defdelegate size(), to: NearCache.Multilevel

  defdelegate flush(), to: NearCache.Multilevel

  defdelegate keys(), to: NearCache.Multilevel

  defdelegate reduce(acc, reducer, opts \\ []), to: NearCache.Multilevel

  defdelegate to_map(opts \\ []), to: NearCache.Multilevel

  defdelegate pop(key, opts \\ []), to: NearCache.Multilevel

  defdelegate get_and_update(key, fun, opts \\ []), to: NearCache.Multilevel

  defdelegate update(key, initial, fun, opts \\ []), to: NearCache.Multilevel

  defdelegate transaction(key, fun), to: NearCache.Multilevel
end
