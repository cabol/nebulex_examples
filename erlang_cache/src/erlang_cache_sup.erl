%%%-------------------------------------------------------------------
%% @doc erlang_cache top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(erlang_cache_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

init([]) ->
  {ok, {{one_for_one, 5, 10}, [nbx_cache_child_spec()]}}.

%%====================================================================
%% Internal functions
%%====================================================================

nbx_cache_child_spec() ->
  {
    'NbxCache',
    {'Elixir.NbxCache', start_link, []},
    permanent,
    infinity,
    supervisor,
    ['NbxCache']
  }.
