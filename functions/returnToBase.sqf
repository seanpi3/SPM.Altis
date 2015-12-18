/*
	Adds action for the player to return to base. Called after a mission completes.
*/
private ["_squad1","_squad2"];
if(inBase) exitWith{};
if(! alive player) exitWith{};
if(squad != _squad1 && squad != _squad2) exitWith{};
_squad1 = _this select 0;
_squad2 = _this select 1;
return = player addAction [
	"Return to base",
	{
		_id = _this select 2;
		switch(side squad) do {
			case west:{player setPos getPos respawn_west};
			case east:{player setPos getPos respawn_east};
			case resistance:{player setPos getPos stadiumCommunitySpawn};
		};	
		player removeAction _id;
	}
];
