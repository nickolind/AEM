class DefaultEventhandlers;
class CfgPatches
{
	class BABE_INT_FNC
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_BaseConfig_F",
			"babe_core"
		};
	};
};
class CfgFunctions
{
	class BABE_INT
	{
		tag="BABE_INT";
		class core
		{
			file="\babe\babe_int\func\core";
			class init
			{
				postInit=1;
			};
		};
		class int
		{
			file="\babe\babe_int\func\int";
			class actions
			{
			};
			class replace_this
			{
			};
			class use
			{
			};
			class fastuse
			{
			};
			class self
			{
			};
		};
		class ui
		{
			file="\babe\babe_int\func\ui";
			class menuAd
			{
			};
			class menuAd_fnc
			{
			};
			class update_seats
			{
			};
			class get_seats
			{
			};
			class inside_veh
			{
			};
		};
	};
};
