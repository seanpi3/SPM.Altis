if(!isDedicated) exitWith {};

//Waiting for squads
while{methSquadCount < 2} do {
	if(isNull methOffence && isNull methDefence) exitWith {
		methMissionFilling = false;
		methSquadCount = 0;
		publicVariable "methMissionFilling";
		publicVariable "methSquadCount";
	};
	if(!isNull methOffence) then {
		["Waiting for a second squad to start the match","hint",methOffence,false] call BIS_fnc_MP;
	};
	if(!isNull methDefence) then {
		["Waiting for a second squad to start the match","hint",methDefence,false] call BIS_fnc_MP;
	};
	sleep 2;
};
["Second squad found. You may now deploy to the battlefield.","hint", methOffence] call BIS_fnc_MP;
["Second squad found. You may now deploy to the battlefield.","hint", methDefence] call BIS_fnc_MP;
["deploy","fnc_queryClient",methOffence,false] call BIS_fnc_MP;
["deploy","fnc_queryClient",methDefence,false] call BIS_fnc_MP;
methMissionFilling = false;
publicVariable "methMissionFilling";
//max squads, start the mission

methMissionInProgress = true;
publicVariable "methMissionInProgress";

//waiting for squads to be ready
playersReady = [];
_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	[["ready"],"fnc_queryClient",methOffence, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",methDefence, false] call bis_fnc_MP;	
	_count = 0;
	_squad = units methOffence;
	while{_count < count _squad} do {
		_player = _squad select _count;
		_squad1Ready = true;
		if(!(_player in playersReady)) then {
			_squad1Ready = false;
		};
		_count = _count + 1;
	};
	_count = 0;
	_squad = units methDefence;
	while{_count < count _squad} do{
		_player = _squad select _count;
		_squad2Ready = true;
		if(!(_player in playersReady)) then {
			_squad2Ready = false;
		};
		_count = _count + 1;
	};
	if(methOffence in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",methOffence, false] call BIS_fnc_MP;
	};
	if(methDefence in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",methDefence, false] call BIS_fnc_MP;
	};
	sleep 2;
    [format["Waiting for squads to be ready: %1",playersReady],"hint",true,false] call bis_fnc_MP;
};
playersReady = [];
[["reset"],"fnc_queryClient",methOffence,false] call bis_fnc_MP;
[["reset"],"fnc_queryClient",methDefence,false] call bis_fnc_MP;

[[false], "fnc_freezePlayer", methDefence, false] call BIS_fnc_MP;
[[false], "fnc_freezePlayer", methOffence, false] call BIS_fnc_MP;

[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",methOffence,false] call BIS_fnc_MP;
[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",methDefence,false] call BIS_fnc_MP;

[[],"fnc_methFlag",methOffence, false] call bis_fnc_MP;
[[],"fnc_methFlag",methDefence, false] call bis_fnc_MP;
//mission run
while{methMissionInProgress} do {
	sleep 2;
	if(isNull methOffence || isNull methDefence) then {
		methMissionInProgress = false;
	};
};

[[methOffence, methDefence],"fnc_returnToBase"] call BIS_fnc_MP;
opforMission = "";
blueforMission = "";
methOffence = grpNull;
methDefence = grpNull;
methSquadCount = 0;
publicVariable "opforMission";
publicVariable "blueforMission";


