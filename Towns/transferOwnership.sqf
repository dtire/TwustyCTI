params ["_marker"];

_nearest = markerPos _marker nearEntities [["Man", "Car", "Tank"], 1000];
_west = 0;
_east = 0;
_resistance = 0;
{ 
	if(side _x == west) then { _west = _west + 1};
	if(side _x == east) then { _east = _east + 1};
	if(side _x == resistance) then {_resistance = _resistance + 1};
} forEach _nearest;

_capturedByPlayerSide = false;
if(_west > _east && _west > _resistance) then 
{
	_capturedByPlayerSide = true;
	_marker setMarkerType "flag_USA";
	[_marker, west, [west] call GetSideConfigs] spawn GarrisonMarker;
	townsWest pushBack _marker;
}; 

if(_east > _west && _east > _resistance) then
{
	_capturedByPlayerSide = true;
	_marker setMarkerType "flag_CSAT";
	[_marker, east, [east] call GetSideConfigs] spawn GarrisonMarker;
	townsWest pushBack _marker;
};

if(!_capturedByPlayerSide) then
{
	_marker setMarkerType "flag_FIA";
	[_marker, resistance, [resistance] call GetSideConfigs] spawn GarrisonMarker;
};
