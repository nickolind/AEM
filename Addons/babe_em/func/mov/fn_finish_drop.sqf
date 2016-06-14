	["EH_em_drop"] call babe_core_fnc_removeEH;
	
	_climber = _this select 0;

	babe_em_help setpos [0,0,0];

	
	if (_climber == player)then
	{
		EM_busy = false;
		EM_climbing = false;
	};
