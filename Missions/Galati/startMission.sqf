if(!isDedicated) exitWith {};

//Waiting for squads
while{galatiSquadCount < 2} do {
	if(!isNull galatiNorth) then {
		["Waiting for a second squad to start the match","hint",galatiNorth,false] call BIS_fnc_MP;
	};
	if(!isNull galatiSouth) then {
		["Waiting for a second squad to start the match","hint",galatiSouth,false] call BIS_fnc_MP;
	};
	sleep 5;
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
playersReady = [];
_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	[["ready"],"fnc_queryClient",galatiNorth, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",galatiSouth, false] call bis_fnc_MP;	
	if(galatiNorth in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",galatiNorth, false] call BIS_fnc_MP;
	};
	if(galatiSouth in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",galatiSouth, false] call BIS_fnc_MP;
	};
	sleep 1;
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


