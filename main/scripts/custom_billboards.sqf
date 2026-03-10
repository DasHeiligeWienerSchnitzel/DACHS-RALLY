_textures = [
    "images\bobiwasser.paa",
    "images\dawnshine.paa",
	"images\flag_dachs.paa",
	"images\HD1.paa",
	"images\HD2.paa",
	"images\MC.paa",
	"images\MH_EnergyDrink.paa",
	"images\MH_EnergyDrink2.paa",
	"images\MH_EnergyDrink3.paa",
	"images\Tarvkov.paa"
];

for "_index" from 1 to count _textures do {
	_billboard = missionNamespace getVariable [format ["bb_%1", _index], objNull];
	_randomTexture = selectRandom _textures;
	_billboard setObjectTextureGlobal [0, _randomTexture];
};