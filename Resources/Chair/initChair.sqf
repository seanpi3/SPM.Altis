private["_chair"];
_chair = _this select 0;
_chair setVariable ["_sitting",false,true]; 
_char setVariable ["player",ObjNull,true];
_chair addAction ["<t color='#0099FF'>Sit Down</t>","Resources\Chair\sitdown.sqf"];
