if(!isDedicated) exitWith {};

//Waiting for squads
while{castleSquadCount < 2} do {
	if(isNull castleOffence && isNull castleDefence) exitWith {
		fedMissionFilling = false;
		fedSquadCount = 0;
		publicVariable "fedMissionFilling";
		publicVariable "fedSquadCount";
	};
	if(!isNull castleOffence) then {
		["Waiting for a second squad to start the match","hint",castleOffence,false] call BIS_fnc_MP;
	};
	if(!isNull castleDefence) then {
		["Waiting for a second squad to start the match","hint",castleDefence,false] call BIS_fnc_MP;
	};
	sleep 5;
};
["Second squad found. You may now deploy to the battlefield.","hint", castleOffence] call BIS_fnc_MP;
["Second squad found. You may now deploy to the battlefield.","hint", castleDefence] call BIS_fnc_MP;
["deploy","fnc_queryClient",castleOffence,false] call BIS_fnc_MP;
["deploy","fnc_queryClient",castleDefence,false] call BIS_fnc_MP;
castleMissionFilling = false;
publicVariable "castleMissionFilling";
//max squads, start the mission

castleMissionInProgress = true;
publicVariable "castleMissionInProgress";

//waiting for squads to be ready
playersReady = [];
_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	[["ready"],"fnc_queryClient",castleOffence, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",castleDefence, false] call bis_fnc_MP;	
	if(castleOffence in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",castleOffence, false] call BIS_fnc_MP;
	};
	if(castleDefence in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",castleDefence, false] call BIS_fnc_MP;
	};
	sleep 1;
};
playersReady = [];
[["reset"],"fnc_queryClient",castleOffence,false] call bis_fnc_MP;
[["reset"],"fnc_queryClient",castleDefence,false] call bis_fnc_MP;

[[false], "fnc_freezePlayer", castleDefence, false] call BIS_fnc_MP;
[[false], "fnc_freezePlayer", castleOffence, false] call BIS_fnc_MP;

[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",castleOffence,false] call BIS_fnc_MP;
[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",castleDefence,false] call BIS_fnc_MP;

[[],"fnc_castleFlag",castleOffence, false] call bis_fnc_MP;
[[],"fnc_castleFlag",castleDefence, false] call bis_fnc_MP;
//mission run
while{castleMissionInProgress} do {
	sleep 2;
	if(isNull castleOffence || isNull castleDefence) then {
		castleMissionInProgress = false;
	};
};

[[castleOffence, castleDefence],"fnc_returnToBase"] call BIS_fnc_MP;
opforMission = "";
blueforMission = "";
castleOffence = grpNull;
castleDefence = grpNull;
castleSquadCount = 0;
publicVariable "opforMission";
publicVariable "blueforMission";


