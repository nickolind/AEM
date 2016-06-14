if (((profilenamespace getvariable 'babe_int_s2') select 0) select 1 == 0) exitwith {};

	if (dialog) exitwith {closedialog 0};

	_range = 1.5;

	if (cameraView == "External") then {_range = _range + 3};

	if (count babe_int_curr == 0) exitwith 
	{
		_obj = vehicle player;

		if (vehicle player != player) exitwith 
		{
			if (player == driver _obj) then 
			{
				_obj engineOn false
			};
			if (_obj isKindOf "Air" or _obj isKindOf "StaticWeapon") then
			{	
				player action ["getOut", _obj];
			} else
			{
				player action ["Eject", _obj];
			};
		};
	};


	_obj = babe_int_curr select 0;

	if (vehicle player != player) exitwith 
	{
		call babe_int_fnc_inside_veh;
	};


	if (_obj isKindOf "LandVehicle" or _obj isKindOf "Air" or _obj isKindOf "Ship") exitwith
	{
		if (getnumber (configfile >> "CfgVehicles" >> typeof _obj >> "isUAV") == 1) exitwith {};
		0 = [_obj] call babe_int_fnc_get_seats
	};

	_checkpos1 = (positionCameraToworld [0,0,0]);
	_checkpos2 = (positionCameraToworld [0,0,_range]);

	if (cameraView == "External") then
	{
		_checkpos = (positionCameraToworld [0,0,_range+3]);
	};

	_int = _obj in (lineIntersectsWith [atltoasl _checkpos1, atltoasl _checkpos2]);

	_h = _obj;
 
	_ladders = getArray (configFile >> "CfgVehicles" >> typeof _h >> "ladders"); 

	if (count _ladders > 0) then
	{
		_ladder = 0;
		_l = 0; 
		_lpos = 0; 
		_dist = 0; 
		{
			_ladder = _x; 
			_num = _ladders find _x; 
			{
				_dir = ""; 
				_pos =  (_h selectionPosition _x);
				_sel = player selectionPosition "pelvis";
				_dist = (player modeltoworld [_sel  select 0, _sel select 1 + 1, _sel select 2 - 1]) distance  (_h modeltoworld _pos);
				_dist2 = (player modeltoworld [_sel  select 0, _sel select 1 + 1, _sel select 2]) distance  (_h modeltoworld _pos);
				if (_dist < 1 or _dist2 < 1) then 
				{ 
					_lpos = (_ladder find _x); 
					_l = (_ladders find _ladder); 
					if (_lpos == 0) then 
					{
						_dir = "ladderUP"
					} else 
					{
						_dir = "ladderDown"
					}; 
					player action [_dir, _h, _l, _lpos];
				}; 

			} foreach _x
		} foreach _ladders;
	};

	_nearest = babe_int_curr_acs;

	_obj = babe_int_curr select 0;



	_acs = [];


	_actions = configFile >> "CfgVehicles" >> (typeof _obj) >> "Useractions";

	for "_i" from 0 to ((count _actions)-1) do 
	{

		_base = inheritsFrom (configFile >> "CfgVehicles" >> str (_actions select _i));

		_acs = _acs + [configname (_actions select _i)];

	};

	if (count _acs > 0) then
	{
		[_obj, _acs] call babe_int_fnc_fastuse;
	} else
	{
		_tb = getNumber (configFile >> "CfgVehicles" >> typeof _obj >> "transportmaxbackpacks");
		_tm = getNumber (configFile >> "CfgVehicles" >> typeof _obj >> "transportmaxmagazines");
		_tw = getNumber (configFile >> "CfgVehicles" >> typeof _obj >> "transportmaxweapons");

		if ((_tb > 0  || _tm > 0 || _tw > 0) && _int) then 
		{
			player action ["Gear", _obj];
		};
	};
