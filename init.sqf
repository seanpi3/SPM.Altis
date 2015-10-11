enableSaving [false, false];
if (isDedicated) then {
	[] execVM "Missions\initMissions.sqf";
	[] execVM "functions.sqf";
	[] execVM "Squads\initOpfor.sqf";
	[] execVM "Squads\initBluefor.sqf";
	call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
}
else{
	call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
	[] execVM "functions.sqf";
};
