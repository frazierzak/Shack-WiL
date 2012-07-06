	// -----------------------------------------------
	// Author: team  code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: Do random weather 
	// locality: server side
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_rainrate", 
		"_rain",
		"_fog",
		"_overcast",
		"_datestamp"
	];

	_rainrate = _this select 0;

	while {true} do {
		_rain = random _rainrate;
		if((date select 4 > 2) and (date select 4 <7)) then {
			_fog = 0.6 + (random 0.4);
		} else {
			_fog  = random 0.5;
		};
		_overcast = random 1;
		wcweather = [_rain, _fog, _overcast];
		["wcweather", "client"] call WC_fnc_publicvariable;
		600 setRain (wcweather select 0);
		600 setfog (wcweather select 1);
		600 setOvercast (wcweather select 2);
		sleep 600;
	};