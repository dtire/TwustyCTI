params ["_type", "_side"];

_toReturn = "";
// TODO: Refactor these into templates
if(_type == "Barracks") then {
		_toReturn = "Land_i_Barracks_V2_F";
};
if(_type == "Aircraft Factory") then {
		_toReturn = "Land_i_Garage_V1_F";
};
if(_type == "Heavy Vehicle Factory") then {
		_toReturn = "Land_Bunker_F";
};
if(_type == "Light Vehicle Factory") then {
		_toReturn = "Land_TentHangar_V1_F";
};

_toReturn;