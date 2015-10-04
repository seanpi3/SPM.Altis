private ["_spawn","_display"];
waitUntil {!isNull player};
systemChat "Initializing player...";
holstered = false;
fronzen = false;
ready = false;
squadReady = false;
deploy = false;
weapon = getText(configFile >> "cfgWeapons" >> (currentWeapon player) >> "displayName");

squad = "none";

[player] execVM "Scripts\loadout.sqf";

switch (playerSide) do {
	case west: 
	{	
		squad = "bluefor";
		player setPos getPos respawn_west;
		player setDir getDir respawn_west;
	};
	case east:
	{
		squad = "opfor";
		player setPos getPos respawn_east;
		player setDir direction respawn_east;
	};
	
	case resistance:
	{
		
	};

	default {hint "You shouldn't be here..."};
};

[] call fnc_playerActions;
[] execVM "Scripts\player_markers.sqf";

waitUntil {!isNull(findDisplay 46)};
disableSerialization;
 _display = findDisplay 46;
 _display displaySetEventHandler ["KeyDown","_this call handler"];
handler = { 
	private['_handled'];
	_handled = false;
	switch (_this select 1) do {
	case 35: {
		[] call fnc_holsterWeapon; 
		};
	};
	_handled;
};

