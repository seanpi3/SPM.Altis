/*
	Castle mission run.
*/
if(!isDedicated) exitWith {};

//Waiting for squads
while{castleSquadCount < 2} do {
	if(isNull castleOffence && isNull castleDefence) exitWith {
		castleMissionFilling = false;
		castleSquadCount = 0;
		publicVariable "castleMissionFilling";
		publicVariable "castleSquadCount";
	};
	if(!isNull castleOffence) then {
		["Waiting for a second squad to start the match","hint",castleOffence,false] call BIS_fnc_MP;
	};
	if(!isNull castleDefence) then {
		["Waiting for a second squad to start the match","hint",castleDefence,false] call BIS_fnc_MP;
	};
	sleep 2;
};
["Second squad found. You may now deploy to the battlefield.","hint", castleOffence] call BIS_fnc_MP;
["Second squad found. You may now deploy to the battlefield.","hint", castleDefence] call BIS_fnc_MP;
[["deploy"],"fnc_queryClient",castleOffence,false] call BIS_fnc_MP;
[["deploy"],"fnc_queryClient",castleDefence,false] call BIS_fnc_MP;
castleMissionFilling = false;
publicVariable "castleMissionFilling";
//max squads, start the mission

castleMissionInProgress = true;
publicVariable "castleMissionInProgress";

_offence = units castleOffence;
_defence = units castleDefence;

//waiting for squads to be ready
_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	if(isNull castleOffence && isNull castleDefence) exitWith {
		opforMission = "";
		blueforMission = "";
		castleOffence = grpNull;
		castleDefence = grpNull;
		castleSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
	}; 
	if(isNull castleOffence) exitWith {
		[[grpNull, castleDefence],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		castleOffence = grpNull;
		castleDefence = grpNull;
		castleSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	if(isNull castleDefence) exitWith {
		[[grpNull, castleOffence],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		castleOffence = grpNull;
		castleDefence = grpNull;
		castleSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	[["ready"],"fnc_queryClient",castleOffence, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",castleDefence, false] call bis_fnc_MP;	
	_count = 0;
	_squad = units castleOffence;
	while{_count < count _squad} do {
		_player = _squad select _count;
		_squad1Ready = true;
		if(!(_player in playersReady)) then {
			_squad1Ready = false;
		};
		_count = _count + 1;
	};
	_count = 0;
	_squad = units castleDefence;
	while{_count < count _squad} do{
		_player = _squad select _count;
		_squad2Ready = true;
		if(!(_player in playersReady)) then {
			_squad2Ready = false;
		};
		_count = _count + 1;
	};
	if(castleOffence in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",castleOffence, false] call BIS_fnc_MP;
	};
	if(castleDefence in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",castleDefence, false] call BIS_fnc_MP;
	};
	sleep 2;
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
	if(isNull castleOffence || isNull castleDefence) then {
		castleMissionInProgress = false;
	};
	/*if(_offence == []) then {
		[["MissionCompleted",format
			["The other team has been eliminated!"]
		],"fnc_notify", castleDefence, false] call BIS_fnc_MP;
		castleMissionInProgress = false;
	};
	*/
	if(_defence == []) then {
		[["MissionCompleted",format
			["The other team has been eliminated!"]
		],"fnc_notify", castleOffence, false] call BIS_fnc_MP;
		castleMissionInProgress = false;
	};
	{
		if(!alive _x) then {
			_offence = _offence - [_x];
		};
	} forEach _offence;
	{
		if(!alive _x) then {
			_offence = _offence - [_x];
		};
	} forEach _defence;
	sleep 1;
};

[[],"fnc_missionCompleted",castleOffence,false] call BIS_fnc_MP;
[[],"fnc_missionCompleted",castleDefence,false] call BIS_fnc_MP;

castleOffence = grpNull;
castleDefence = grpNull;
castleSquadCount = 0;



