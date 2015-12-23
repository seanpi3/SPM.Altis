removeAllActions ruinsFlag;
ruinsFlagAction = ruinsFlag addAction ["Claim Victory",
	{
		ruinsFlag setFlagOwner player;
		_startTime = time;
		_target = cursorTarget;
		while {time - _startTime < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 7) exitWith {};
				if(!ruinsMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
		ruinsFlag setFlagOwner objNull;
		[[ruinsFlag, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
		ruinsMissionInProgress = false;
		publicVariable "ruinsMissionInProgress";
		[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
		ruinsFlag removeAction ruinsFlagAction;
		[[ruinsFlag, ruinsFlagAction],"removeAction",ruinsNorth,false] call bis_fnc_MP;
		[[ruinsFlag, ruinsFlagAction],"removeAction",ruinsSouth,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];