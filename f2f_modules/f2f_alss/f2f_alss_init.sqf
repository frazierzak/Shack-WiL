// ------------------------------------
// F2F's AIR LOADOUT SELECTOR SYSTEM
// CREATED BY: [F2F] SKYNET
// CONTACT ME: TheFirst2Fight@yahoo.com
// JOIN US @ www.TheFirst2Fight.com!
// ------------------------------------

// ------------------------------------
// ---------- VERSION 2.4!!! ----------
// ------------------------------------

// ------------------------------------
// *** To activate A.L.S.S. Copy + Paste the following code into a desired object's init field: ***
// null = [this, 20] execVM "f2f_modules\f2f_alss\f2f_alss_init.sqf";
// ------------------------------------
// *** To clear ordinance from aircraft at mission start, copy + paste the following code into aircraft init field: ***
// null = [this] execVM "f2f_modules\f2f_alss\f2f_exe\f2f_exe_vecInit_clrWeps.sqf";
// ------------------------------------

_loader = _this select 0;
_radi = _this select 1;

#include "f2f_inc_macros.sqf"
#include "f2f_inc_rmvActns.sqf"

waitUntil {sleep 0.1; vehicle player isKindOf "Air" && vehicle player distance _loader <= _radi && ((assignedVehicleRole player) select 0) == "Driver"};

if (vehicle player isKindOf "Air") then
{
	if (vehicle player isKindOf "Plane") then
	{
		private ["_vec", "_acClass"];
		_vec = vehicle player;
		_acClass = typeOf vehicle player;
		#include "f2f_inc_cfg_p.sqf"
	}
	else
	{
		if (vehicle player isKindOf "Helicopter") then
		{
			private ["_vec", "_acClass"];
			_vec = vehicle player;
			_acClass = typeOf vehicle player;
			#include "f2f_inc_cfg_h.sqf"
		}
		else
		{
			waitUntil {sleep 0.1; vehicle player distance _loader > _radi};
			if (true) exitWith {null = [_loader, _radi] execVM "f2f_modules\f2f_alss\f2f_alss_init.sqf"};
		};
	};
}
else
{
	waitUntil {sleep 0.1; vehicle player distance _loader > _radi};
	if (true) exitWith {null = [_loader, _radi] execVM "f2f_modules\f2f_alss\f2f_alss_init.sqf"};
};