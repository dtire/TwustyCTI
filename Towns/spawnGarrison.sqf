params ["_marker", "_side", "_configs"];

// Marker (the town)
// The side to spawn it on
// The arrays to spawn it with
// so to start it will only be [[{ some class names for infantry}], [],[]] for east and west
// and as your tech increases those arrays will get more filled
if(!isMultiplayer) then {
	diag_log format ["Args to garrsion marker, marker: %1, side: %2, configs: %3", _marker, _side, _configs];
};
if(isMultiplayer AND (!isServer || hasInterface)) exitWith {};

_notCaptured = true;
// Before we create a garrison let's check that there isn't an ongoing battle
_numFriendly = 0;
_numEnemy = 0;
waitUntil {
	sleep 5;
	_nearest = markerPos _marker nearEntities [["Man", "Car", "Tank"], 1000];
	{
		if(side _x != _side) then
		{
			_numFriendly = _numFriendly + 1;
		}
		else
		{
			_numEnemy = _numEnemy + 1;
		};
	} foreach _nearest;

	_numEnemy == 0 OR _numFriendly == 0;
};

// Uh oh we've been captured
if(_numFriendly == 0 && _numEnemy > 0) then 
{
	diag_log format ["Capturable: %1 has been captured while ownership is being transferred", _marker];
	[_marker, _side] call TransferOwnership;
	_notCaptured = false;
};

// wait until there are men/cars/tanks within a 1 KM SPHERICAL! (Will detect plans going fast, may be laggy, if you add them)
while {_notCaptured} do {

	waitUntil {
		sleep 5;
		_nearest = markerPos _marker nearEntities [["Man", "Car", "Tank"], 1000];
		diag_log format ["Nearest %1, to %2", _nearest, _marker];
		count _nearest > 0;
	};
	_count = 5;
	if(isMultiplayer) then {_count = server getVariable["TownDifficulty"]; };
	
	_vehSpawns = 0;
	_allGroups = [];
	while { _count > -1 } do {
		_group = createGroup [_side, true];
		_vehSpanwed = false;
		if(_vehSpawns % 5 < _count / 5 && count _configs > 1) then {
			_random = floor time random count _configs;
			_arr = _configs select 1;
			diag_log format ["Entering vehicle spawn block with chosen config: %1", _arr];
			if(count _arr > 0) then 
			{
				// we try 5 times to find an empty place

				_vehType = selectRandom _arr;
				_pos = objNull;
				_min = 0;
				for "_i" from 0 to 20 do {
					_pos = markerPos _marker findEmptyPosition [_min, 500, _vehType];
					if(!(_pos isFlatEmpty[1, -1, 0.1, 1, -1, false, objNull] isEqualTo [])) exitWith {};
					_min = _min + 15;
				};

				diag_log format ["Attempting to spawn %1, at %2, with pos %3", _vehType, _marker, _pos]; 
				if(!(_pos isEqualTo [])) then {
					_veh = [_pos, 180, _vehType, _group] call BIS_fnc_spawnVehicle;
					_vehSpanwed = true;
					_vehSpawns = _vehSpawns + 1;
					diag_log format ["Spawned %1 at %2", _veh, _marker];
				};

			};
		};

		_skill = 2;
		if(_side == resistance && isMultiplayer) then 
		{
			_skill = server getVariable["ResistanceSkill"];
		};

		if(!_vehSpanwed) then 
		{
			_infConfigs = _configs select 0;
			diag_log format ["Infantry config to select from: %1", _infConfigs];
			_pos = [[[markerPos _marker, 500]],["water"]] call BIS_fnc_randomPos;
			_currentConfig = (selectRandom _infConfigs);
			diag_log format ["Selected config: %1, spawning at: %2", _currentConfig, _pos];
			{
				_unit = _x;
				diag_log format ["Spawning: %1", _unit];
				_x createUnit[_pos, _group, "", _skill, "PRIVATE"];
			} forEach _currentConfig;
		};

		_allGroups pushBack _group;

		_count = _count - 1;
		diag_log format ["Iterating on spawn garrison, added group: %1, to allgroups: %2, iterations left: %3", _group, _allGroups, _count];
		sleep 1;
	};


	diag_log format ["Exited spawn loop for marker: %1", _marker];
	_otherSide = false;
	_friendlyAlive = false;
	waitUntil {
		sleep 3;
		_otherSide = false;
		_friendlyAlive = false;
		_nearest = markerPos _marker nearEntities [["Man", "Car", "Tank"], 1000];
		diag_log format ["Waiting for despawn at %1, with nearest %2", _marker, _nearest];
		{
			if(side _x != _side) exitWith { _otherSide = true};
		} forEach _nearest;
		_friendlyAlive = false;
		{
			if(!(isNull _x)) then {
				{
					if(alive _x) exitWith {_friendlyAlive = true};
				} forEach units _x;
			};
		} forEach _allGroups;
		// all the AI have died or all enemy units are gone
		diag_log format ["Other side Present %1, Are Friendlies alive? %2", _otherSide, _friendlyAlive];
		!(_friendlyAlive) OR !(_otherSide);
	};

	diag_log format ["Exited despawn wait with all groups: %1, and other side present %2", _allGroups, _otherSide];
	if(!_friendlyAlive) then {
		diag_log format ["Handing ownership of %1 from side %3", _marker, _side];
		[_marker, _side] call TransferOwnership;
		_notCaptured = false;
		sleep 10;
	};

	diag_log format ["Deleting all groups: %1 at: %2", _allGroups, _marker];
	// clean it all up and start again
	{
		_grp = _x;
		{
			deleteVehicle vehicle _x;
			deleteVehicle _x;
		} forEach units _grp;
	} forEach _allGroups;
};

