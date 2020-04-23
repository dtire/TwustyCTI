if(!isServer || hasInterface) exitWith{};

while{true} do {
	sleep 300;
	currencyChanging = true;
	publicVariable "currencyChanging";
	_bluforCash = server getVariable["BluforCash", 0];
	{
		_bluforCash = _bluforCash + 100;
	} forEach townsWest;
	server setVariable["OpforCash", _bluforCash, true];
	_opForCash = server getVariable["OpforCash", 0];
	{
		_opForCash = _opForCash + 100;
	} forEach townsEast;
	server setVariable["OpforCash", _bluforCash, true];
	currencyChanging = false;
	publicVariable "currencyChanging";
}