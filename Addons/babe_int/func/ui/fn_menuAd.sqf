	_dialog = _this select 0; //uinamespace getvariable "babe_menuAd";

	_w = _this select 1;

	_h = _this select 2;

        _gap = _this select 3;

        _delay = _this select 4;

	_btns = _this select 5;

        uinamespace setvariable ["babe_dialog", nil];

        
        createDialog _dialog;
		setMousePosition [0.5, 0.5];


	_display = uinamespace getvariable _dialog;

        _cbtns = count _btns;

        _sqrt = sqrt _cbtns;

        _flsqrt = floor _sqrt;

        _di = -1;

        if (floor (_flsqrt/2) == _flsqrt/2) then {_di = 1} else {_di = 0};

        _sq = -1;

        if (_sqrt == _flsqrt) then {_sq = 1} else {_sq = 0};

        _rst = 0;


        if (_sq == 0) then {_rst = _cbtns -_sqrt^2};


        _rw = 0;

        _n = 0;

	for [{_i = 0}, {_i < (count _btns)}, {_i=_i+1}] do
	{


		  _btn = _display ctrlcreate ["Babe_Button", _i];

		  _txt = (_btns select _i) select 0;

		  _para = (_btns select _i) select 1;

		  _type = (_btns select _i) select 2;

		  _fnc = (_btns select _i) select 3;

		  _dta = (_btns select _i) select 4;

		  _btn = _display displayCtrl _i;

		  _btn ctrlSetText _txt;

                  _rgb = [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69]), (profilenamespace getvariable ['GUI_BCG_RGB_G',0.75]), (profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])];

		  //_btn ctrlSetTextColor [_rgb select 0, _rgb select 1, _rgb select 2, 1];

                  uinamespace setvariable [(_dialog+(str _i)), [_para, _type, _fnc, _dta]];

		  buttonSetAction [_i, "closedialog 0"];

                  _bx = 1;

                  _by = 1;

                  _bw = 1;

                  _bh = 1;

                  _n = _n + 1;

                  if (_n > _flsqrt) then {_n = 1};

                  if (_n == 1) then {_rw = _rw + 1};

                  _gapx = ( safezoneX + (safezoneW/2) - ((safezoneW/_w) * (_flsqrt/2-_n+1)) )*_gap;

                  _gapy = ( safezoneY + (safezoneH/2) - ((safezoneH/_h) * (_flsqrt/2-_rw+2)) )*_gap;

                  _gapw = (safezoneW/_w)*_gap;

                  _gaph = (safezoneH/_h)*_gap;

                  _bx = ( safezoneX + (safezoneW/2) - ((safezoneW/_w) * (_flsqrt/2-_n+1)) ) + _gapx/2;

                  _by = ( safezoneY + (safezoneH/2) - ((safezoneH/_h) * (_flsqrt/2-_rw+2)) ) + _gapy/2;

                  _bw = (safezoneW/_w) - _gapw;

                  _bh = (safezoneH/_h) - _gaph;

		  _btn ctrlSetPosition [_bx, _by, _bw, _bh];

		  _btn ctrlCommit _delay;
             
	};
        uinamespace setvariable ["babe_dialog", _dialog];