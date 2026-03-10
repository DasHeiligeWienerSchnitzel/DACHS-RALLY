params ["_vehicleSpawner"];

_vehicleSpawner addAction 
[ 
	"Fahrzeug spawnen", 
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"]; 
		_vehicle = "C_Hatchback_01_sport_F" createVehicle position vehicle_spawnpoint;
		_vehicle setDir getDir vehicle_spawnpoint;
		_vehicle setPlateNumber name _caller;
		_vehicle allowDamage false;
		_caller moveInDriver _vehicle;
		_caller setVariable ["oldVehicle",_vehicle,true];
		[_caller,_vehicle] execVM "scripts\resetAction.sqf";
	}, 
	nil, 
	1.5, 
	true, 
	true, 
	"", 
	"true", 
	5, 
	false, 
	"", 
	"" 
];

_vehicleSpawner setObjectTexture [0, "#(rgb,512,512,3)text(1,1,""RobotoCondensed"",0.18,""#FFFFFFFF"",""#000000FF"",""Fahrzeug spawnen"")"];