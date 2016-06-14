class CfgPatches
{
	class babe_core_UI
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Characters_F_BLUFOR",
			"A3_Characters_F",
			"A3_Sounds_F",
			"A3_Data_F"
		};
	};
};
class RscButton;
class babe_button: RscButton
{
	font="PuristaMedium";
	x="safezoneX + safezoneW/2";
	y="safezoney + safezoneH/2";
	w=0;
	h=0;
	shadow=0;
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[]={1,1,1,1};
	colorActive[]={1,1,1,1};
	colorTextSelect[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorBackground[]={0,0,0,0.5};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorBackgroundDisabled[]={0,0,0,0.5};
	colorFocused[]={0,0,0,1};
	colorShadow[]={0,0,0,0};
	onButtonClick="_this call babe_core_fnc_menuAd_fnc";
};
class ScrollBar;
class RscBackground;
class RscListNBox;
class BABE_core_List: RscListNBox
{
	x="0.25 * safezoneW + safezoneX";
	y="0.875 * safezoneH + safezoneY";
	w="safezoneW/3.5";
	h="safezoneH/4";
	shadow=0;
	type=102;
	sizeEx="safezoneW*0.0175";
	font="PuristaMedium";
	style=0;
	color[]={1,1,1,1};
	colorBorder[]={1,1,1,1};
	colorDisabled[]={1,1,1,1};
	colorText[]={1,1,1,1};
	colorScrollbar[]={1,1,1,1};
	colorSelect[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorSelect2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorSelectBackground[]={1,1,1,1};
	colorSelectBackground2[]={1,1,1,1};
	colorBackgroundActive[]={1,1,1,1};
	colorBackground[]={1,1,1,1};
	period=0;
	rowHeight=0.050000001;
	columns[]={0.025,0.5,0.5};
	tooltip="hold shift to click and drag this menu";
	class ListScrollBar: ScrollBar
	{
		color[]={1,1,1,1};
		autoScrollEnabled=1;
	};
	onMouseButtonDblClick="_this call babe_core_fnc_settings_dbc";
	onKeydown="_this call babe_core_fnc_setbind";
	onKeyUp="_this call babe_core_fnc_setbind_up";
};
class BABE_core_Listbg: RscBackground
{
	x="0.25 * safezoneW + safezoneX";
	y="0.875 * safezoneH + safezoneY";
	w="safezoneW/3.5";
	h="safezoneH/4";
	color[]={0,0,0,0.5};
	colorBackground[]={0,0,0,0.5};
};
