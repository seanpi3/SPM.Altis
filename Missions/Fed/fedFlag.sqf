removeAllActions fedFlag;
fedFlagAction = fedFlag addAction ["Claim Victory",
	{
		fedFlag setFlagOwner player;
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
	fedFlag setFlagOwner objNull;
	[[fedFlag, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
	fedMissionInProgress = false;
	publicVariable "fedMissionInProgress";
	[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
	fedFlag removeAction fedFlagAction;
	[[fedFlag, fedFlagAction],"removeAction",fedEast,false] call bis_fnc_MP;
	[[fedFlag, fedFlagAction],"removeAction",fedWest,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];