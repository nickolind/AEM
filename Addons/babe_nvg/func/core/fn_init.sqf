if (IsDedicated) exitWith {};

0 = [] spawn 
{

waituntil {(!IsNull player) && (!isNull findDisplay 46 && !IsNil "babe_core_init")};

_mod = "babe_nvg";


if (!IsNil (_mod + "_init")) exitWith {systemchat (_mod + " already initialised...canceling re-init")};


_id = addMissionEventHandler ["loaded",{[] call babe_nvg_fnc_init}];

"babe_nvg" call babe_core_fnc_settings;

["EH_NVG", "currentVisionMode player == 1", [], "babe_nvg_fnc_nvgOn", [], true, "babe_nvg_fnc_nvgOff", [], -1] call babe_core_fnc_addEH;


babe_nvg_init = true;

};
