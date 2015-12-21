removeAllActions fedFlag;
fedFlagAction = fedFlag addAction ["Claim Victory",
	{
		fedFlag setFlagOwner player;
		_startTime = time;
		while {_startTime - time < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 5) exitWith {};
				if(!fedMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
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