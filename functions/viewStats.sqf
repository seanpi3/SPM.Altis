/*
	Allows the player to view stats as a hint.
*/
_ratio = kills/deaths;
hint format ["Squad: %1 \nKills: %2 \nDeaths: %3 \nRatio: %4",squad,kills,deaths,_ratio];