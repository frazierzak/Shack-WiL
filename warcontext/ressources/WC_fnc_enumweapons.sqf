	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// Enums weapons - warcontext
	// -----------------------------------------------

	private ["_cfg", "_cfgsides", "_objectype", "_objectname", "_object", "_count", "_weapons", "_cfg","_displayname", "_displaynames", "_doWeAdd"];

	_weapons = [];
	_displaynames = [];
	_count = count (configfile >> "CfgWeapons");

	for "_i" from 0 to (_count - 1) do {
		_object = (configfile >> "CfgWeapons") select _i;
		if (isClass _object) then {
			if (getNumber(_object >> "scope") == 2) then {
				_objectname = configName _object;
				_objectype = getNumber(_object >> "type");
				_displayname = tolower (getText (_object >> "displayName"));
				if!(_displayname in _displaynames) then {
					_displaynames = _displaynames + [_displayname];

					_doWeAdd = true;
					{
						if ([_object, configFile >> "CfgWeapons" >> _x] call WC_fnc_isInheritFrom) exitwith {_doWeAdd = false};
					} forEach wclistofexcludedweaponclasses;
					
					//if(_objectype < 4097) then {
					if(_doWeAdd) then {
						_weapons = _weapons + [_objectname];
					};
					//};
				};
			};
		};
	};

	_weapons;