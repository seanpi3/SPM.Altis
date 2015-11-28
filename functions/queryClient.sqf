/*
	Facilitates communication between server and client.
*/
private["_variable"];
_variable = _this select 0;

if(isDedicated) exitWith {};
switch(_variable) do {
	case "ready":{
		[["ready",player, ready, squadReady],"fnc_informServer", false, false] call bis_fnc_MP;
	};
	case "deploy":{
		deploy = true;
	};
	case "reset":{
		ready = false;
		squadReady = false;
		deploy = false;
	};
	case "stats":{
		_kills = _this select 1;
		_deaths = _this select 2;
		kills = _kills;
		deaths = _deaths;
	};
};