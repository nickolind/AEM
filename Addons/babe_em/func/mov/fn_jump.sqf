		_climber = _this select 0;
		_wlj = _this select 1;

		if (IsTouchingGround _climber && load _climber < _wlj) then
		{
			switch (true) do
			{
				case (currentWeapon _climber == ""):
				{
					_anm = "babe_em_jump_ua";
				};
				case (currentWeapon _climber == primaryWeapon _climber):
				{
					_anm = "babe_em_jump_rfl";
				};
				case (currentWeapon _climber == handgunWeapon _climber):
				{
					_anm = "babe_em_jump_pst";
				};
			};
			_climber playActionNow _anm;

			_vel = velocity _climber; 
			_ppos = getposASL _climber;
			_climber setposASL [_ppos select 0, _ppos select 1, (_ppos select 2)+0.1];


			_jh = (3-(loadabs _climber)*0.001) max 0;
 
			_climber setvelocity [(_vel select 0), (_vel select 1), _jh];
			_climber setStamina (getstamina _climber)-8;

		} else
		{
			if (_climber == player) then
			{
				EM_busy = false;
			};
		};



