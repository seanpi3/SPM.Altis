private["_oldUnit", "_killer"];
_oldUnit = _this select 0;
_killer = _this select 1;
if(_killer != player) then {
	[[],"fnc_addKill",_killer,false] call bis_fnc_mp;
};
call fnc_addDeath;