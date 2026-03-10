params ["_player"];

_player addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    _actionID = _unit getVariable ["CheckpointReset_ActionID",0];
	_unit removeAction _actionID;
	systemChat format ["%1 , %2",_unit,_actionID];
}];
