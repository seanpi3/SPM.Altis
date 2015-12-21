removeAllActions islandFlag;
islandFlagAction = islandFlag addAction ["Claim Victory",
	{
		islandFlag setFlagOwner player;
		_startTime = time;
		while {_startTime - time < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 5) exitWith {};
				if(!islandMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
		islandFlag setFlagOwner objNull;
		[[islandFlag, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
		islandMissionInProgress = false;
		publicVariable "islandMissionInProgress";
		[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
		islandFlag removeAction islandFlagAction;
		[[islandFlag, islandFlagAction],"removeAction",islandNorth,false] call bis_fnc_MP;
		[[islandFlag, islandFlagAction],"removeAction",islandSouth,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];