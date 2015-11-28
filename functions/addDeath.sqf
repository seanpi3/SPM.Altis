/*
	Adds a death to the database.
*/
deaths = deaths + 1;
[["death",player,deaths],"fnc_informServer",false,false] call bis_fnc_mp;