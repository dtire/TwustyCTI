// place holder for the config values

if(isMultiplayer) then {
	server setVariable["ResistanceSkill", paramsArray select 0];
	server setVariable["TownDifficulty", paramsArray select 1];
	server setVariable["BluforCash", 5000];
	server setVariable["OpforCash", 5000];
};

currencyChanging = 0;

townsWest = [];
townsEast = [];

spawnPoints = [];
{
	if(_x find "spawn" != -1) then {spawnPoints pushBack _x;};
} foreach allMapMarkers;