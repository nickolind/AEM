class DefaultEventhandlers;
class CfgPatches
{
	class BaBe_int
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"a3_weapons_f",
			"babe_core"
		};
	};
};
class CfgModSettings
{
	class babe_int
	{
		name="Enhanced Interaction";
		class Keybinds
		{
			b1[]=
			{
				"Use",
				{33},
				"babe_int_fnc_use",
				"{}"
			};
			b2[]=
			{
				"Self-Interaction",
				{220},
				"babe_int_fnc_self",
				"{}"
			};
		};
		class Settings
		{
			s1[]=
			{
				"Self-Interaction",
				1
			};
			s2[]=
			{
				"Overall Interaction",
				1
			};
		};
	};
};
