if(!isDedicated) exitWith {};

//Waiting for squads
while{ruinsSquadCount < 2} do {
	if(isNull ruinsNorth && isNull ruinsSouth) exitWith {
		ruinsMissionFilling = false;
		ruinsSquadCount = 0;
		publicVariable "ruinsMissionFilling";
		publicVariable "ruinsSquadCount";
	};
	if(!isNull ruinsNorth) then {
		["Waiting for a second squad to start the match","hint",ruinsNorth,false] call BIS_fnc_MP;
	};
	if(!isNull ruinsSouth) then {
		["Waiting for a second squad to start the match","hint",ruinsSouth,false] call BIS_fnc_MP;
	};
	sleep 2;
};
["Second squad found. You may now deploy to the battlefield.","hint", ruinsNorth] call BIS_fnc_MP;
["Second squad found. You may now deploy to the battlefield.","hint", ruinsSouth] call BIS_fnc_MP;
["deploy","fnc_queryClient",ruinsNorth,false] call BIS_fnc_MP;
["deploy","fnc_queryClient",ruinsSouth,false] call BIS_fnc_MP;
ruinsMissionFilling = false;
publicVariable "ruinsMissionFilling";
//max squads, start the mission

ruinsMissionInProgress = true;
publicVariable "ruinsMissionInProgress";

//waiting for squads to be ready

_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	if(isNull ruinsNorth && isNull ruinsSouth) exitWith {
		opforMission = "";
		blueforMission = "";
		ruinsNorth = grpNull;
		ruinsSouth = grpNull;
		ruinsSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
	}; 
	if(isNull ruinsNorth) exitWith {
		[[grpNull, ruinsSouth],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		ruinsNorth = grpNull;
		ruinsSouth = grpNull;
		ruinsSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	if(isNull ruinsSouth) exitWith {
		[[grpNull, ruinsNorth],"fnc_returnToBase"] call BIS_fnc_MP;
		opforMission = "";
		blueforMission = "";
		ruinsNorth = grpNull;
		ruinsSouth = grpNull;
		ruinsSquadCount = 0;
		publicVariable "opforMission";
		publicVariable "blueforMission";
		
	};
	[["ready"],"fnc_queryClient",ruinsNorth, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",ruinsSouth, false] call bis_fnc_MP;	
	_count = 0;
	_squad = units ruinsNorth;
	while{_count < count _squad} do {
		_player = _squad select _count;
		_squad1Ready = true;
		if(!(_player in playersReady)) then {
			_squad1Ready = false;
		};
		_count = _count + 1;
	};
	_count = 0;
	_squad = units ruinsSouth;
	while{_count < count _squad} do{
		_player = _squad select _count;
		_squad2Ready = true;
		if(!(_player in playersReady)) then {
			_squad2Ready = false;
		};
		_count = _count + 1;
	};
	if(ruinsNorth in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",ruinsNorth, false] call BIS_fnc_MP;
	};
	if(ruinsSouth in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",ruinsSouth, false] call BIS_fnc_MP;
	};
	sleep 2;
};
playersReady = [];
[["reset"],"fnc_queryClient",ruinsNorth,false] call bis_fnc_MP;
[["reset"],"fnc_queryClient",ruinsSouth,false] call bis_fnc_MP;

[[false], "fnc_freezePlayer", ruinsSouth, false] call BIS_fnc_MP;
[[false], "fnc_freezePlayer", ruinsNorth, false] call BIS_fnc_MP;

[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",ruinsNorth,false] call BIS_fnc_MP;
[["Standard",["Mission Started!","All players ready. GO! GO! GO!"]],"BIS_fnc_showNotification",ruinsSouth,false] call BIS_fnc_MP;

[[],"fnc_ruinsFlag",ruinsNorth, false] call bis_fnc_MP;
[[],"fnc_ruinsFlag",ruinsSouth, false] call bis_fnc_MP;
//mission run
while{ruinsMissionInProgress} do {
	sleep 2;
	if(isNull ruinsNorth || isNull ruinsSouth) then {
		ruinsMissionInProgress = false;
	};
};

[[ruinsNorth, ruinsSouth],"fnc_returnToBase"] call BIS_fnc_MP;
opforMission = "";
blueforMission = "";
ruinsNorth = grpNull;
ruinsSouth = grpNull;
ruinsSquadCount = 0;
publicVariable "opforMission";
publicVariable "blueforMission";


