private ["_frozen"];
_frozen = _this select 0;

if(_frozen) then {
	player enableSimulation false;
}
else{
	player enableSimulation true;
};
