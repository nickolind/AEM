_btn = _this select 0;

_dialog = uinamespace getvariable "babe_dialog";

_num = ctrlIDC _btn;

_stuff = uinamespace getvariable (_dialog+(str _num));


_para = _stuff select 0;

_type = _stuff select 1;

_fnc = _stuff select 2;

_dta = _stuff select 3;


switch (_type) do
{
   case (1):
   {
      _code = format["_para call %1",_fnc];
      call compile _code;

   };
   case (2):
   {
      _code = format["_para spawn %1",_fnc];
      call compile _code;
																																																			
   };
};