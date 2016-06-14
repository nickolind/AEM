if (IsDedicated) exitWith {};

0 = [] spawn 
{

waituntil {(!IsNull player) && (!isNull findDisplay 46 && !IsNil "babe_core_init")};

_mod = "babe_laser";


if (!IsNil (_mod + "_init")) exitWith {systemchat (_mod + " already initialised...canceling re-init")};


_id = addMissionEventHandler ["loaded",{[] call babe_laser_fnc_init}];

"babe_laser" call babe_core_fnc_settings;

babe_laser_colour = [1,0,0];
babe_laser_range = 250;
babe_laser_maxsize = 0.1;

["EH_laser", "player isIRLaserOn currentWeapon player", [], "babe_laser_fnc_laser", [], false, {}, [], -1] call babe_core_fnc_addEH;

babe_laser_init = true;
};
