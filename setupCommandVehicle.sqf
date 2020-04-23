params ["_veh", "_side"];
[_veh] call CanBuild;
[_veh, _side] spawn GameOverHandler;