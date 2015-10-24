private ["_fridge"];
_fridge = _this select 0;

_fridge addAction["Grab redgulls", {
	redgull = 5;
	SystemChat format["You now have %1 redgulls", redgull];
},nil,1.5,false,false,"","_this distance _target <= 5"];