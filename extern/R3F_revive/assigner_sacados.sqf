/**
 * Assigner le contenu d'un sac � dos d�crit par un tableau au format sp�cifique
 * 
 * @param 0 l'unit� pour laquelle assigner le sac � dos
 * @param 1 les informations du sac � dos au format suivant :
 *     pour ne pas assigner de sac � dos : [], sinon
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

private ["_unite", "_tableau_sacados"];

_unite = _this select 0;
_tableau_sacados = _this select 1;

// Suppression de l'�ventuel sac � dos actuel
if !(isNull (unitBackpack _unite)) then
{
	removeBackpack _unite;
};

// S'il faut effectivement donner un sac � dos � l'unit�
if (count _tableau_sacados == 3) then
{
	private ["_sacados", "_commande_init", "_i"];
	
	// Pr�paration d'une commande d'initialisation pour synchroniser le contenu avec tous
	_commande_init = "";
	_commande_init = _commande_init + "clearWeaponCargo this;";
	_commande_init = _commande_init + "clearMagazineCargo this;";
	
	for [{_i = 0}, {_i < count (_tableau_sacados select 1 select 0)}, {_i = _i+1}] do
	{
		_commande_init = _commande_init + format ["this addWeaponCargo [""%1"",%2];",
			_tableau_sacados select 1 select 0 select _i,
			_tableau_sacados select 1 select 1 select _i];
	};
	
	for [{_i = 0}, {_i < count (_tableau_sacados select 2 select 0)}, {_i = _i+1}] do
	{
		_commande_init = _commande_init + format ["this addMagazineCargo [""%1"",%2];",
			_tableau_sacados select 2 select 0 select _i,
			_tableau_sacados select 2 select 1 select _i];
	};
	
	// Ajout du sac � dos avec la commande d'initialisation
	_unite addBackpack (_tableau_sacados select 0);
	_sacados = unitBackpack _unite;
	_sacados setVehicleInit _commande_init;
	processInitCommands;
};