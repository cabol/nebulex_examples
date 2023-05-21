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
  client_side_cluster: [
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
  ]

# Redis Cluster mode
config :redis_cache, RedisCache.RedisCluster,
  mode: :redis_cluster,
  redis_cluster: [
    configuration_endpoints: [
      endpoint1_conn_opts: [
        host: "127.0.0.1",
        port: 6380,
        password: "password"
      ]
    ],
    # Overrides the master host with the config endpoint, in this case with
    # 127.0.0.1 since we're using Docker.
    # For prod/real environments this is usually false.
    override_master_host: true
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
