//systemchat "falldamage intersection initialised";

babe_fd_itg = true;


EM_travtime = 999;

["EH_em_fall2", "isTouchingGround player", [], "
{

	_pos = (getposatl player) select 2; 
	_pos2 = EM_oldpos select 2;

	EM_oldpos = getposAtL player;
	
	_spos = player modelToworld (player selectionPosition 'Spine2');
	
	_isSwimming = (agltoasl _spos) select 2 < 0.2;
	
	if (player == vehicle player && !_isSwimming) then 
	{
		_travtime = time - EM_travtime;
		[_pos, _pos2, _travtime] call babe_fd_fnc_fd;
	};
	
	
}", [], true, "{}", [], -1] call babe_core_fnc_addEH;  


["EH_em_fall3", "player != vehicle player", [], "
{

	EM_oldpos = getposAtL player;


}", [], false, "{}", [], -1] call babe_core_fnc_addEH; 


["EH_em_fall4", "player == vehicle player && !(IsTouchingGround player)", [], "
{

	EM_oldpos = getposAtL player;
	EM_travtime = time;


}", [], true, "{}", [], -1] call babe_core_fnc_addEH; 