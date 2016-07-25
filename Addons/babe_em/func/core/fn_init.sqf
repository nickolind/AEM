if (IsDedicated) exitWith {};



0 = [] spawn {

disableSerialization;

waituntil {(!IsNull player) && (!isNull findDisplay 46 && !IsNil "babe_core_init")};

_mod = "babe_em";





if (!IsNil (_mod + "_init")) exitWith {systemchat (_mod + " already initialised...canceling reinit")};


_id = addMissionEventHandler ["loaded",{[] call babe_em_fnc_init}];





player addeventhandler ["handledamage", 
{
	_this call babe_em_fnc_handledamage_nofd;
}];

player addeventhandler ["Respawn",
{

   _u = _this select 0; 
   _c = _this select 1;

   EM_Busy = false;

}];




player addeventhandler ["AnimDone", 
{
   _this call babe_em_fnc_animDone;
}]; 



"babe_EM" call babe_core_fnc_settings;


// Key binding with cba
#include "keyBinding.sqf"


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


EM_busy = false;

EM_climbing = false;

EM_heightsOn = 		[0.25,	1,		2,		2.25,	3];

EM_heightsOver = 	[0.25,	1.1,	1.7,	2.5,	3];

				// Default: 		EM_weightlimits = [1, 1, 1, 1]
if (isNil "EM_weightlimits") then {EM_weightlimits = [0.9, 0.71, 0.355, 1]}; 	// GetOn: 	[1-2m--hopIn, 2-2.25m--Climb, 2.25-3m--Pull&Climb, Jump]
																			// GetOver: [1-2m--hopIn, 2-2.25m--Climb, 2.25-3m--Pull&Climb, Jump]
																			// 1 -- ~45kg, 0.71 -- ~32kg, 0.355 -- ~16kg		0.5 -- ~22.7kg

EM_enable = [true, true];

EM_debug = false;

EM_allowed = true;

EM_fd_mu = 1;
EM_fd_min_dam_h = 2.5;
EM_fd_debug = false;



call babe_fd_fnc_init_fd;


babe_em_help = "babe_helper" createVehicleLocal [0,0,0];

babe_em_debug_a = "Sign_Arrow_Green_F" createVehicleLocal [0,0,0];
babe_em_debug_b = "Sign_Arrow_F" createVehicleLocal [0,0,0];
babe_em_debug_c = "Sign_Arrow_Yellow_F" createVehicleLocal [0,0,0];


["EH_em_loop", "EM_climbing", [], "{player setVelocity [0,0,0]; EM_travtime = 0;EM_oldpos = getposATL player;EM_newpos = getposATL player;}", [], false, "{}", [], -1] call babe_core_fnc_addEH;

["EH_MM", "!IsNull findDisplay 49", [], "babe_core_fnc_mod_menu", [], true, "{}", [], -1] call babe_core_fnc_addEH;

["EH_em_hud", "true", [], "babe_em_fnc_hudrefresh", [], false, "{}", [], -1] call babe_core_fnc_addEH;


babe_em_init = true;

};
