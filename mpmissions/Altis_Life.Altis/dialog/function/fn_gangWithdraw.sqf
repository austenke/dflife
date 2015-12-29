#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
_grpOwner = grpPlayer getVariable ["owner",0];
_ownerID = getPlayerUID player;
if(steamid != _grpOwner) exitWith {hint "You are not the owner of this gang";};
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};

_gFund = GANG_FUNDS;

if(_value > _gFund) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

ADD(BANK,_value);
SUB(_gFund,_value);
grpPlayer SVAR ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_WithdrawGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",RSERV];