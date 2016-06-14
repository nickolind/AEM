_obj = _this select 0;
_acs = _this select 1;

if (((profilenamespace getvariable 'babe_int_s2') select 0) select 1 == 0) exitwith {};

_range = 1.55;

if (cameraView == "External") then
{
	_range = _range + ((positioncameratoworld [0,0,0]) distance (player modeltoworld(player selectionposition "head")));
};

_posa = positionCameraToWorld [0,0,0];
_posb = positionCameraToWorld [0,0,_range];

_int = ([_obj, "VIEW"] intersect [_posa, _posb]) select 0 select 0;

if (IsNil "_int") exitwith {};

for "_n" from 0 to ((count _acs)-1) do 	
{	
	_cond = gettext (configFile >> "CfgVehicles" >> typeof _obj >> "Useractions" >> _acs select _n >> "condition");
	_stat = ToLower (gettext (configFile >> "CfgVehicles" >> typeof _obj >> "Useractions" >> _acs select _n >> "statement"));
	
	_hit =  _stat find toLower(_int) > -1;
	
	if _hit then
	{
		_cond = _cond call babe_int_fnc_replace_this;

		_cond = _obj call compile format['%1', _cond];
		
		if _cond then
		{
			_stat = _stat call babe_int_fnc_replace_this;

			_obj call compile format['%1', _stat];
		};
	};
};
