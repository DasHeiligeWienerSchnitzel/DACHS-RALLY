params ["_player","_vehicle"];

_actionID = _player addAction 
[ 
	"Am letzten Checkpoint neustarten", 
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"]; 
		_arguments params ["_oldVehicle"];
		if (_caller == _target) then {
			[_oldVehicle,_caller] remoteExecCall ["DACHS_fnc_resetOnLastCheckpoint", 2];
		};
	}, 
	[_vehicle], 
	1.5, 
	false, 
	false, 
	"", 
	"_this == _target", 
	-1, 
	false
];

_player setVariable ["CheckpointReset_ActionID", _actionID, true];