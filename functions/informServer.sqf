private["_player","_ready","_squadReady"];
_player = _this select 0;
_ready = _this select 1;
_squadReady = _this select 2;
if(_player in playersReady) exitWith{};
if(group _player in playersReady) exitWith{};
if(_squadReady) then {
	playersReady = playersReady + [group _player];
};
if(_ready) then {
	playersReady = playersReady + [_player];
};

