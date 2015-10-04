private["_variable"];
_variable = _this select 0;
switch(_variable) do {
	case "ready":{
		[[player, ready, squadReady],"fnc_informServer", false, true]call bis_fnc_MP;
	};
	case "reset":{
		ready = false;
		squadReady = false;
	};
	case "deploy":{
		if(deploy) then {
			deploy = false;
		}
		else {
			deploy = true;
		};
	};
};