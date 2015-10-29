private["_variable","_player","_ready","_squadReady"];
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
	case "kill":{
		_kills = _this select 2;
		_uid = getPlayerUID _player;
		["KD",_uid,"kills",_kills] call iniDB_write;
	};
	case "death":{
		_deaths = _this select 2;
		_uid = getPlayerUID _player;
		["KD",_uid,"deaths",_deaths] call iniDB_write;
	};
	case "stats":{
		_uid = getPlayerUID _player;
		_kills = ["KD",_uid,"kills","SCALAR"] call iniDB_read;
		_deaths = ["KD",_uid,"deaths","SCALAR"] call iniDB_read;
		[["stats",_kills,_deaths],"fnc_queryClient",_player,false] call bis_fnc_mp;
	};
};



