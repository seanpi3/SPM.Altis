removeAllActions galatiFlag;
galatiFlagAction = galatiFlag addAction ["Claim Victory",
	{
		galatiFlag setFlagOwner player;
		_startTime = time;
		while {_startTime - time < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 5) exitWith {};
				if(!galatiMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
		galatiFlag setFlagOwner objNull;
		[[galatiFlag, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
		galatiMissionInProgress = false;
		publicVariable "galatiMissionInProgress";
		[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
		galatiFlag removeAction galatiFlagAction;
		[[galatiFlag, galatiFlagAction],"removeAction",galatiNorth,false] call bis_fnc_MP;
		[[galatiFlag, galatiFlagAction],"removeAction",galatiSouth,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];