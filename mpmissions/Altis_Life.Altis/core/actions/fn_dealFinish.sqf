#include <macro.h>
/*
	File: fn_dealFinish.sqf
	Author: Index
	
	Description:
	Finishes the drug deal
*/
private["_dp","_dis","_price"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_deal_in_progress = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(1.7 * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
if(([false,"marijuana",4] call life_fnc_handleInv)) then {
	ADD(CASH,_price);
};