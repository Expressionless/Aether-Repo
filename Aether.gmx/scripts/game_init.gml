#define game_init
configSettings();
initGlobals();
defineKeys();
itemList();
initStorage();
globalvar RES_WIDTH,RES_HEIGHT;
RES_WIDTH = 1280;
RES_HEIGHT = 720;

#define configSettings
///configSettings()
enum fs {
    windowed,
    fullscreen
}
globalvar FULLSCREEN;
FULLSCREEN = fs.windowed;
window_set_fullscreen(FULLSCREEN);
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

//Define the Tree Spawn Time
globalvar TREE_SPAWN_TIME;
//15*60*room_speed;
TREE_SPAWN_TIME = 3*room_speed;

//Define Selected Villager Variable
globalvar SELECTED_VILLAGER;
SELECTED_VILLAGER = -1;

//Define Missing Texture File
globalvar missingTexture;
missingTexture = missingTex;

globalvar PAUSED;
PAUSED = false;

#define defineKeys
enum key {
    paused
}
global.key[key.paused] = vk_escape;

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
var i = argument0; //Item ID
var v = argument1; //Variance (True/False)
var vA = argument2; //Variance Amount (0 if Variance = false)
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