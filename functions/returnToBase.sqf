/*
	Adds action for the player to return to base. Called after a mission completes.
*/
private ["_squad1","_squad2"];
if(inBase) exitWith{};
if(! alive player) exitWith{};
if(squad != _squad1 && squad != _squad2) exitWith{};
_squad1 = _this select 0;
_squad2 = _this select 1;
return = [
	"Return to base",
	{
		switch(squad) do {
			case "bluefor":{
				player setPos getPos respawn_west;
				player removeAction return;
			};
			case "opfor":{
				player setPos getPos respawn_east;
				player removeAction return;
			};
		};
	}
];
player addAction return;