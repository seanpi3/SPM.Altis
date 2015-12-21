removeAllActions methFlag;
methFlagAction = methFlag addAction ["Claim Victory",
	{
		methFlag setFlagOwner player;
		_startTime = time;
		while {_startTime - time < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 7) exitWith {};
				if(!methMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
		methFlag setFlagOwner objNull;
		[[methFlag, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
		methMissionInProgress = false;
		publicVariable "methMissionInProgress";
		[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
		methFlag removeAction methFlagAction;
		[[methFlag, methFlagAction],"removeAction",methOffence,false] call bis_fnc_MP;
		[[methFlag, methFlagAction],"removeAction",methDefence,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];