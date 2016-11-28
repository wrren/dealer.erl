-module( dealer_app ).
-behaviour( application ).
%% application callbacks
-export( [start/2, stop/1] ).

start( _StartType, _StartArgs ) ->
    dealer_sup:start_link().

stop( _State) ->
    ok.
