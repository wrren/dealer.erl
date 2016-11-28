-module( dealer_master ).
-author( "Warren Kenny <warren.kenny@gmail.com>" ).
-behaviour( gen_server ).
%% gen_server callbacks
-export( [init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2] ).
%% public api
-export( [pid/1, ] ).

-record( state, { slaves = [] :: [pid()] } ).

%%
%%	@doc Initialize the Server
%%
init( Args ) ->
	{ ok, #state{} }.

%%
%%	@doc Handle a synchronous message
%%
handle_call( _Call, _From, State ) ->
	{ reply, ok, State }.

%%
%%	@doc Handle an asynchronous message
%%
handle_cast( _Cast, State ) ->
	{ noreply, State }.

%%
%%	@doc Handle an out-of-band message
%%
handle_info( _Info, State ) ->
	{ noreply, State }.

%%
%%	@doc Handle a code change event
%%
code_change( _OldVersion, State, _Extra ) ->
	{ ok, State }.

%%
%%	@doc Terminate
%%
terminate( _Reason, _State ) ->
	ok.