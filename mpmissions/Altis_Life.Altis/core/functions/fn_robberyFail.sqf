/*
	File: fn_UnLockCarSound.sqf
*/
private["_source"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _source) exitWith {};
if(player distance _source > 50) exitWith {};
_source say3D "robberyFail";