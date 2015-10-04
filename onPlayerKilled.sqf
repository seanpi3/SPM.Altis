private["_corpse","_killer"];

_corpse = _this select 0;
_killer = _this select 1;
[["EnemyKilled",["Enemy Killed",format["You killed %1",name _corpse]]],"BIS_fnc_showNotification", _killer,false] call BIS_fnc_MP;