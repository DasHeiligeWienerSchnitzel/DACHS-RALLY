params ["_time", "_player", "_formatedTime"];

if (!isServer) exitWith {};

private _name = name _player;

scoreboard_list pushBack [_time, _name, _formatedTime];
scoreboard_list sort true;
publicVariable "scoreboard_list";

private _scoreboardText = "Scoreboard:\n";

{
    _scoreboardText = _scoreboardText + format ["%1. %2 - %3\n", _forEachIndex + 1, _x#1, _x#2];
} forEach scoreboard_list;

scoreboard_object setObjectTextureGlobal [
	0,
    format ["#(rgb,1024,1024,3)text(0,1,""RobotoCondensed"",0.07,""#00000000"",""#FFFFFFFF"",""%1"")", _scoreboardText]
];
