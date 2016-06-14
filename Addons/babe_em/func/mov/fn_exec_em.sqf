private ["_pos"];

	_pos = _this select 0;

	_over = _this select 1;
	
	_climber = _this select 2;
	

	
	_help = babe_em_help;

	_help setposASL _pos;

	_help setdir getdir _climber;

	_poswt = _climber worldtomodel (asltoagl _pos);

	if (_over) then
	{ 
		_climber setposASL (agltoasl (_climber modeltoworld [_posWT select 0, _posWT select 1, (_posWT select 2) + 0.1]));
	} else
	{
		_climber setposASL (agltoasl (_climber modeltoworld [_posWT select 0, (_posWT select 1)+0.1, (_posWT select 2) + 0.1]));
	};