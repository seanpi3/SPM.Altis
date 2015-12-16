/*
	Called when a player receives a mission
*/
private["_squad","_mission"];
_squad = _this select 0;
_mission = _this select 1;
systemChat _mission;
if(isDedicated) exitWith {};
if (group player != _squad) exitWith {};

	
fnc_deploy = {
	playerReady = player addAction ["Ready",{
			ready=true;
			player removeAction playerReady;
			if(leader player == player) then {player removeAction squadReadyAction};
		}];
	if(leader player == player) then {
		squadReadyAction = player addAction ["Squad Ready", {
			ready = true;
			squadReady = true;
			player removeAction squadReadyAction;
			player removeAction playerReady;
		}];
	};
	[true] call fnc_freezePlayer;
	hint "Waiting for all players to be ready.";
};
switch (_mission) do {
		case "castleDefence":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos castleLocation; player setDir direction castleLocation; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "castle";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos castleLocation; player setDir direction castleLocation; removeAllActions opforMap;[] call fnc_deploy },nil,1.5,true,true,"deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "castle";
				};
			};		
		};
		case "castleOffence":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy East", {player setPos getPos IP1Location; player setDir direction IP1Location; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				blueforMap addAction ["Deploy West", {player setPos getPos IP3Location; player setDir direction IP3Location;removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "castle";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy East", {player setPos getPos IP1Location; player setDir direction IP1Location; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"deploy"];
					opforMap addAction ["Deploy West", {player setPos getPos IP3Location; player setDir direction IP3Location; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"deploy"];					
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "castle";
				};
			};
		};
		
		case "fedWest":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos fedWestLoc; player setDir direction fedWestLoc; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "fedWest";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos fedWestLoc; player setDir direction fedWestLoc; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "fedWest";
				};
			};
		};
		case "fedEast":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos fedEastLoc; player setDir direction fedEastLoc; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "fedEast";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos fedEastLoc; player setDir direction fedEastLoc; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "fedEast";
				};
			};
		};
		case "islandNorth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos islandNorthSpawn; player setDir direction islandNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "islandNorth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos islandNorthSpawn; player setDir direction islandNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "islandNorth";
				};
			};
		};
		case "islandSouth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos islandSouthSpawn; player setDir direction islandSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "islandSouth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos islandSouthSpawn; player setDir direction islandSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "islandSouth";
				};
			};	
		};
		case "swampTeam1":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos swampTeam1Spawn; player setDir direction swampTeam1Spawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "swampTeam1";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos swampTeam1Spawn; player setDir direction swampTeam1Spawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "swampTeam1";
				};
			};
		};
		case "swampTeam2":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos swampTeam2Spawn; player setDir direction swampTeam2Spawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "swampTeam2";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos swampTeam2Spawn; player setDir direction swampTeam2Spawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "swampTeam2";
				};
			};
		};
		case "galatiNorth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos galatiNorthSpawn; player setDir direction galatiNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "galatiNorth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos galatiNorthSpawn; player setDir direction galatiNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "galatiNorth";
				};
			};
		};
		case "galatiSouth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos galatiSouthSpawn; player setDir direction galatiSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "galatiSouth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos galatiSouthSpawn; player setDir direction galatiSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "galatiSouth";
				};
			};
		};
		case "koreNorth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos koreNorthSpawn; player setDir direction koreNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "koreNorth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos koreNorthSpawn; player setDir direction koreNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "koreNorth";
				};
			};
		};
		case "koreSouth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos koreSouthSpawn; player setDir direction koreSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "koreSouth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos koreSouthSpawn; player setDir direction koreSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "koreSouth";
				};
			};
		};
		case "ruinsNorth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos ruinsNorthSpawn; player setDir direction ruinsNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "ruinsNorth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos ruinsNorthSpawn; player setDir direction ruinsNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "ruinsNorth";
				};
			};
		};
		case "ruinsSouth":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos ruinsSouthSpawn; player setDir direction ruinsSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "ruinsSouth";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos ruinsSouthSpawn; player setDir direction ruinsSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "ruinsSouth";
				};
			};
		};
		case "methDefence":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos methDefenceSpawn; player setDir direction methDefenceSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "methDefence";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos methDefenceSpawn; player setDir direction methDefenceSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "methDefence";
				};
			};
		};
		case "methOffence":{
			if(side _squad == WEST) then {
				blueforMap addAction ["Deploy", {player setPos getPos methOffenceSpawn; player setDir direction methOffenceSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
				["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
				blueforMission = "methOffence";
			}
			else{
				if(side _squad == EAST) then {
					opforMap addAction ["Deploy", {player setPos getPos methOffenceSpawn; player setDir direction methOffenceSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					opforMission = "methOffence";
				};
			};
		};
	};