	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext - garbage collector - delete units when are die
	// -----------------------------------------------
	
	if (!isServer) exitWith{};

	private ["_unit"];

	_unit = _this select 0;

	sleep wctimetogarbagedeadbody;

	if (_unit iskindof "Man") then {
		hidebody _unit;
		sleep 3;
	};

	deletevehicle _unit;
