private ["_frozen"];
_frozen = _this select 0;

if(_frozen) then {
	titleCut ["", "BLACK FADED", 999];
	player enableSimulation false;
	frozen = true;
}
else{
	titlecut [" ","BLACK IN",5];
	player enableSimulation true;
	frozen = false;
};
