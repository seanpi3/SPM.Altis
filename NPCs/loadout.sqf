_NPC = _this select 0;
removeAllWeapons _NPC;
_NPC allowDamage false;
_NPC addAction ["Choose Loadout", 
	"Scripts\arsenal.sqf",nil,-1,false,false,"","_this distance _target <= 5"];
_NPC addAction ["View Stats",{call fnc_viewStats}
	,nil,-1,false,false,"","_this distance _target <= 5"];
[_NPC, "briefing"] execVM "ShoterAnimation\ShoterAnimation.sqf";
_NPC disableAI "ANIM";
