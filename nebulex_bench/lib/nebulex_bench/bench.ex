defmodule NebulexBench.Bench do

  @cache (Keyword.get(Application.get_env(:nebulex_bench, NebulexBench.Bench, []), :bench_cache, NebulexBench.LocalCache))

  def new(_state) do
    {:ok, %{}}
  end

  def run(:set, key_gen, value_gen, state) do
    value = value_gen.()
    ^value = @cache.set(key_gen.(), value)
    {:ok, state}
  end

  def run(:get, key_gen, _value_gen, state) do
    @cache.get(key_gen.())
    {:ok, state}
  end

  def run(:del, key_gen, _value_gen, state) do
    key = key_gen.()
    ^key = @cache.delete(key)
    {:ok, state}
  end

  def run(:pop, key_gen, _value_gen, state) do
    @cache.pop(key_gen.())
    {:ok, state}
  end

  def run(:get_and_update, key_gen, value_gen, state) do
    @cache.get_and_update(key_gen.(), fn v ->
      {v, value_gen.()}
    end)
    {:ok, state}
  end

  def run(:update, key_gen, value_gen, state) do
    @cache.update(key_gen.(), 1, fn _ -> value_gen.() end)
    {:ok, state}
  end

  def run(:update_counter, _key_gen, _value_gen, state) do
    @cache.update_counter(:my_counter, 1)
    {:ok, state}
  end
end
