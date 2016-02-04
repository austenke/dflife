/*
	File: fn_s_onTrunkChange.sqf
	Author: Index
	
	Description:
	Allows for auto fill double click
*/
private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do {
	case 0: {
		ctrlSetText[3506,format["%1",_value]];
	};
	
	case 1: {
		life_vdCar = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 2: {
		life_vdAir = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
};