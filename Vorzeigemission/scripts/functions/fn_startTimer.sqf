params ["_player","_t0"];

_padNumber = {
	params ["_n"];
	if (_n < 10) then {
		"0" + str _n
	}else{
		str _n
	};
};
_time = 0;

hint "2";

cutRsc ["DACHS_RALLY", "PLAIN"];
_display = uiNamespace getVariable ["DACHS_RALLY", displayNull];

while {_player getVariable ["Rally_Started",false] and alive _player} do {
	_time = time - _t0;

	_minutes = floor (_time / 60);
	_seconds = floor (_time % 60);
	_centis  = floor ((_time * 100) % 100);

	// Format with leading zeros
	_minStr = [_minutes, 2] call _padNumber;
	_secStr = [_seconds, 2] call _padNumber;
	_cenStr = [_centis, 2] call _padNumber;

	hintSilent format ["%1:%2:%3", _minStr, _secStr, _cenStr];
	
	if (!isNull _display) then {
		_control = _display displayCtrl 1000;
		_control progressSetPosition (1 - damage player);
	};	
	
	if (player getVariable ["CheckpointPassed",false]) then {
		_checkpointTimes = player getVariable ["CheckpointTimes",[]];
		_checkpointTimes pushBack _time;
		player setVariable ["CheckpointTimes",_checkpointTimes];
		
		_bestTimes = CP_TIMES_BYUID getOrDefault [numberOne, []];
		if (_bestTimes isNotEqualTo []) then {
			_bestTime = _bestTimes select ((count _checkpointTimes) - 1);
			_difference = abs(_bestTime - _time);

			_minutes = floor (_difference / 60);
			_seconds = floor (_difference % 60);
			_centis  = floor ((_difference * 100) % 100);

			// Format with leading zeros
			_minStr = [_minutes, 2] call _padNumber;
			_secStr = [_seconds, 2] call _padNumber;
			_cenStr = [_centis, 2] call _padNumber;
			
			_color = '#ff0000';
			if (_bestTime > _time) then {_color = '#ff0000'} else {_color = '#00ff04'};
			
			[
				parseText format ["<t color='%4' size='2'>+%1:%2:%3</t>",_minStr, _secStr, _cenStr,_color],
				0.0,   // X position (0 = left, 1 = right)
				0.6,  // Y position (0 = top, 1 = bottom)
				2,     // duration
				0.5
			] spawn BIS_fnc_dynamicText;
		};
		player setVariable ["CheckpointPassed",false];
	};
	uiSleep 0.05;
};

_time = time - _t0;
if (alive _player && _time > 10) then {
	
	_minutes = floor (_time / 60);
	_seconds = floor (_time % 60);
	_centis  = floor ((_time * 100) % 100);

	// Format with leading zeros
	_minStr = [_minutes, 2] call _padNumber;
	_secStr = [_seconds, 2] call _padNumber;
	_cenStr = [_centis, 2] call _padNumber;
	
	[_time,_player,format ["%1:%2:%3", _minStr, _secStr, _cenStr]] remoteExecCall ["DACHS_fnc_updateScoreboard", 2];
};