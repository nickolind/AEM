	if (cameraView != 'Gunner') then
	{
		playsound "RscDisplayCurator_visionMode";
	};
	if (((profilenamespace getvariable "babe_nvg_s1") select 0) select 1 == 1) then
	{
		
		babe_PP_wetD = ppEffectCreate ["WetDistortion",300];
		babe_PP_wetD ppEffectEnable true;
		babe_PP_wetD ppEffectAdjust [10,0.056,0.056,0,0,0,0,0,0,0.1,0,0,0,0,0];
		babe_PP_wetD ppEffectCommit 0;

		
		babe_PP_film = ppEffectCreate ["FilmGrain",2000];

		babe_PP_film ppEffectEnable true;

		babe_PP_film ppEffectAdjust [0.03,0,2,2.77,1.96,true];

		babe_PP_film ppEffectCommit 0;
		
	};