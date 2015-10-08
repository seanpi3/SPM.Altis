if(!isDedicated) exitWith {};

//Waiting for squads
while{islandSquadCount < 2} do {
	if(isNull islandNorth && isNull islandSouth) exitWith {
		fedMissionFilling = false;
		fedSquadCount = 0;
		publicVariable "fedMissionFilling";
		publicVariable "fedSquadCount";
	};
	if(!isNull islandNorth) then {
		["Waiting for a second squad to start the match","hint",islandNorth,false] call BIS_fnc_MP;
	};
	if(!isNull islandSouth) then {
		["Waiting for a second squad to start the match","hint",islandSouth,false] call BIS_fnc_MP;
	};
	sleep 5;
};
["Second squad found. You may now deploy to the battlefield.","hint", islandNorth] call BIS_fnc_MP;
["Second squad found. You may now deploy to the battlefield.","hint", islandSouth] call BIS_fnc_MP;
["deploy","fnc_queryClient",islandNorth,false] call BIS_fnc_MP;
["deploy","fnc_queryClient",islandSouth,false] call BIS_fnc_MP;
islandMissionFilling = false;
publicVariable "islandMissionFilling";
//max squads, start the mission

islandMissionInProgress = true;
publicVariable "islandMissionInProgress";

//waiting for squads to be ready
playersReady = [];
_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	[["ready"],"fnc_queryClient",islandNorth, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",islandSouth, false] call bis_fnc_MP;	
	if(islandNorth in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",islandNorth, false] call BIS_fnc_MP;
	};
	if(islandSouth in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",islandSouth, false] call BIS_fnc_MP;
	};
	sleep 1;
};
playersReady = [];
[["reset"],"fnc_queryClient",islandNorth,false] call bis_fnc_MP;
[["reset"],"fnc_queryClient",islandSouth,false] call bis_fnc_MP;

[[false], "fnc_freezePlayer", islandSouth, false] call BIS_fnc_MP;
[[false], "fnc_freezePlayer", islandNorth, false] call BIS_fnc_MP;

[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",islandNorth,false] call BIS_fnc_MP;
[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",islandSouth,false] call BIS_fnc_MP;

[[],"fnc_islandFlag",islandNorth, false] call bis_fnc_MP;
[[],"fnc_islandFlag",islandSouth, false] call bis_fnc_MP;
//mission run
while{islandMissionInProgress} do {
	sleep 2;
	if(isNull islandNorth || isNull islandSouth) then {
		islandMissionInProgress = false;
	};
};

[[islandNorth, islandSouth],"fnc_returnToBase"] call BIS_fnc_MP;
opforMission = "";
blueforMission = "";
islandNorth = grpNull;
islandSouth = grpNull;
islandSquadCount = 0;
publicVariable "opforMission";
publicVariable "blueforMission";


