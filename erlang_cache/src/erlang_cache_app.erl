%%%-------------------------------------------------------------------
%% @doc erlang_cache public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_cache_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
  erlang_cache_sup:start_link().

stop(_State) ->
  ok.
