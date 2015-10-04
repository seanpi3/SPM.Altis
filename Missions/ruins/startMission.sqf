if(!isDedicated) exitWith {};

//Waiting for squads
while{ruinsSquadCount < 2} do {
	if(!isNull ruinsNorth) then {
		["Waiting for a second squad to start the match","hint",ruinsNorth,false] call BIS_fnc_MP;
	};
	if(!isNull ruinsSouth) then {
		["Waiting for a second squad to start the match","hint",ruinsSouth,false] call BIS_fnc_MP;
	};
	sleep 5;
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
playersReady = [];
_squad1Ready = false;
_squad2Ready = false;
while{!_squad1Ready || !_squad2Ready} do {
	[["ready"],"fnc_queryClient",ruinsNorth, false] call bis_fnc_MP;
	[["ready"],"fnc_queryClient",ruinsSouth, false] call bis_fnc_MP;	
	if(ruinsNorth in playersReady) then {
		_squad1Ready = true;
		["Your team is ready","hint",ruinsNorth, false] call BIS_fnc_MP;
	};
	if(ruinsSouth in playersReady) then {
		_squad2Ready = true;
		["Your team is ready","hint",ruinsSouth, false] call BIS_fnc_MP;
	};
	sleep 1;
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


