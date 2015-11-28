/*
	Initialization for the base medic NPC.
*/
_NPC = _this select 0;
_NPC disableAI "ANIM";
_NPC allowDamage false;
_NPC addAction["Get Medical Attention", {player setDamage 0; hint "You are now fully healed."},nil,-1,false,false,"","_this distance _target <= 5"];