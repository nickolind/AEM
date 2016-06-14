	if (currentVisionMode player == 1 or ((profilenamespace getvariable "babe_laser_s1") select 0) select 1 == 0) exitwith {};

	_lasercolour = [babe_laser_colour select 0, babe_laser_colour select 1, babe_laser_colour select 2, 1.2-sunOrmoon];

	_range = babe_laser_range;

	_maxsize = babe_laser_maxsize;

	_rwrist = (player selectionPosition "rwrist");
	_start = player modeltoworld [_rwrist select 0, (_rwrist select 1) + 0, (_rwrist select 2) + 0.1];

        _lstart = atltoasl(player modeltoworld _rwrist);

        _lend = (player weaponDirection currentWeapon player) vectorMultiply _range;

	_end = asltoatl(_lend vectoradd _lstart);

        _int = lineIntersectsSurfaces [atltoasl _start, atltoasl _end, player, objNull, true, 1, "VIEW", "FIRE"];

        _endL = _end;

	_size = _maxsize;


        if (count _int > 0) then 
	{
		_end = (_int select 0) select 0; 
		_endL = asltoagl _end;

		_length = _lstart vectorDistance _end;

		if (_length >= _range) then 
		{
			_size = 0
		} else
		{
			_size = _maxsize*_range/(_length);
		};

		if (cameraView == "EXTERNAL") then
		{
			_intcam1 = lineintersectsSurfaces [agltoasl _endl, atltoasl (positioncameratoworld [0,0,0]), objnull, objnull, false, 1, "fire", "none"];

			_intcam = count _intcam1 > 0;

			if (_intcam) then 
			{
			_size = 0;
			};
		};
	} else
	{
		_size = 0
	};

	drawIcon3D ["\a3\data_f\car_light_flare2.paa", _lasercolour, _endL, _size, _size, random 360, "", 0, 0.05, "PuristaMedium"];