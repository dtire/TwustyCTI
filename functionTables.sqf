GarrisonMarker = compile preprocessFile "Towns\spawnGarrison.sqf";
GetSideConfigs = compile preprocessFile "Side-Helpers\getGarrisonConfigs.sqf";
TransferOwnership = compile preprocessFile "Towns\transferOwnership.sqf";
EconomyTick = compile preprocessFile "AI-Helpers\economyTick.sqf";
GetBuildingType = compile preprocessFile "Building\getBuildingName.sqf";
PrePlace = compile preprocessFile "Building\prePlace.sqf";
CanBuild = compile preprocessFile "Building\canBuild.sqf";

diag_log "Function tabled completed";