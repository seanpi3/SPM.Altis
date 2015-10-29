private["_variable", "_player","_ready","_squadReady"];
_variable = _this select 0;
_player = _this select 1;

switch(_variable) do {
	case "ready":{
		_ready = _this select 2;
		_squadReady = _this select 3;
		if(_player in playersReady) exitWith{};
		if(group _player in playersReady) exitWith{};
		if(_squadReady) then {
			playersReady = playersReady + [group _player];
		};
		if(_ready) then {
			playersReady = playersReady + [_player];
		};
	};
};



