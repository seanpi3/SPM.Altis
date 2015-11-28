/*
	Called when a players gets intel. Gets a mission for the squad.
*/
private["_squad","_missionRecieved"];
_squad = _this select 0;
[[_squad],"fnc_getMission",false, false] call BIS_fnc_MP;

