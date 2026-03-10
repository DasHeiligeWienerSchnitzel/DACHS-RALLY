params ["_thisList"];
if (!isServer) exitWith {}; 

_player = (_thisList select { isPlayer _x }) param [0, objNull];
if (isNull _player) exitWith {};

_uid = getPlayerUID _player;
_expected = RALLY_CP_BYUID getOrDefault [_uid, 1];

_numberOfCheckpoints = 3;

if (_numberOfCheckpoints == _expected) then {
	_player setVariable ["Rally_Started",false,true];
	RALLY_CP_BYUID set [getPlayerUID _player, 1];
	cutText ["","PLAIN"];
	playSoundUI ["FD_Finish_F",4];
	
	_newTimes = player getVariable "CheckpointTimes";
	_oldTimes = CP_TIMES_BYUID getOrDefault [_uid, []];
	_newFinal = _newTimes select ((count _newTimes) - 1);
	
	if (_oldTimes isEqualTo []) then {
		CP_TIMES_BYUID set [_uid, +_newTimes];
	}else{
		_oldFinal = _oldTimes select ((count _oldTimes) - 1);
		if (_newFinal < _oldFinal) then {
			CP_TIMES_BYUID set [_uid, +_newTimes];
		};
	};
	_bestTime = 36000;
	{
		_uid = getPlayerUID _x;
		_times = CP_TIMES_BYUID get _uid;
		_time = _times select ((count _times) - 1);
		if (_time < _bestTime) then {
			_bestTime = _time;
			numberOne = _uid;
			publicVariable "numberOne";
		};			
	}forEach allPlayers;
};

publicVariable "RALLY_CP_BYUID";
publicVariable "CP_TIMES_BYUID";

player setVariable ["CheckpointTimes",[]];