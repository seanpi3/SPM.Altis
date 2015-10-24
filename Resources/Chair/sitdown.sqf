//////////////////////////////////////////////////////////////////////////
//                            Script Made By                            //
//                                MacRae                                //
//                                                                      //
//                                                                      //
//1.Place a Camping Chair on the map.                                   //
//                                                                      //
//2.Add this to the Camping chair Init:                                 //
//this addAction ["<t color='#0099FF'>Sit Down</t>","Chair\sitdown.sqf"]//
//                              4D6163526165                            //
//////////////////////////////////////////////////////////////////////////


_chair = _this select 0; 
_unit = _this select 1; 
if (sitting) exitWith{};
if(_chair getVariable "sitting") exitWith{};
disableUserInput true;
_unit setVelocity [0,0,0];
sleep .4;

sitting = true;
_chair setVariable ["sitting", true, true];
[[_unit, "Crew"], "MAC_fnc_switchMove"] spawn BIS_fnc_MP;

_unit setPos (getPos _chair); 
_unit setDir ((getDir _chair) - 180); 

//_chair attachTo [_unit];
[_chair, _unit] execVM "Resources\Chair\standup.sqf";

_unit setpos [getpos _chair select 0, getpos _chair select 1,((getpos _chair select 2) + 1)];
sleep .6;
disableUserInput false;

if() then {

};