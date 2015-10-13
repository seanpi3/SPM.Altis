private["_oldUnit","_killer"];
_killer = _this select 1;
[[],"fnc_addKill",_killer, false] call bis_fnc_MP;
//[[,],"bis_fnc_showNotification",_killer,false] call bis_fnc_MP;
[] call fnc_addDeath;