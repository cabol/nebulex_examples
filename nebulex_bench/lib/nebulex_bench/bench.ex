defmodule NebulexBench.Bench do
  @moduledoc false

  alias NebulexBench.LocalCache, as: Cache

  def new(_state) do
    {:ok, %{}}
  end

  def run(:put, key_gen, value_gen, state) do
    value = value_gen.()
    :ok = Cache.put(key_gen.(), value)
    {:ok, state}
  end

  def run(:get, key_gen, _value_gen, state) do
    Cache.get(key_gen.())
    {:ok, state}
  end

  def run(:del, key_gen, _value_gen, state) do
    key = key_gen.()
    :ok = Cache.delete(key)
    {:ok, state}
  end

  ## You can add more functions to bench here
end
