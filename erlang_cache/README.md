# erlang_cache

**NOTE:** This example is broken at the moment due to issues with the Elixir
plugin. In the future it should use [rebar_mix](https://github.com/Supersonido/rebar_mix)
but it doesn't support local dependencies yet (`_checkouts` in rebar3); waiting
for [this issue](https://github.com/Supersonido/rebar_mix/issues/13) to be
fixed.

This example illustrates how to use [Nebulex](https://github.com/cabol/nebulex)
from an Erlang app using the [rebar3_elixir_compile plugin](https://github.com/barrel-db/rebar3_elixir_compile).

First, we have to configure the [rebar.config](rebar.config) based on the
`rebar3_elixir_compile` plugin.

Then, we have defined the [Nebulex cache](elixir_libs/nbx_cache/lib/nbx_cache.ex)
in a separated Elixir project, in order it can be compiled correctly. This
Elixir project must be under `elixir_libs` directory (see the
[rebar3_elixir_compile plugin](https://github.com/barrel-db/rebar3_elixir_compile)),
and because most of the Nebulex options are needed in compile-time, we also need
to configure the cache in the [Elixir config file](elixir_libs/nbx_cache/config/config.exs).

Besides, it is needed to configure the cache in our Erlang app [config file](config/sys.config)
and setup the cache as a supervisor within our application's supervision tree;
see the [erlang_cache_sup](src/erlang_cache_sup.erl) module.

And finally, thanks to the `rebar3_elixir_compile` plugin we are able to use
the `NbxCache` from our Erlang all; see the [test example](src/erlang_cache.erl).

## Getting started

First, let's compile our Erlang app:

```
$ rebar3 compile
```

Then we can run our app:

```
$ rebar3 shell --config config/sys.config
```

Now we are ready to use [NbxCache](elixir_libs/nbx_cache/lib/nbx_cache.ex) from
out Erlang app, let's run a [simple test example](src/erlang_cache.erl):

```
1> erlang_cache:run_test().
Testing or 'NbxCache' ...

#==> 'Elixir.NbxCache':get(my_key) -> nil
#==> 'Elixir.NbxCache':set(my_key, hello) -> ok
#==> 'Elixir.NbxCache':get(my_key) -> hello
#==> 'Elixir.NbxCache':delete(my_key) -> ok
#==> 'Elixir.NbxCache':get(my_key) -> nil
ok
```

You can also call the `NbxCache` directly:

```
2> 'Elixir.NbxCache':get("foo").
nil
3> 'Elixir.NbxCache':set("foo", "bar").
"bar"
4> 'Elixir.NbxCache':get("foo").
"bar"
5> 'Elixir.Nebulex.Cache.Stats':get_counters('Elixir.NbxCache').
[{delete,1},{get_miss_count,3},{get,2},{set,2}]
```

It is pretty easy!

BTW, you should run the `observer` in order to see how the Nebulex runs
as part of the Erlang application's supervision tree:

```
6> observer:start().
```
