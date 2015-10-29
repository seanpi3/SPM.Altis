fnc_getMission = compile preprocessFileLineNumbers "functions\getMission.sqf";

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;
    _object switchMove _anim;
};

fnc_initLoadout = compile preprocessFileLineNumbers "functions\initialLoadout.sqf";

fnc_paintball = compile preprocessFileLineNumbers "debug\paintball.sqf";
fnc_animation = compile preprocessFileLineNumbers "ShoterAnimation\ShoterAnimation.sqf";
fnc_endAnimation = compile preprocessFileLineNumbers "ShoterAnimation\endAnimation.sqf";
fnc_notify = compile preprocessFileLineNumbers "functions\notifyPlayer.sqf";
fnc_addKill = compile preprocessFileLineNumbers "functions\addKill.sqf";
fnc_addDeath = compile preprocessFileLineNumbers "functions\addDeath.sqf";

fnc_getIntel = compile preprocessFileLineNumbers "functions\getIntel.sqf";
fnc_missionRecieved = compile preprocessFileLineNumbers "functions\missionRecieved.sqf";
fnc_setupCastleMarkers = compile preprocessFileLineNumbers "functions\setupCastleMarkers.sqf";
fnc_freezePlayer = compile preprocessFileLineNumbers "functions\freezePlayer.sqf";
fnc_queryClient = compile preprocessFileLineNumbers "functions\queryClient.sqf";
fnc_informServer = compile preprocessFileLineNumbers "functions\informServer.sqf";

//Mission Starts
fnc_fedStartMission = compile preprocessFileLineNumbers "missions\Fed\startMission.sqf";
fnc_castleStartMission = compile preprocessFileLineNumbers "missions\Castle\startMission.sqf";
fnc_islandStartMission = compile preprocessFileLineNumbers "missions\Island\startMission.sqf";
fnc_swampStartMission = compile preprocessFileLineNumbers "missions\Swamp\startMission.sqf";
fnc_galatiStartMission = compile preprocessFileLineNumbers "missions\Galati\startMission.sqf";
fnc_koreStartMission = compile preprocessFileLineNumbers "missions\Kore\startMission.sqf";
fnc_ruinsStartMission = compile preprocessFileLineNumbers "missions\Ruins\startMission.sqf";
fnc_methStartMission = compile preprocessFileLineNumbers "missions\meth\startMission.sqf";

//Mission Flags
fnc_fedFlag = compile preprocessFileLineNumbers "missions\Fed\fedFlag.sqf";
fnc_castleFlag = compile preprocessFileLineNumbers "missions\Castle\castleFlag.sqf";
fnc_islandFlag = compile preprocessFileLineNumbers "missions\Island\islandFlag.sqf";
fnc_swampFlags = compile preprocessFileLineNumbers "missions\Swamp\swampFlags.sqf";
fnc_galatiFlag = compile preprocessFileLineNumbers "missions\Galati\galatiFlag.sqf";
fnc_koreFlag = compile preprocessFileLineNumbers "missions\Kore\koreFlag.sqf";
fnc_ruinsFlag = compile preprocessFileLineNumbers "missions\Ruins\ruinsFlag.sqf";
fnc_methFlag = compile preprocessFileLineNumbers "missions\Meth\methFlag.sqf";

fnc_returnToBase = compile preprocessFileLineNumbers "functions\returnToBase.sqf";
fnc_holsterWeapon = compile preprocessFileLineNumbers "functions\holsterWeapon.sqf";
fnc_playerActions = compile preprocessFileLineNumbers "functions\playerActions.sqf";