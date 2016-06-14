disableSerialization;

_ctrl = _this select 0;
_display = uinamespace getvariable 'babe_menuAd_seats';
_btncount = uinamespace getvariable 'babe_menuAd_count';


_loop = {

   _veh = babe_int_curr select 0;

   _display = uinamespace getvariable 'babe_menuAd_seats';

   _udr = 0;

   _utur = 0;


   if (IsNull driver _veh) then
   {
      _udr = 0;
   } else
   {
      _udr = 1;
   };

   _trans = getnumber(configfile >> "CfgVehicles" >> typeof _veh >> "transportsoldier");

   _ctur = count (configfile >> "CfgVehicles" >> typeof _veh >> "turrets");

   _seats = _ctur+1+_trans;

   if (_ctur > 0) then
   {
   for "_i" from 0 to (_ctur-1) do 
   {

      if !(IsNull (_veh turretUnit [_i])) then
      {
         _utur = _utur + 1;
      };

   };
   };

   _freecargo = (_trans - (({alive _x} count (crew _veh))-_udr-_utur));

   for [{_i = 0}, {_i < _seats}, {_i=_i+1}] do
   {
      _stuff = uinamespace getvariable ("babe_menuAd_seats"+(str _i));

      _btn = _display displayctrl _i;

      waituntil {!IsNil "_stuff"};
      _para = _stuff select 0;

      _type = _stuff select 1;

      _fnc = _stuff select 2;

      _dta = _stuff select 3;



      switch (_dta select 0) do
      {
         case (1):
         {
            if (IsNull (driver _veh) or !alive (driver _veh)) then
            {
               _btn ctrlSetTextcolor [1, 1, 1, 1];
               _btn ctrlEnable true;
            } else
            {
               _btn ctrlSetTextcolor [0, 0, 0, 1];
               _btn ctrlEnable false;
            };
         };
         case (2):
         {
            if (IsNull (_veh turretUnit [(_dta select 1)]) or !alive (_veh turretUnit [(_dta select 1)])) then
            {
               _btn ctrlSetTextcolor [1, 1, 1, 1];
               _btn ctrlEnable true;
            } else
            {
               _btn ctrlSetTextcolor [0, 0, 0, 1];
               _btn ctrlEnable false;
            };
         };
         case (3):
         {
            if (_freecargo > 0) then
            {
               _btn ctrlSetTextcolor [1, 1, 1, 1];
               _btn ctrlEnable true;
            } else
            {
               _btn ctrlSetTextcolor [0, 0, 0, 1];
               _btn ctrlEnable false;
            };
         };
      };    
   };
};

_dialog = uinamespace getvariable "babe_dialog";

waituntil {!IsNil "_dialog"};
while {dialog} do
{
   [] call _loop;  
};