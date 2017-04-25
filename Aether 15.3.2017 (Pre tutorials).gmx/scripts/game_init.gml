#define game_init
initGlobals();
initStorage();

#define initGlobals
enum prof {
    miner = VillagerMiner,
    woodc = VillagerWoodcutter,
    builder = VillagerBuilder,
    basic = VillagerBasic,
    farmer = VillagerFarmer
}
enum mstate {
    menu,
    selecting,
    building,
    modifying
}
enum mSprite {
    building = MouseBuilding,
    selecting = MouseSelecting,
    menu = MouseMenu
}

enum state {
    idle,
    move,
    action
}
globalvar TREE_SPAWN_TIME;
TREE_SPAWN_TIME = 12*60*room_speed;
globalvar SELECTED_VILLAGER;
SELECTED_VILLAGER = -1;
globalvar missingTexture;
missingTexture = missingTex;

#define itemList
enum res {
    wood = 0,
    stone = 1,
}

//Init parameters
enum IC {
    Variant,
    vA
}

globalvar ITEM_COUNT;
ITEM_COUNT = 2;

for(var ic = 0; ic < ITEM_COUNT; ic++) {
    for(var j = 0; j < 2; j++ ) {
        global.ITEM[ic, j] = 0;
    }
}
initItem(res.wood, true, 3); //Initialize wood w/ Variance, & 3 different variants
initItem(res.stone, false, 0); //Initialize stone w/o Variance

#define initItem
///initItem(id, variant, variantAmount)
var i = argument0;
var v = argument1;
var vA = argument2;
global.ITEM[i, IC.Variant] = v;
if(v) {
    global.ITEM[i, IC.vA] = vA;
} else global.ITEM[i, IC.vA] = 0;
#define initStorage
enum storage {
    minerals,
    wood,
    food,
}
for(i = 0; i < 10; i++) {
    global.storage[storage.minerals, i] = 0;
    global.storage[storage.wood, i] = 0;
    global.storage[storage.food, i] = 0;
}