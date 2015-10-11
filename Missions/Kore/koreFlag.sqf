removeAllActions koreFlag;
koreFlagAction = koreFlag addAction ["Claim Victory",
	{
		koreFlag setFlagOwner player;
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
	koreFlag setFlagTexture "Resources\TempestFlag.jpg";
	koreFlag setFlagOwner objNull;
	koreiMissionInProgress = false;
	publicVariable "koreiMissionInProgress";
	[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
	koreFlag removeAction koreFlagAction;
	[[koreFlag, koreFlagAction],"removeAction",koreNorth,false] call bis_fnc_MP;
	[[koreFlag, koreFlagAction],"removeAction",koreSouth,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];