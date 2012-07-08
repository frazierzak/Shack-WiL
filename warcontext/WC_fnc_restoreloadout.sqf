	// -----------------------------------------------
	// Author: team  code34 nicolas_boiteux@yahoo.fr
	// warcontext - restore loadout
	// -----------------------------------------------


	if (isDedicated) exitWith {};

	private [
		"_magazines", 
		"_weapons", 
		"_hasruck", 
		"_hasruckace", 
		"_ruckmags", 
		"_ruckweapons", 
		"_rucktype", 
		"_enemy", 
		"_sacados_avant_mort", 
		"_backpack", 
		"_weapononback"
	];
	
	// Retrait de l'équipement
	removeAllWeapons player;
	removeAllItems player;
	if!(wchasruck) then { removebackpack player; };
		
	// Restauration des armes d'avant le décès
	{player addMagazine _x;} forEach wcmagazines;
	{player addWeapon _x;} forEach wcweapons;

	if(wcwithACE == 1) then {
		if (wchasruckace) then {
			[player, "ALL"] call ACE_fnc_RemoveGear;
			if (!isNil "wcruckmags") then {
				player setvariable ["ACE_RuckMagContents", wcruckmags];
			};
			if (!isNil "wcruckweapons") then {
				player setvariable ["ACE_RuckWepContents", wcruckweapons];
			};
		};
		if (!isNil "wcweapononback") then {
			[player, "WOB"] call ACE_fnc_RemoveGear;
			player setvariable ["ACE_weapononback", wcweapononback];
		};
		player addweapon "ACE_Earplugs";
	};
	if (wchasruck) then {
		[player, [wcrucktype, wcruckweapons, wcruckmags]] call R3F_REV_FNCT_assigner_sacados;
		//player addBackpack wcrucktype; clearWeaponCargo (unitBackpack player); clearMagazineCargo (unitBackpack player);
		//
		//for "_i" from 0 to (count (wcruckmags select 0) - 1) do {
		//	(unitBackpack player) addMagazineCargo [(wcruckmags select 0) select _i,(wcruckmags select 1) select _i];
		//};
		//for "_i" from 0 to (count (wcruckweapons select 0) - 1) do {
		//	(unitBackpack player) addWeaponCargo [(wcruckweapons select 0) select _i,(wcruckweapons select 1) select _i];
		//};
	};

	player selectWeapon (primaryWeapon player);