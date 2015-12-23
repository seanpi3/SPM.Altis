removeAllActions castleFlag;
castleFlagAction = castleFlag addAction ["Claim Victory",
	{
		castleFlag setFlagOwner player;
		_startTime = time;
		_target = cursorTarget;
		while {time - _startTime < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 7) exitWith {};
				if(!castleMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
		castleFlag setFlagOwner objNull;
		[[castleFlag, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
		castleMissionInProgress = false;
		publicVariable "castleMissionInProgress";
		[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
		castleFlag removeAction castleFlagAction;
		[[castleFlag, castleFlagAction],"removeAction",castleOffence,false] call bis_fnc_MP;
		[[castleFlag, castleFlagAction],"removeAction",castleDefence,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];