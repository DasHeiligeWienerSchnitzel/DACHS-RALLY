params ["_thisList","_thisTrigger"];
//if (!isServer) exitWith {}; 

{
	_obj = _x;
	_player = objNull;
	
	if (_obj isKindOf "Man") then {
		_player = _obj;
	} else {
		_player = driver _obj;
	};
	
	if (!isNull _player && {isPlayer _player}) then {
		_uid = getPlayerUID _player;
		_expected = RALLY_CP_BYUID getOrDefault [_uid, 1];

		_cpid = parseNumber (((str _thisTrigger) splitString "_") select -1);
		_vehicle = vehicle _player;

		[_vehicle,0] remoteExecCall ["setDamage", owner _vehicle];
		[_vehicle,1] remoteExecCall ["setFuel", owner _vehicle];

		if (_cpid == _expected) then {
			playSoundUI ["FD_CP_Clear_F",4];
			_new = _expected + 1;
			RALLY_CP_BYUID set [_uid, _new];
			_player setVariable ["CheckpointPassed",true];
			[format ["%1 hat Checkpoint %2 passiert",name _player,_new - 1]] remoteExecCall ["systemChat",0];
		}else{
			playSoundUI ["FD_Course_Active_F",4]
		};
	};
}forEach _thisList;

publicVariable "RALLY_CP_BYUID";