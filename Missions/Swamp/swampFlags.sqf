removeAllActions swampFlag2;
swampFlagAction = swampFlag2 addAction ["Claim Victory",
	{
		swampFlag2 setFlagOwner player;
		_startTime = time;
		while {_startTime - time < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 7) exitWith {};
				if(!swampMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
		swampFlag setFlagOwner objNull;
		[[swampFlag2, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
		swampMissionInProgress = false;
		publicVariable "swampMissionInProgress";
		[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
		swampFlag2 removeAction swampFlagAction;
		[[swampFlag2, swampFlagAction],"removeAction",swampTeam1,false] call bis_fnc_MP;
		[[swampFlag2, swampFlagAction],"removeAction",swampTeam2,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];