if(!isDedicated) exitWith {};

//Waiting for squads
while{swampSquadCount < 2} do {
	if(isNull swampTeam1 && isNull swampTeam2) exitWith {
		swampMissionFilling = false;
		swampSquadCount = 0;
		publicVariable "swampMissionFilling";
		publicVariable "swampSquadCount";
	};
	if(!isNull swampTeam1) then {
		["Waiting for a second squad to start the match","hint",swampTeam1,false] call BIS_fnc_MP;
	};
	if(!isNull swampTeam2) then {
		["Waiting for a second squad to start the match","hint",swampTeam2,false] call BIS_fnc_MP;
	};
	sleep 2;
};
["Second squad found. You may now deploy to the battlefield.","hint", swampTeam1] call BIS_fnc_MP;
["Second squad found. You may now deploy to the battlefield.","hint", swampTeam2] call BIS_fnc_MP;
[["deploy"],"fnc_queryClient",swampTeam1,false] call BIS_fnc_MP;
[["deploy"],"fnc_queryClient",swampTeam2,false] call BIS_fnc_MP;
swampMissionFilling = false;
publicVariable "swampMissionFilling";
//max squads, start the mission

swampMissionInProgress = true;
publicVariable "swampMissionInProgress";

//waiting for squads to be ready

_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	if(isNull swampTeam1 && isNull swampTeam2) exitWith {
		opforMission = "";
		blueforMission = "";
		swampTeam1 = grpNull;
		swampTeam2 = grpNull;
		swampSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
	}; 
	if(isNull swampTeam1) exitWith {
		[[grpNull, swampTeam2],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		swampTeam1 = grpNull;
		swampTeam2 = grpNull;
		swampSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	if(isNull swampTeam2) exitWith {
		[[grpNull, swampTeam1],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		swampTeam1 = grpNull;
		swampTeam2 = grpNull;
		swampSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	[["ready"],"fnc_queryClient",swampTeam1, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",swampTeam2, false] call bis_fnc_MP;	
	_count = 0;
	_squad = units swampTeam1;
	while{_count < count _squad} do {
		_player = _squad select _count;
		_squad1Ready = true;
		if(!(_player in playersReady)) then {
			_squad1Ready = false;
		};
		_count = _count + 1;
	};
	_count = 0;
	_squad = units swampTeam2;
	while{_count < count _squad} do{
		_player = _squad select _count;
		_squad2Ready = true;
		if(!(_player in playersReady)) then {
			_squad2Ready = false;
		};
		_count = _count + 1;
	};
	if(swampTeam1 in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",swampTeam1, false] call BIS_fnc_MP;
	};
	if(swampTeam2 in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",swampTeam2, false] call BIS_fnc_MP;
	};
	sleep 2;
};
playersReady = [];
[["reset"],"fnc_queryClient",swampTeam1,false] call bis_fnc_MP;
[["reset"],"fnc_queryClient",swampTeam2,false] call bis_fnc_MP;

[[false], "fnc_freezePlayer", swampTeam2, false] call BIS_fnc_MP;
[[false], "fnc_freezePlayer", swampTeam1, false] call BIS_fnc_MP;

[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",swampTeam1,false] call BIS_fnc_MP;
[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",swampTeam2,false] call BIS_fnc_MP;

[[],"fnc_swampFlags",swampTeam1, false] call bis_fnc_MP;
[[],"fnc_swampFlags",swampTeam2, false] call bis_fnc_MP;
//mission run
while{swampMissionInProgress} do {
	sleep 2;
	if(isNull swampTeam1 || isNull swampTeam2) then {
		swampMissionInProgress = false;
	};
};

[[swampTeam1, swampTeam2],"fnc_returnToBase"] call BIS_fnc_MP;
opforMission = "";
blueforMission = "";
swampTeam1 = grpNull;
swampTeam2 = grpNull;
swampSquadCount = 0;
publicVariable "opforMission";
publicVariable "blueforMission";


