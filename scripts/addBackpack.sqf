_player = (_this select 1);
_type = (_this select 3) select 0;

removeBackpack _player;
sleep 0.5;
if (!(_type == "")) then 
{
	_player addBackpack _type;
	hintSilent "You picked up the backpack. Any previous backpacks were discarded.";
} else 
{
	hintSilent "Backpack dropped.";
};