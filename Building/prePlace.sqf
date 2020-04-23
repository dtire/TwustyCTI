params ["_building", "_cost"];

sleep 3;
_cash = 0;
if(side player == west) then {
	_cash = server getVariable["BluforCash", 0];
}
else
{
	_cash = server getVariable["OpforCash", 0];
};

if(_cash < _cost) exitWith {
	hint "Not enough cash to place building";
};

_pos = player modelToWorld [0,20,0];
_veh = _building createVehicle _pos;
_veh enableSimulationGlobal false;
_escape = false;
_enter = false;

waitUntil {
	if(inputAction "defaultAction" > 0) exitWith {_enter = true; true;};
	if(inputAction "ingamePause" > 0) exitWith {_escape = true; true;};
	// we return false to indicate we're not done
	_pos = player modelToWorld [0,20,0];
	_veh setPos _pos;
	false;
};

if(_escape) then 
{
	hint "Not Placing item";
	deleteVehicle _veh;
}
else
{
	hint "Placing Item";
	_veh enableSimulationGlobal true;
	_cash = _cash - _cost;
	if(side player == west) then {
		server setVariable["BluforCash", _cost, true];
	}
	else
	{
		server setVariable["OpforCash", _cost, true];
	}
};


