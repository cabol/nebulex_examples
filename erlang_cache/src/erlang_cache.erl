-module(erlang_cache).

%% Application callbacks
-export([run_test/0]).

-define(nbx_cache, 'Elixir.NbxCache').

%%====================================================================
%% API
%%====================================================================

run_test() ->
  io:format("Testing or 'NbxCache' ...~n~n"),

  io:format(
    "#==> 'Elixir.NbxCache':get(my_key) -> ~p~n",
    [?nbx_cache:get(my_key)]),

  io:format(
    "#==> 'Elixir.NbxCache':set(my_key, hello) -> ~p~n",
    [?nbx_cache:put(my_key, hello)]),

  io:format(
    "#==> 'Elixir.NbxCache':get(my_key) -> ~p~n",
    [?nbx_cache:get(my_key)]),

  io:format(
    "#==> 'Elixir.NbxCache':delete(my_key) -> ~p~n",
    [?nbx_cache:delete(my_key)]),

  io:format(
    "#==> 'Elixir.NbxCache':get(my_key) -> ~p~n",
    [?nbx_cache:get(my_key)]),

  ok.
