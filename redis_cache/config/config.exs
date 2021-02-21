import Config

# Redis Standalone
config :redis_cache, RedisCache.Standalone,
  conn_opts: [
    host: "127.0.0.1",
    port: 6379
  ]

# Redis in client-cluster mode
config :redis_cache, RedisCache.ClientCluster,
  mode: :client_side_cluster,
  nodes: [
    node1: [
      conn_opts: [
        host: "127.0.0.1",
        port: 9001
      ]
    ],
    node2: [
      pool_size: 2,
      conn_opts: [
        url: "redis://127.0.0.1:9002"
      ]
    ],
    node3: [
      conn_opts: [
        host: "127.0.0.1",
        port: 9003
      ]
    ]
  ]

# Redis Cluster mode
config :redis_cache, RedisCache.RedisCluster,
  mode: :redis_cluster,
  master_nodes: [
    [
      host: "127.0.0.1",
      port: 7000
    ],
    [
      url: "redis://127.0.0.1:7001"
    ],
    [
      url: "redis://127.0.0.1:7002"
    ]
  ],
  conn_opts: [
    host: "127.0.0.1"
  ]

# Multilevel cache  – L1 -> Local and L2 -> RedisCluster
config :redis_cache, RedisCache.Multilevel,
  model: :inclusive,
  levels: [
    {
      RedisCache.Multilevel.L1,
      gc_interval: :timer.seconds(3600) * 12
    },
    {
      # It can be also the Redis Cluster or the Client-Cluster
      RedisCache.Multilevel.L2,
      conn_opts: [
        host: "127.0.0.1",
        port: 6379
      ]
    }
  ]
