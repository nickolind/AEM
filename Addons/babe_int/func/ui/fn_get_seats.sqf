_veh = _this select 0;



   _turrs = [];

   _txt = [];


   _turrets = configfile >> "CfgVehicles" >> typeOf _veh >> "Turrets";


   for "_i" from 0 to ((count _turrets)-1) do 
   {

      _base = inheritsFrom (configFile >> "CfgVehicles" >> str (_turrets select _i));

      _turrs = _turrs + [[configname (_turrets select _i), _i]];

   };
   if !(_veh isKindOf "StaticWeapon") then
   {
      if (_veh isKindOf "Air") then
      {
         if (_veh == vehicle player) then
         {
            _txt pushback [(localize "str_getin_pos_pilot"), [player, _veh, 1, true, 1], 1, "babe_core_fnc_movein",[1,0]];
         } else
         {
            _txt pushback [(localize "str_getin_pos_pilot"), [player, _veh, 1, false, 1], 1, "babe_core_fnc_movein",[1,0]];
         };
      } else
      {
         if (_veh == vehicle player) then
         {
            _txt pushback [(localize "str_getin_pos_driver"), [player, _veh, 1, true, 1], 1, "babe_core_fnc_movein",[1,0]];
         } else
         {
            _txt pushback [(localize "str_getin_pos_driver"), [player, _veh, 1, false, 1], 1, "babe_core_fnc_movein",[1,0]];
         };
      };
      if (_veh == vehicle player) then
      {
         _txt pushback [(localize "str_getin_pos_cargo"), [player, _veh, 3, true, 1], 1, "babe_core_fnc_movein",[3,0]];
      } else
      {
         _txt pushback [(localize "str_getin_pos_cargo"), [player, _veh, 3, false, 1], 1, "babe_core_fnc_movein",[3,0]];
      };
   };

   {
      _tur = _x select 0;
      _ind = _x select 1;
      _name = gettext(configfile >> "CfgVehicles" >> typeOf _veh >> "turrets" >> _tur >> "gunnerName");

      if (_veh == vehicle player) then
      {
         _txt pushback [_name, [player, _veh, 2, true, _ind], 1, "babe_core_fnc_movein",[2,_ind]];
      } else
      {
         _txt pushback [_name, [player, _veh, 2, false, _ind], 1, "babe_core_fnc_movein",[2,_ind]];
      };

   } foreach _turrs;

		_tb = getNumber (configFile >> "CfgVehicles" >> typeof _veh >> "transportmaxbackpacks");
		_tm = getNumber (configFile >> "CfgVehicles" >> typeof _veh >> "transportmaxmagazines");
		_tw = getNumber (configFile >> "CfgVehicles" >> typeof _veh >> "transportmaxweapons");
		if (_tb > 0  || _tm > 0 || _tw > 0) then 
		{
			   _txt pushback [(localize "str_action_gear"), [player, _veh, 2, false, _ind], 1, "{player action ['Gear', babe_int_curr select 0]}",[11,10]];
		};


   if (count _txt > 0) then
   {

      ["babe_menuAd_seats", 7, 15, 0.1, 0.1, _txt] call babe_int_fnc_menuAd;
   };
