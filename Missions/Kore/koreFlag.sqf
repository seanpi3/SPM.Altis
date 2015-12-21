removeAllActions koreFlag;
koreFlagAction = koreFlag addAction ["Claim Victory",
	{
		koreFlag setFlagOwner player;
		_startTime = time;
		while {_startTime - time < 30} do
		{	
				[[player, "AinvPknlMstpSnonWnonDnon_medic_1"], "playMove", true, false, false] spawn BIS_fnc_MP;
				sleep .5;
				if (!alive player) exitWith {};
				if(player distance _target > 7) exitWith {};
				if(!koreMissionInProgress) exitWith{};
				waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"};
		};	
		koreFlag setFlagOwner objNull;
		[[koreFlag, "Resources\TempestFlag.jpg"],"setFlagTexture",true,true] call bis_fnc_MP;
		koreMissionInProgress = false;
		publicVariable "koreMissionInProgress";
		[["MissionCompleted",format["%1 has claimed victory for %2!",name player,squad]],"fnc_notify", true, false] call BIS_fnc_MP;
		koreFlag removeAction koreFlagAction;
		[[koreFlag, koreFlagAction],"removeAction",koreNorth,false] call bis_fnc_MP;
		[[koreFlag, koreFlagAction],"removeAction",koreSouth,false] call bis_fnc_MP;
	},nil,-1,false,false,"","_this distance _target <= 5"
];