-module( dealer_sup ).
-behaviour( supervisor ).
%% supervisor callbacks
-export([init/1]).
%% public api
-export( [start_link/0] ).

%%
%%  @doc Start the supervisor as a locally named process
%%
start_link() ->
    supervisor:start_link( { local, ?MODULE }, ?MODULE, [] ).

%%
%%  @doc Initialize the supervisor
%%
init([]) ->
    { ok, { {one_for_all, 1, 1 }, [
    ] } }.