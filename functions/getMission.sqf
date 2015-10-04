private ["squad","_avaliableMissions", "_selected"];
	if(!isDedicated) exitWith {};
	_squad = _this select 0;
	_avaliableMissions = [];
	_selected = "";
	//Count of all avaliable missions
	if (!castleMissionFilling && !castleMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["castleOffence"];
		_avaliableMissions = _avaliableMissions + ["castleDefence"];
	};
	if(!fedMissionFilling && !fedMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["fedWest"];
		_avaliableMissions = _avaliableMissions + ["fedEast"];
	};
	if(!islandMissionFilling && !islandMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["islandNorth"];
		_avaliableMissions = _avaliableMissions + ["islandSouth"];
	};
	if(!swampMissionFilling && !swampMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["swampTeam1"];
		_avaliableMissions = _avaliableMissions + ["swampTeam2"];
	};
	if(!galatiMissionFilling && !galatiMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["galatiNorth"];
		_avaliableMissions = _avaliableMissions + ["galatiSouth"];
	};
	if(!koreMissionFilling && !koreMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["koreNorth"];
		_avaliableMissions = _avaliableMissions + ["koreSouth"];
	};
	if(!ruinsMissionFilling && !ruinsMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["ruinsNorth"];
		_avaliableMissions = _avaliableMissions + ["ruinsSouth"];
	};
	if(!methMissionFilling && !methMissionInProgress) then {
		_avaliableMissions = _avaliableMissions + ["methDefence"];
		_avaliableMissions = _avaliableMissions + ["methOffence"];
	};
	

	//Prioritize ones that already have a squad waiting
	if (castleMissionFilling && castleSquadCount < 2) then {
			if(isNull castleOffence) then {
				_selected = "castleOffence";
				castleOffence = _squad;
				castleSquadCount = 2;
			}
			else {
				_selected = "castleDefence";
				castleDefence = _squad;
				castleSquadCount = 2;
			};	
	};
	if (fedMissionFilling && fedSquadCount < 2) then {
			if(isNull fedEast) then {
				_selected = "fedEast";
				fedEast = _squad;
				fedSquadCount = 2;
			}	
			else {
				_selected = "fedWest";
				fedWest = _squad;
				fedSquadCount = 2;
			};
	};
	if(islandMissionFilling && islandSquadCount < 2) then {
		if(isNull islandNorth) then {
			_selected = "islandNorth";
			islandNorth = _squad;
			islandSquadCount = 2;
		}
		else{
			_selected = "islandSouth";
			islandSouth = _squad;
			islandSquadCount = 2;
		};
	};
	if(swampMissionFilling && swampSquadCount < 2) then {
		if(isNull swampTeam1) then {
			_selected = "swampTeam1";
			swampTeam1 = _squad;
			swampSquadCount=2;
		}
		else{
			_selected = "swampTeam2";
			swampTeam2 = _squad;
			swampSquadCount = 2;
		};
	};
	if(galatiMissionFilling && galatiSquadCount < 2) then {
		if(isNull galatiNorth) then {
			_selected = "galatiNorth";
			galatiNorth = _squad;
			galatiSquadCount=2;
		}
		else{
			_selected = "galatiSouth";
			galatiSouth = _squad;
			galatiSquadCount = 2;
		};
	};
	if(koreMissionFilling && koreSquadCount < 2) then {
		if(isNull koreNorth) then {
			_selected = "koreNorth";
			koreNorth = _squad;
			koreSquadCount=2;
		}
		else{
			_selected = "koreSouth";
			koreSouth = _squad;
			koreSquadCount = 2;
		};
	};
	if(ruinsMissionFilling && ruinsSquadCount < 2) then {
		if(isNull ruinsNorth) then {
			_selected = "ruinsNorth";
			ruinsNorth = _squad;
			ruinsSquadCount=2;
		}
		else{
			_selected = "ruinsSouth";
			ruinsSouth = _squad;
			ruinsSquadCount = 2;
		};
	};
	if(methMissionFilling && methSquadCount < 2) then {
		if(isNull methDefence) then {
			_selected = "methDefence";
			methDefence = _squad;
			methSquadCount=2;
		}
		else{
			_selected = "methOffence";
			methDefence = _squad;
			methSquadCount = 2;
		};
	};

	
	
	//no current available missions select a random one
	if (_selected == "") then {
		//Randomly select a mission
		_rand = floor(random (count _avaliableMissions));
		_selected = _avaliableMissions select _rand;
		switch(_selected) do {
			case "castleOffence":{
				castleMissionFilling = true;
				castleSquadCount = 1;
				castleOffence = _squad;
				[[],"fnc_castleStartMission", false, false] call BIS_fnc_MP;
			};
			case "castleDefence":{
				castleMissionFilling = true;
				castleSquadCount = 1;
				castleDefence = _squad;
				[[],"fnc_castleStartMission", false, false] call BIS_fnc_MP;				
			};
			case "fedEast":{
				fedMissionFilling = true;
				fedSquadCount = 1;
				fedEast = _squad;
				[[],"fnc_fedStartMission", false, false] call BIS_fnc_MP;
			};
			case "fedWest":{
				fedMissionFilling = true;
				fedSquadCount = 1;
				fedWest = _squad;
				[[],"fnc_fedStartMission", false, false] call BIS_fnc_MP;
			};
			case "islandNorth":{
				islandMissionFilling = true;
				islandSquadCount = 1;
				islandNorth = _squad;
				[[],"fnc_islandStartMission", false, false] call BIS_fnc_MP;		
			};
			case "islandSouth":{
				islandMissionFilling = true;
				islandSquadCount = 1;
				islandSouth = _squad;
				[[],"fnc_islandStartMission", false, false] call BIS_fnc_MP;
			};
			case "swampTeam1":{
				swampMissionFilling = true;
				swampSquadCount = 1;
				swampTeam1 = _squad;
				[[],"fnc_swampStartMission", false, false] call BIS_fnc_MP;
			
			};
			case "swampTeam2":{
				swampMissionFilling = true;
				swampSquadCount = 1;
				swampTeam2 = _squad;
				[[],"fnc_swampStartMission", false, false] call BIS_fnc_MP;
			};
			case "galatiNorth":{
				galatiMissionFilling = true;
				galatiSquadCount = 1;
				galatiNorth = _squad;
				[[],"fnc_galatiStartMission", false, false] call BIS_fnc_MP;
			};
			case "galatiSouth":{
				galatiMissionFilling = true;
				galatiSquadCount = 1;
				galatiSouth = _squad;
				[[],"fnc_galatiStartMission", false, false] call BIS_fnc_MP;
			};
			case "koreNorth":{
				koreMissionFilling = true;
				koreSquadCount = 1;
				koreNorth = _squad;
				[[],"fnc_koreStartMission", false, false] call BIS_fnc_MP;		
			};
			case "koreSouth":{
				koreMissionFilling = true;
				koreSquadCount = 1;
				koreSouth = _squad;
				[[],"fnc_koreStartMission", false, false] call BIS_fnc_MP;
			};
			case "ruinsNorth":{
				ruinsMissionFilling = true;
				ruinsSquadCount = 1;
				koreNorth = _squad;
				[[],"fnc_ruinsStartMission", false, false] call BIS_fnc_MP;
			};
			case "ruinsSouth":{
				ruinsMissionFilling = true;
				ruinsSquadCount = 1;
				ruinsSouth = _squad;
				[[],"fnc_ruinsStartMission", false, false] call BIS_fnc_MP;
			};
			case "methOffence":{
				methMissionFilling = true;
				methSquadCount = 1;
				methOffence = _squad;
				[[],"fnc_methStartMission", false, false] call BIS_fnc_MP;
			};
			case "methDefence":{
				methMissionFilling = true;
				methSquadCount = 1;
				methDefence = _squad;
				[[],"fnc_methStartMission", false, false] call BIS_fnc_MP;
			};
		};
	};
	[[_squad,_selected], "fnc_missionRecieved", _squad, false] call BIS_fnc_MP;
	