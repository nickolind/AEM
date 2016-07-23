
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["HMG Controls", "babe_em_climb_key_ID", "Jump/Climb (AEM)", {player call babe_em_fnc_detect}, {}, [DIK_SPACE, [false, false, false]]] call CBA_fnc_addKeybind;


/*
// Register a simple keypress to an action
// This file should be included for readable DIK codes.
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["MyMod", "MyKey", ["My Pretty Key Name", "My Pretty Tool Tip"], { _this call mymod_fnc_keyDown }, { _this call mymod_fnc_keyUp }, [DIK_TAB, [false, false, false]]] call cba_fnc_addKeybind;


Parameters
_modName	Name of the registering mod [String]
_actionId	Id of the key action.  [String]
_displayName	Pretty name, or an array of strings for the pretty name and a tool tip [String]
_downCode	Code for down event, empty string for no code.  [Code]
_upCode	Code for up event, empty string for no code.  [Code]
Optional
_defaultKeybind	The keybinding data in the format [DIK, [shift, ctrl, alt]] [Array]
_holdKey	Will the key fire every frame while down [Bool]
_holdDelay	How long after keydown will the key event fire, in seconds.  [Float]
_overwrite	Overwrite any previously stored default keybind [Bool]

*/