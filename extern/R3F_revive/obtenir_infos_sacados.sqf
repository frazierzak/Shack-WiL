	/**
	 * Obtenir le contenu d'un sac � dos dans un tableau au format sp�cifique
	 * 
	 * @param 0 l'unit� pour laquelle consulter le sac � dos
	 * 
	 * @return les informations du sac � dos au format suivant :
	 *     si l'unit� n'a pas de sac � dos : [], sinon
	 *     [
	 *         "nom de classe du sac � dos",
	 *         [liste des armes, quantit� associ�es � chaque arme],
	 *         [liste des chargeurs, quantit� associ�es � chaque chargeur]
	 *     ]
	 * 
	 * Copyright (C) 2010 madbull ~R3F~
	 * 
	 * This program is free software under the terms of the GNU General Public License version 3.
	 * You should have received a copy of the GNU General Public License
	 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
	 */
	
	private ["_result", "_backpack"];
	
	_backpack = unitBackpack (_this select 0);	
	if (isNull _backpack) then {
		_result = [];
	} else {
		_result = [typeOf _backpack, getWeaponCargo _backpack, getMagazineCargo _backpack];
	};
	
	_result;