params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};

RALLY_CP_BYUID set [getPlayerUID _player, 1];
_player setVariable ["Rally_Started",false,true];
publicVariable "RALLY_CP_BYUID";