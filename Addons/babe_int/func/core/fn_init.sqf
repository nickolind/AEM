if (IsDedicated) exitWith {};

0 = [] spawn 
{

waituntil {(!IsNull player) && (!isNull findDisplay 46 && !IsNil "babe_core_init")};

_mod = "babe_int";


if (!IsNil (_mod + "_init")) exitWith {systemchat (_mod + " already initialised...canceling reinit")};



_id = addMissionEventHandler ["loaded",{[] call babe_int_fnc_init}];


babe_int_curr = [];

"babe_int" call babe_core_fnc_settings;

["EH_action", "true", [], "babe_int_fnc_actions", [], false, "{}", [], -1] call babe_core_fnc_addEH;

babe_int_init = true;

};