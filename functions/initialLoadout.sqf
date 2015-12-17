/*
	Standard initial loadout for players.
*/
private ["_unit"];
_unit = _this select 0;

removeAllWeapons _unit;
removeAllAssignedItems _unit;
//removeAllContainers _unit;
//removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;

//_unit  addVest "V_TacVest_khk";
//_unit  addUniform "U_O_GhillieSuit";
//_unit  addBackPack "B_Kitbag_mcamo";
 
_unit addWeapon 'Binocular';

//_unit addItem "NVGoogles";
//_unit addItem "ItemWatch";
//_unit addItem "ItemMap";
//_unit addItem "ItemCompass";
//_unit addItem "ItemGPS";

//_unit assignItem "ItemMap";
//_unit assignItem "ItemWatch";
//_unit assignItem "ItemCompass";
//_unit assignItem "NVGoogles";
//_unit assignItem "ItemGPS";

//_unit addMagazines ["20Rnd_762x51_Mag", 11];
//_unit  addWeapon "srifle_EBR_ACO_F";
//_unit  addPrimaryWeaponItem "optic_Arco";


        
//_unit addItem 'FirstAidKit';
//_unit addItem 'FirstAidKit';
//_unit addItem 'FirstAidKit';
//_unit addMagazine 'SmokeShellBlue';
//_unit addMagazine 'SmokeShellGreen';