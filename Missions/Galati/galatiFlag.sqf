removeAllActions galatiFlag;
galatiFlagAction = galatiFlag addAction ["Claim Victory",
	{
		galatiFlag setFlagOwner player;
		_target = cursorTarget;
		_count = 0;
		_success = false;
		while {!_success} do
			{	
				[[player, "AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWlnrDnon_end"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep 2.5;
				_count = _count + .2;
				if (!alive player) exitWith {};
				if(player distance _target > 7) exitWith {};
				if(_count >= 1) then { _success = true; };
				
		};
	galatiFlag setFlagTexture "Resources\TempestFlag.jpg";
	galatiFlag setFlagOwner objNull;
	galatiiMissionInProgress = false;
	publicVariable "galatiMissionInProgress";
	[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
	galatiFlag removeAction galatiFlagAction;
	[[galatiFlag, galatiFlagAction],"removeAction",galatiNorth,false] call bis_fnc_MP;
	[[galatiFlag, galatiFlagAction],"removeAction",galatiSouth,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];