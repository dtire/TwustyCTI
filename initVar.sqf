// place holder for the config values
diag_log "Beginning init var";
if(isMultiplayer && isServer) then {
	server setVariable["ResistanceSkill", paramsArray select 0];
	server setVariable["TownDifficulty", paramsArray select 1];
	server setVariable["BluforCash", 5000];
	server setVariable["OpforCash", 5000];
};

currencyChanging = 0;

townsWest = [];
townsEast = [];

buildingsWest = [];
buildingsEast = [];

bluforGear = [];
opforGear = [];

bluforLightVehicles = [];
bluforHeavyVehicles = [];
bluforAircraft = [];

opforLightVehicles = [];
opforHeavyVehicles = [];
opforAircraft = [];

Blufor_CV = objNull;
Opfor_CV = objNull;

defaultGear = [
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"ItemGPS"
];

spawnPoints = [];
{
	if(_x find "spawn" != -1) then {spawnPoints pushBack _x;};
} foreach allMapMarkers;

allTowns = [];
{
	if(_x find "town" != -1) then {
		allTowns pushBack _x;
	};
} forEach allMapMarkers;

if(!isNil "ace_common_fnc_isModLoaded") then {
	call compile preprocessFile "Configuration\Templates\ACE_Default.sqf";
};
// add stuff for vanilla medical otherwise
bluforGear = bluforGear + defaultGear;
opforGear = opforGear + defaultGear;
diag_log "Exiting init var";