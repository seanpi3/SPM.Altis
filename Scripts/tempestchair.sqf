private["_chair"];
_chair = _this select 0;
_chair setVariable ["_sitting",false,true]; 
_chair setVariable ["_player",ObjNull,true];
_chair addAction ["<t color='#0099FF'>Sit Down</t>","Resources\Chair\sitdown.sqf"];

while{true} do { 
	waitUntil{!isNull (_chair getVariable "player")};
	_player = (_chair getVariable "player");
	sleep 5;
	if(isNull (_chair getVariable "player")) exitWith{};
	if(name _player in tempestMembers) then {
		_player setPos getPos tempestBaseSpawn;
		_player setDir 288;	
	};
};
