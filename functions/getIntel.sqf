private["_squad","_missionRecieved"];
_squad = _this select 0;
[[_squad],"fnc_getMission",false, false] call BIS_fnc_MP;

