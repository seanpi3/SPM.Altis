private ["_state"];
_state = holstered;
if (!holstered) then
{
	if (currentWeapon player == primaryWeapon player) then
	{
		weapon = getText(configFile >> "cfgWeapons" >> (currentWeapon player) >> "displayName");
	};
	player removeAction holster;
	player action ["hideWeapon",player,player,100];
	unholster = player addAction[format["Weapon %1",weapon],fnc_holsterWeapon,false,100,false,false,"","holstered"]; 
	_state = true;
}
else
{
	player removeAction unholster;
	player action ["hideWeapon",player,player,0];
	holster = player addAction ["Holster Weapon", fnc_holsterWeapon, false,100,false,false,"","!holstered"];
	_state = false;
};
holstered = _state;