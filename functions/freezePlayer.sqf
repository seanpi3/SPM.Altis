private ["_frozen"];
_frozen = _this select 0;

if(_frozen) then {
	frozen = true;
	while{frozen} do {
		[[player, "AmovPercMstpSlowWrflDnon_Salute"],"playMove",true,true] call BIS_fnc_MP;
		waitUntil{animationState player != "AmovPercMstpSlowWrflDnon_Salute"};
	};
}
else{
	frozen = false;
};
