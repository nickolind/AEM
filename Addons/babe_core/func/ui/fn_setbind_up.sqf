_key = _this select 1;


_cur = uinamespace getvariable "cur_bind";

_mod = uinamespace getvariable "cur_mod";

_ctrl = (findDisplay 49) displayCtrl 212513;

_bind_change = profilenamespace getvariable (_mod+"_b"+(str _cur));

_keyinfo = _bind_change select 0;

_pressedkeys = _keyinfo select 1;

_datatype = _bind_change select 1;

_txt = _keyinfo select 0;

_txt = _keyinfo select 0;
	


	tempvar = 1;
	_keystr = "";
	

	_allkeys = []; 
	for "_i" from 0 to (count (configfile >> "CfgDefaultKeysPresets" >> "arma2" >> "mappings"))-1 do 
	{
		_action = configName ((configfile >> "CfgDefaultKeysPresets" >> "arma2" >> "mappings") select _i); 
		_boundkeys = actionKeys _action; 
		
		_usedkeys = [];
		
		for "_k" from 0 to (count _boundkeys)-1 do
		{
			_usedkeys pushback keyname (_boundkeys select _k);
		};
		
		_allkeys pushback [_action,_usedkeys]; 
		
	};
	
	tempvar = _allkeys;
	
	for "_j" from 0 to (count _pressedkeys)-1 do
	{
		_key = _pressedkeys select _j;
		
		_str = (keyname _key);
		

		
		if (_j != 0) then
		{
			_str = "+" + _str;
		};
		
		_keystr = _keystr + _str;
	};
	
	for "_i" from 0 to (count _allkeys)-1 do
	{
		_keyset = _allkeys select _i;
		_action = _keyset select 0;
		_combos = _keyset select 1;
		
		for "_k" from 0 to (count _combos)-1 do
		{
			_combo = _combos select _k;
			

			
			_ar1 = toArray _combo;
			_ar2 = toArray _keystr;
			
			if (_combo find _keystr > -1 && count _ar1 == count _ar2) then
			{
				//systemchat _action;
				//systemchat _keystr;
			};
		};
	};




_ctrl lnbSetText [[_cur,1], _keystr];

uinamespace setvariable ["cur_bind", nil];

EM_input_pls = false;
