-module( dealer ).
-author( "Warren Kenny <warren.kenny@gmail.com>" ).
%% public api
-export( [start_master/0, start_slave/1] ).

%%
%%	@doc Start a master process on this node under the dealer supervisor
%%
start_master() ->
	dealer_sup:start_child( 
        #{	id 		=> dealer_master,
            start 	=> { dealer_master, start_link, [] },
            restart	=> permanent,
            modules	=> [dealer_master]
        } ).

%%
%%	@doc Start a slave process on this node under the dealer supervisor
%%
start_slave( MasterNode ) ->
	dealer_sup:start_child( 
        #{	id 		=> dealer_slave,
            start 	=> { dealer_slave, start_link, [MasterNode] },
            restart	=> permanent,
            modules	=> [dealer_slave]
        } ).