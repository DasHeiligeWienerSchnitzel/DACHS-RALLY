params ["_thisList"];

if (!isServer) exitWith {};

private _player = (_thisList select { isPlayer _x }) param [0, objNull];
if (isNull _player) exitWith {};

_t0 = time;
_player setVariable ["Rally_Time_Started", _t0, false];
_player setVariable ["Rally_Started", true, true];

playSoundUI ["taskSucceeded",4];

[_player,_t0] remoteExec ["DACHS_fnc_startTimer", owner _player];