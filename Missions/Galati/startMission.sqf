if(!isDedicated) exitWith {};

//Waiting for squads
while{galatiSquadCount < 2} do {
	if(isNull galatiNorth && isNull galatiSouth) exitWith {
		galatiMissionFilling = false;
		galatiSquadCount = 0;
		publicVariable "galatiMissionFilling";
		publicVariable "galatiSquadCount";
	};
	if(!isNull galatiNorth) then {
		["Waiting for a second squad to start the match","hint",galatiNorth,false] call BIS_fnc_MP;
	};
	if(!isNull galatiSouth) then {
		["Waiting for a second squad to start the match","hint",galatiSouth,false] call BIS_fnc_MP;
	};
	sleep 2;
};
["Second squad found. You may now deploy to the battlefield.","hint", galatiNorth] call BIS_fnc_MP;
["Second squad found. You may now deploy to the battlefield.","hint", galatiSouth] call BIS_fnc_MP;
["deploy","fnc_queryClient",galatiNorth,false] call BIS_fnc_MP;
["deploy","fnc_queryClient",galatiSouth,false] call BIS_fnc_MP;
galatiMissionFilling = false;
publicVariable "galatiMissionFilling";
//max squads, start the mission

galatiMissionInProgress = true;
publicVariable "galatiMissionInProgress";

//waiting for squads to be ready

_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	if(isNull galatiNorth && isNull galatiSouth) exitWith {
		opforMission = "";
		blueforMission = "";
		galatiNorth = grpNull;
		galatiSouth = grpNull;
		galatiSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
	}; 
	if(isNull galatiNorth) exitWith {
		[[grpNull, galatiSouth],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		galatiNorth = grpNull;
		galatiSouth = grpNull;
		galatiSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	if(isNull galatiSouth) exitWith {
		[[grpNull, galatiNorth],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		galatiNorth = grpNull;
		galatiSouth = grpNull;
		galatiSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	[["ready"],"fnc_queryClient",galatiNorth, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",galatiSouth, false] call bis_fnc_MP;	
	_count = 0;
	_squad = units galatiNorth;
	while{_count < count _squad} do {
		_player = _squad select _count;
		_squad1Ready = true;
		if(!(_player in playersReady)) then {
			_squad1Ready = false;
		};
		_count = _count + 1;
	};
	_count = 0;
	_squad = units galatiSouth;
	while{_count < count _squad} do{
		_player = _squad select _count;
		_squad2Ready = true;
		if(!(_player in playersReady)) then {
			_squad2Ready = false;
		};
		_count = _count + 1;
	};
	if(galatiNorth in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",galatiNorth, false] call BIS_fnc_MP;
	};
	if(galatiSouth in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",galatiSouth, false] call BIS_fnc_MP;
	};
	sleep 2;
};
playersReady = [];
[["reset"],"fnc_queryClient",galatiNorth,false] call bis_fnc_MP;
[["reset"],"fnc_queryClient",galatiSouth,false] call bis_fnc_MP;

[[false], "fnc_freezePlayer", galatiSouth, false] call BIS_fnc_MP;
[[false], "fnc_freezePlayer", galatiNorth, false] call BIS_fnc_MP;

[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",galatiNorth,false] call BIS_fnc_MP;
[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",galatiSouth,false] call BIS_fnc_MP;

[[],"fnc_galatiFlag",galatiNorth, false] call bis_fnc_MP;
[[],"fnc_galatiFlag",galatiSouth, false] call bis_fnc_MP;
//mission run
while{galatiMissionInProgress} do {
	sleep 2;
	if(isNull galatiNorth || isNull galatiSouth) then {
		galatiMissionInProgress = false;
	};
};

[[galatiNorth, galatiSouth],"fnc_returnToBase"] call BIS_fnc_MP;
opforMission = "";
blueforMission = "";
galatiNorth = grpNull;
galatiSouth = grpNull;
galatiSquadCount = 0;
publicVariable "opforMission";
publicVariable "blueforMission";


