#define initVillagerProfessions
///initVillagerProfessions()
globalvar PROF_COUNT;
PROF_COUNT = 5;
for(i = 0; i < PROF_COUNT; i++) {
    for(var j = 0; j < 2; j++) {
        global.prof[i, j] = 0;
    }
}
initProf(prof.miner, workType.collect); //Initialize Miner with the Collect Script
initProf(prof.woodc, workType.collect); //Initialize Woodcutter with the Collect Script
initProf(prof.builder, workType.build); //Initialize Builder with the Build Script
initProf(prof.basic, workType.null); //Initialize Basic with the Idle Script
initProf(prof.farmer, workType.mill); //Initialize Farmer with the Mill (Farm) Script

#define initProf
///initProf(id, Profession Type)
var i = argument0; //Profession ID
var type = argument1; //Type (Collect, Mill, Defend)
global.prof[i, 0] = type;
/*
enum prof {
    miner = VillagerMiner,
    woodc = VillagerWoodcutter,
    builder = VillagerBuilder,
    basic = VillagerBasic,
    farmer = VillagerFarmer
}