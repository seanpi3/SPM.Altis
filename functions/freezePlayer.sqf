private ["_frozen"];
_frozen = _this select 0;

if(_frozen) then {
	player enableSimulation false;
	frozen = true;
}
else{
	player enableSimulation true;
	frozen = false;
};
