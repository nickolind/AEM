private ["_toppos"];

	["EH_em"] call babe_core_fnc_removeEH;

	_toppos = _this select 0;

	_over = _this select 1;
	
	_stmpn = _this select 2;
	
	_climber = _this select 3;
	

	
	_climber setStamina (getStamina _climber)-_stmpn;

	_help = babe_em_help;

	if (_over) then
	{ 
		_climber setposASL _toppos;
	};

	_help setpos [0,0,0];

	if (_climber == player)then
	{
		EM_busy = false;
		EM_climbing = false;
	};

	_climber setAnimSpeedCoef 1;
	// _climber setAnimSpeedCoef EM_default_animspeedcoef;
