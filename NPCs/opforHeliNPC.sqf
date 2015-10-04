_npc = _this select 0;
removeAllWeapons _npc;
sleep .5;
_npc disableAI "ANIM";
_npc allowDamage false;
_npc addAction ["Spawn Helicopter", 
	{}];