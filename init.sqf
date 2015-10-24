enableSaving [false, false];
if (isDedicated) then {
	[] execVM "Missions\initMissions.sqf";
	[] execVM "functions.sqf";
	[] execVM "Squads\initOpfor.sqf";
	[] execVM "Squads\initBluefor.sqf";
	
	//Cleanup Script
	call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
	[
		60, // seconds to delete dead bodies (0 means don't delete) 
		5*60, // seconds to delete dead vehicles (0 means don't delete)
		5*60, // seconds to delete dropped weapons (0 means don't delete)
		0, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'Scripts\repetitive_cleanup.sqf';
	

}
else{
	call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
	[] execVM "functions.sqf";
	player execVM "scripts\simpleEP.sqf";
};

