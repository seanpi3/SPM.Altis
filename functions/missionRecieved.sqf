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
			switch (side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos castleLocation; player setDir direction castleLocation; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "castle";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos castleLocation; player setDir direction castleLocation; removeAllActions opforMap;[] call fnc_deploy },nil,1.5,true,true,"deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "castle";
				};
				case resistance:{
					
				};
			};
		};
		case "castleOffence":{
			switch (side _squad) do {
				case west:{
					blueforMap addAction ["Deploy East", {player setPos getPos IP1Location; player setDir direction IP1Location; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					blueforMap addAction ["Deploy West", {player setPos getPos IP3Location; player setDir direction IP3Location;removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "castle";
				};
				case east:{
					opforMap addAction ["Deploy East", {player setPos getPos IP1Location; player setDir direction IP1Location; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"deploy"];
					opforMap addAction ["Deploy West", {player setPos getPos IP3Location; player setDir direction IP3Location; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"deploy"];					
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "castle";
				};
				case resistance:{
				
				};
			};
		};
		
		case "fedWest":{
			switch (side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos fedWestLoc; player setDir direction fedWestLoc; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "fedWest";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos fedWestLoc; player setDir direction fedWestLoc; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "fedWest";
				};
				case resistance:{
				
				};
			};
		};
		case "fedEast":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos fedEastLoc; player setDir direction fedEastLoc; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "fedEast";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos fedEastLoc; player setDir direction fedEastLoc; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "fedEast";
				};
				case resistance:{
				
				};
			};
		};
		case "islandNorth":{
			switch(side _squad){
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos islandNorthSpawn; player setDir direction islandNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "islandNorth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos islandNorthSpawn; player setDir direction islandNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "islandNorth";
				};
				case resistance:{
				
				};
			};
		};
		case "islandSouth":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos islandSouthSpawn; player setDir direction islandSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "islandSouth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos islandSouthSpawn; player setDir direction islandSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "islandSouth";
				};
				case resistance:{
				
				};
			};
		};
		case "swampTeam1":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos swampTeam1Spawn; player setDir direction swampTeam1Spawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "swampTeam1";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos swampTeam1Spawn; player setDir direction swampTeam1Spawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "swampTeam1";
				};
				case resistance:{
				
				};
			};
		};
		case "swampTeam2":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos swampTeam2Spawn; player setDir direction swampTeam2Spawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "swampTeam2";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos swampTeam2Spawn; player setDir direction swampTeam2Spawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "swampTeam2";
				};
				case resistance:{
				
				};
			};
		};
		case "galatiNorth":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos galatiNorthSpawn; player setDir direction galatiNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "galatiNorth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos galatiNorthSpawn; player setDir direction galatiNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "galatiNorth";
				};
				case resistance:{
				
				};
			};
		};
		case "galatiSouth":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos galatiSouthSpawn; player setDir direction galatiSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "galatiSouth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos galatiSouthSpawn; player setDir direction galatiSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "galatiSouth";
				};
				case resistance:{
				
				};
			};
		};
		case "koreNorth":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos koreNorthSpawn; player setDir direction koreNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "koreNorth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos koreNorthSpawn; player setDir direction koreNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "koreNorth";
				};
				case resistance:{
				
				};
			};
		};
		case "koreSouth":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos koreSouthSpawn; player setDir direction koreSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "koreSouth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos koreSouthSpawn; player setDir direction koreSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "koreSouth";
				};
				case resistance:{
				
				};
			};
		};
		case "ruinsNorth":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos ruinsNorthSpawn; player setDir direction ruinsNorthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "ruinsNorth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos ruinsNorthSpawn; player setDir direction ruinsNorthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "ruinsNorth";
				};
				case resistance:{
				
				};
			};
		};
		case "ruinsSouth":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos ruinsSouthSpawn; player setDir direction ruinsSouthSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "ruinsSouth";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos ruinsSouthSpawn; player setDir direction ruinsSouthSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "ruinsSouth";
				};
				case resistance:{
				
				};
			};
		};
		case "methDefence":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos methDefenceSpawn; player setDir direction methDefenceSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "methDefence";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos methDefenceSpawn; player setDir direction methDefenceSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "methDefence";
				};
				case resistance:{
				
				};
			};
		};
		case "methOffence":{
			switch(side _squad) do {
				case west:{
					blueforMap addAction ["Deploy", {player setPos getPos methOffenceSpawn; player setDir direction methOffenceSpawn; removeAllActions blueforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "methOffence";
				};
				case east:{
					opforMap addAction ["Deploy", {player setPos getPos methOffenceSpawn; player setDir direction methOffenceSpawn; removeAllActions opforMap;[] call fnc_deploy},nil,1.5,true,true,"","deploy"];
					["MissionAssigned", ["You have been assigned a mission."]] call bis_fnc_showNotification;
					mission = "methOffence";
				};
				case resistance:{
				
				};
			};
		};
	};