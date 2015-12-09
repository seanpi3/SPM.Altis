/*
	Initializes the player. Called every time the player spawns.
*/
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
earplugs = false;
[player] call fnc_initLoadout;

kills=0;
deaths=0;

[["stats",player],"fnc_informServer",false,false] call bis_fnc_mp;

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
		//Indipendent not implemented yet
	};

	default {hint "You shouldn't be here..."};
};

//[] call fnc_playerActions;
[] execVM "Scripts\player_markers.sqf";
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
	if (_code in (actionKeys "User10")) then {
		if (earplugs) then {
			0 fadeSound 1;
			titleText["Earplugs removed.","PLAIN"];
			earplugs = false;
		}
		else {
			0 fadeSound 0.2;
			titleText["Earplugs inserted.","PLAIN"];
			earplugs = true;
		};
		_handled = true;
	};
	if (_code in (actionKeys "User11")) then {
		if(redgull > 0) then
		{		
			redgullStart = time;
			titleText["You comsumed a redgull.","PLAIN"];
			player setFatigue 0;
			player enableFatigue false;
			redgull = redgull - 1;
			systemChat format["You now have %1 redgull(s)",redgull];
			[] spawn
			{
				_start = redgullStart;
				waitUntil {!alive player || ((time - redgullStart) > (60))};
				if(_start != redgullStart) exitWith{};
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


