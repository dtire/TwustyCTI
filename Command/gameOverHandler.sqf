params ["_side"];

if (isMultiplayer && !isServer) exitWith {};

_cv = objNull;
if(_side == west) then {
	_cv = Blufor_CV;
} else {
	_cv = Opfor_CV;
};

waitUntil {
	sleep 3;
	!alive _cv;
};

if(_side == west) then {
	east addScoreSide 1000000; 
} else {
	west addScoreSide 1000000; 
};

"SideScore" call BIS_fnc_endMissionServer;