#define villager_init
///villager_init(class)

//Set Depth
depth = y * -1;

prof_sprite = argument0;
prof = argument0;
sprite_index = prof_sprite;
direction = 0;
state = state.idle;
moveSpeed = 3;
doAction = false;
target = noone;
//Local Scripts
statInit(prof);
villagerOptions();

for(i = 0; i < array_height_2d(global.ITEM); i++) {
    for(j = 0; j < array_length_2d(global.ITEM, i); j++) 
    {
        if(global.ITEM[i, IC.Variant] == true) {
            carriedItems[i, global.ITEM[i, IC.vA]] = 0;
        } else carriedItems[i, 0] = 0;
    }
}

#define statInit
///statInit(prof)
/*
* Strength
* Dexterity
* proficiency[i] (i = numberOfClasses)
* 
*/
prof = argument0;
switch(prof) {
    case prof.woodc:
        actionSpeed = 1.5;
        resource = res_tree;
        storage = storage_wood;
    break;
    
    case prof.miner:
        actionSpeed = 4;
        resource = res_stone;
        storage = storage_stone;
    break;
    
    default:
       actionSpeed = 1.5;
       resource = noone;
       storage = storage_food;
    break;
}
workArea[0] = x;
workArea[1] = y;
workArea[2] = 256;
capacity = 35;
weight = 0;


idleSprite = argument0;;
moveSprite = argument0;
actionSprite = argument0;

#define villagerOptions
ActionAuto = true;