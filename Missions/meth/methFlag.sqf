removeAllActions methFlag;
methFlagAction = methFlag addAction ["Claim Victory",
	{
		methFlag setFlagOwner player;
		_target = cursorTarget;
		_count = 0;
		_success = false;
		while {!_success} do
		{	
				[[player, "AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWlnrDnon_end"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep 2.5;
				_count = _count + .1;
				if (!alive player) exitWith {};
				if(player distance _target > 7) exitWith {};
				if(_count >= 1) then {_success = true};
		};	
	waitUntil {_success};
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