class DefaultEventhandlers;
class CfgPatches
{
	class BABE_CORE_FNC
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_BaseConfig_F"
		};
	};
};
class CfgFunctions
{
	class BABE_CORE
	{
		tag="BABE_CORE";
		class core
		{
			file="\babe\babe_core\func\core";
			class init
			{
				postInit=1;
			};
			class addEH
			{
			};
			class removeEH
			{
			};
			class keys
			{
			};
			class keyH
			{
			};
			class addkeyhandler
			{
			};
		};
		class mat
		{
			file="\babe\babe_core\func\mat";
			class diff
			{
			};
		};
		class misc
		{
			file="\babe\babe_core\func\misc";
			class inbbr
			{
			};
			class inbbr_pl
			{
			};
			class sortbydist
			{
			};
			class avpos
			{
			};
			class get_object_volume
			{
			};
			class make_idc
			{
			};
		};
		class mp
		{
			file="\babe\babe_core\func\mp";
			class mp
			{
			};
			class exec_JIP
			{
			};
			class command_ab
			{
			};
			class command_abc
			{
			};
			class addaction
			{
			};
			class switchMove
			{
			};
			class movein
			{
			};
		};
		class ui
		{
			file="\babe\babe_core\func\ui";
			class modmenu
			{
			};
			class modmenu_loop
			{
			};
			class modmenu_exit
			{
			};
			class settings
			{
			};
			class getkeybinds
			{
			};
			class getsettings
			{
			};
			class setbind
			{
			};
			class setbind_up
			{
			};
			class changesetting
			{
			};
			class startbind
			{
			};
			class settings_dbc
			{
			};
			class initmenu
			{
			};
			class submenu
			{
			};
			class ctrlSetPosition
			{
			};
		};
	};
};
