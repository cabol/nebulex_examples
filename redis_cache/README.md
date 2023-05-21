# RedisCache

This example illustrates how to use Nebulex with the Redis adapter.

This example defines four caches:

  - `RedisCache.Standalone` - This cache uses the `NebulexRedisAdapter` in
    `:standalone` mode with a single Redis node.

  - `RedisCache.ClientCluster` - This cache uses the `NebulexRedisAdapter` in
    `:client_side_cluster` mode (client-based cluster) with a three standalone
    Redis nodes; since the cluster is provided from client-side.

  - `RedisCache.RedisCluster` - This cache uses the `NebulexRedisAdapter` in
    `:redis_cluster` mode with five Redis cluster nodes.
    See [Redis Cluster](https://redis.io/topics/cluster-tutorial).

  - `RedisCache.Multilevel` - This cache defines a multi-level cache where the
    `L1` is a local one using the local built-in adapter and the `L2` is a
    standalone Redis node (it can also be a Redis client-based cluster or a
    Redis-Cluster).

> **NOTE:** See the [configuration](config/config.exs).

## Getting started

To run the **RedisCache** example you will have to have Redis running locally.
**RedisCache** requires a complex setup to run (since it needs a few instances
running, for standalone, cleint-based cluster and Redis Cluster). For this
reason, there is a [docker-compose.yml](docker-compose.yml) file so that you
can use [Docker][docker] and [docker-compose][docker_compose] to spin up all
the needed Redis instances with just one command. Make sure you have Docker
installed and then just run:

```
$ docker-compose up -d
```

[docker]: https://www.docker.com/
[docker_compose]: https://docs.docker.com/compose/

Start an IEx session:

```
iex -S mix
```

Let's try the standalone cache:

```elixir
iex> RedisCache.Standalone.get "foo"
nil
iex> RedisCache.Standalone.put "foo", "bar"
:ok
iex> RedisCache.Standalone.get "foo"
"bar"
```

The client-based cluster:

```elixir
iex> RedisCache.ClientCluster.get "foo"
nil
iex> RedisCache.ClientCluster.put "foo", "bar bar"
:ok
iex> RedisCache.ClientCluster.get "foo"
"bar bar"
```

The Redis-Cluster:

```elixir
iex> RedisCache.RedisCluster.get "foo"
nil
iex> RedisCache.RedisCluster.put "foo", "bar bar bar"
:ok
iex> RedisCache.RedisCluster.get "foo"
"bar bar bar"
```

Finally the multi-level one:

```elixir
iex> RedisCache.Multilevel.get "hello"
nil
iex> RedisCache.Multilevel.L1.get "hello"
nil
iex> RedisCache.Multilevel.L2.get "hello"
nil
iex> RedisCache.Multilevel.put "hello", "world"
:ok
iex> RedisCache.Multilevel.get "hello"
"world"
iex> RedisCache.Multilevel.L1.get "hello"
"world"
iex> RedisCache.Multilevel.L2.get "hello"
"world"
```
