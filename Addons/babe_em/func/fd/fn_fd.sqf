_pos = _this select 0;
_pos2 = _this select 1;
_travtime = _this select 2;



if (_pos max _pos2 == _pos) exitwith {};

_realdist = _pos2 - _pos;

//systemchat str [_realdist, _travtime];

//if (_realdist <= EM_fd_min_dam_h) exitwith {};

//if (_realdist > EM_fd_min_dam_h && _travtime < 0.8) exitwith {};



_dist = abs (_realdist - EM_fd_min_dam_h);


if !(EM_climbing) then
{

	_dam = (abs _dist) * 0.15;
	
	//player setdamage ((damage player)+_dam);
	
	switch (currentweapon player) do
	{	
		case (""):	
		{
			if (_realdist >= 2 && _realdist < 4) then
			{
				player PlayMoveNow "babe_land_knl_ua";
			};
			if (_realdist >= 4) then
			{
				player PlayMoveNow "babe_land_pne_ua";
			};
		};
		case (secondaryWeapon player):
		{
			if (_realdist >= 2 && _realdist < 4) then
			{
				player PlayMoveNow "babe_land_knl_lnr";
			};
			if (_realdist >= 4) then
			{
				player PlayMoveNow "babe_land_pne_lnr";
			};
		};
		case (primaryWeapon player):
		{
			if (_realdist >= 2 && _realdist < 4) then
			{
				player PlayMoveNow "babe_land_knl_rfl";
			};
			if (_realdist >= 4) then
			{
				player PlayMoveNow "babe_land_pne_rfl";
			};
		};
		case (handgunWeapon player):
		{
			if (_realdist >= 2 && _realdist < 4) then
			{
				player PlayMoveNow "babe_land_knl_pst";
			};
			if (_realdist >= 4) then
			{
				player PlayMoveNow "babe_land_pne_pst";
			}; 
		};
	};
};





