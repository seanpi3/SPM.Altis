enableSaving [false, false];
debug = true;
if (isDedicated || debug) then {
	[] execVM "Missions\initMissions.sqf";
	[] execVM "functions.sqf";
	[] execVM "Squads\initOpfor.sqf";
	[] execVM "Squads\initBluefor.sqf";
	call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
	if(debug) then {[] execVM "Debug\debug.sqf"};
}
else{
	call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
	[] execVM "functions.sqf";
};
if(debug) then {
	hint "Debug enabled";
	call fnc_getIntel;
	call fnc_getIntel;
};
