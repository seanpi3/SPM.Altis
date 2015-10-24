private ["_spawn","_display"];
waitUntil {!isNull player};
systemChat "Initializing player...";
holstered = false;
fronzen = false;
ready = false;
squadReady = false;
deploy = false;
sitting = false;
weapon = getText(configFile >> "cfgWeapons" >> (currentWeapon player) >> "displayName");
squad = "none";
redgull = 5;
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
//[] execVM "Scripts\tempestBase.sqf";
waitUntil {!isNull(findDisplay 46)};
disableSerialization;
 _display = findDisplay 46;
 _display displaySetEventHandler ["KeyDown","_this call handler"];
handler = { 
	private['_handled'];
	_handled = false;
	_code = _this select 1;
	switch (_code) do {
	case 35: {
		[] call fnc_holsterWeapon; 
		};
	};
	case 20: {
		[] execVM "Scripts\tempestBase.sqf";
	};
	if (_code in (actionKeys "User10")) then {
		if (soundVolume < 0.21) then { 0 fadeSound 1; }
		else { 0 fadeSound 0.2; };
		systemChat format["Sound volume changed to %1%2.", soundVolume * 100, "%"];
		_handled = true;
	};
	if (_code in (actionKeys "User11")) then {
		if(redgull > 0) then
		{
			player setFatigue 0;
			life_redgull_effect = time;
			titleText["You can now run farther for 3 minutes","PLAIN"];
			player enableFatigue false;
			redgull = redgull - 1;
			systemChat format["You now have %1 redgull(s)",redgull];
			[] spawn
			{
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		}
		else{
			titleText["You have no more redgulls.","PLAIN"];
		};
		_handled = true;
	};
	_handled;
};


