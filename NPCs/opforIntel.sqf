private["_npc"];
_npc = _this select 0;
_npc allowDamage false;
[_npc,"sit_table"] execVM "ShoterAnimation\ShoterAnimation.sqf";
removeBackpack _npc;
_npc addAction ["Get Intel", {[group player] call fnc_getIntel}, nil,1.5,false,false,"","opforMission=='' && _this distance _target <= 5"];
_npc disableAI "ANIM";