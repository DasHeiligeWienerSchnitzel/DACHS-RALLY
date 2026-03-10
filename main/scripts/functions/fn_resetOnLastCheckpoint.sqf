params ["_vehicle","_caller"];
if (isNull _caller) exitWith {};

//[_oldVehicle] remoteExecCall ["deleteVehicle", owner _oldVehicle];

_uid = getPlayerUID _caller;
_next = RALLY_CP_BYUID getOrDefault [_uid, 1];
_lastPassed = (_next - 1) max 1;

private _checkpoint = missionNamespace getVariable [format ["reset_%1", _lastPassed], objNull];
if (isNull _checkpoint) exitWith {
    [format ["Reset point reset_%1 not found", _lastPassed]] remoteExecCall ["systemChat", owner _caller];
};

//_vehicle = "C_Hatchback_01_sport_F" createVehicle (getPosATL _checkpoint);
_vehicle setDir (getDir _checkpoint);
_vehicle setPosATL (getPosATL _checkpoint);
//_vehicle setPlateNumber (name _caller);

[_caller,_vehicle] remoteExecCall ["moveInDriver", owner _caller];