private ["_i", "_n", "_acs", "_obj"];

if (player != vehicle player) exitwith {};

_range = 10;

_obj = cursorTarget;

if (isNil "_obj") then
{
	_obj = ((lineintersectsSurfaces [atltoasl (positionCameraToWorld [0,0,0]), atltoasl (positionCameraToWorld [0,0,_range]), player, objNull, true, 1, "GEOM", "FIRE"]) select 0) select 3;

	if (isNil "_obj") then
	{
		_obj = ((lineintersectsSurfaces [atltoasl (player modeltoworld [0,0,0.5]), atltoasl (player modeltoworld [0,0,-1]), player, objNull, true, 1, "GEOM", "FIRE"]) select 0) select 3;
	};
} else
{
	_inbbr = [player, _obj, _range] call babe_core_fnc_inbbr_pl;

	if (!_inbbr) then
	{
		_obj = ((lineintersectsSurfaces [atltoasl (positionCameraToWorld [0,0,0]), atltoasl (positionCameraToWorld [0,0,_range]), player, objNull, true, 1, "GEOM", "FIRE"]) select 0) select 3;

		if (isNil "_obj") then
		{
			_obj = ((lineintersectsSurfaces [atltoasl (player modeltoworld [0,0,0.5]), atltoasl (player modeltoworld [0,0,-1]), player, objNull, true, 1, "GEOM", "FIRE"]) select 0) select 3;
		};
	};
};

if (isNil "_obj") exitwith {babe_int_curr = []};

babe_int_curr = [_obj];

