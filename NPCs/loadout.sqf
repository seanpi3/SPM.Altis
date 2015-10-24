_NPC = _this select 0;
removeAllWeapons _NPC;
_NPC allowDamage false;
_NPC addAction ["Choose Loadout", 
	"Scripts\arsenal.sqf",nil,-1,false,false,"","_this distance _target <= 5"];
[_NPC, "briefing"] execVM "ShoterAnimation\ShoterAnimation.sqf";
_NPC disableAI "ANIM";
_pos = getPos _NPC;
while{true} do {
	waitUntil {[getPos _NPC,_pos] call BIS_fnc_areEqual};
	_NPC setPos _pos;
};
