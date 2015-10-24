grouperino = group player;
player enableFatigue false;

opforMap addAction ["Arsenal",{["Open",true] call BIS_fnc_arsenal}]; 
blueforMap addAction ["Arsenal",{["Open",true] call BIS_fnc_arsenal}]; 
blueforMap addAction ["Deploy", {player setPos ruinsNorthSpawn; removeAllActions blueforMap},nil,1.5,true,true,""];
opforMap addAction ["Deploy", {player setPos ruinsSouthSpawn; removeAllActions opforMap},nil,1.5,true,true,""];

[grouperino, grouperino] call fnc_returnToBase;

