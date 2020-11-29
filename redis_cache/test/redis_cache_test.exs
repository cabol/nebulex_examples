defmodule RedisCacheTest do
  use ExUnit.Case
  doctest RedisCache

  test "greets the world" do
    assert RedisCache.hello() == :world
  end
end
