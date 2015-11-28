/*
	Freezes a player. For use at the beginning of a mission while waiting for all players to be ready.
*/
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
