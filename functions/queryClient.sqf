private["_variable"];
_variable = _this select 0;
switch(_variable) do {
	case "ready":{
		[[player, ready, squadReady],"fnc_informServer", false, false]call bis_fnc_MP;
	};
	case "deploy":{
		deploy = true;
	};
	case "reset":{
		ready = false;
		squadReady = false;
		deploy = false;
	};
};