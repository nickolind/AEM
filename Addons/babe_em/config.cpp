class CfgPatches
{
	class BaBe_EM
	{
		units[]=
		{
			"babe_helper"
		};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"babe_core"
		};
	};
};
class CfgVehicles
{
	class All
	{
	};
	class Static: All
	{
	};
	class Building: Static
	{
	};
	class NonStrategic: Building
	{
	};
	class TargetTraining: NonStrategic
	{
	};
	class TargetGrenade: TargetTraining
	{
	};
	class babe_helper: TargetGrenade
	{
		model="\babe\babe_em\models\helper.p3d";
		armor=20000;
		scope=2;
		displayName="helper";
		icon="iconObject";
		mapSize=0.69999999;
		accuracy=0.2;
	};
};
class CfgModSettings
{
	class babe_EM
	{
		name="Enhanced Movement";
		class Keybinds
		{
			b1[]=
			{
				"Jump/Climb",
				{57},
				"babe_em_fnc_detect",
				"player"
			};
		};
		class Settings
		{
			s1[]=
			{
				"Stamina",
				1
			};
		};
	};
};
