#define villagerTick
switch(global.prof[prof, type]) 
{
    case profType.collect:
        villagerCollect(prof);
    break;
    
    default: //Idle State without State Checkers
        desx = x;
        desy = y;
        doAction = false;
        alarm[0] = -1;
        if (weight >= capacity-5) {
            state = state.move;
        } 
        if(!ActionAuto) {
            if(mouse_check_button_pressed(mb_right) && SELECTED_VILLAGER == id) {
                desx = mouse_x;
                desy = mouse_y;
                desIsTarget = false;
                state = state.move;
            }
        }
    break;
}

#define villagerCollect
///villagerCollect(prof)
/* PROFESSION LIST
* prof.miner = Miner
* prof.woodc = Woodcutter
* prof.builder = Builder
* prof.basic = Basic (Unemployed/Unoccupied)
* prof.farmer = Farmer
*/

/* SUDO Code
* If Villager is idle, then tickIdle
* else check the profession of the villager and
* run the related tick event for the profession
* implementation of prioritised actions needed later. 
*
*/
var p = argument0;

if(weight < capacity -5) villagerStates();
else {
    if(instance_exists(storage)) {
        target = instance_nearest(x,y, storage);
        desx = target.x;
        desy = target.y;
        move_towards_point(desx,desy,moveSpeed);
        if(distance_to_object(target) < 24) {
            for(i = 0; i < array_height_2d(carriedItems);i++) {
                for(b = 0; b < array_length_2d(carriedItems,i);b++) {
                    global.storage[i, b] += carriedItems[i, b];
                    carriedItems[i, b] = 0;
                }
            }
        }
    //Count Weight
    var b;
    total = 0;
        for(i = 0; i < array_height_2d(carriedItems);i++) {
            for(b = 0; b < array_length_2d(carriedItems,i);b++) {
               total += carriedItems[i, b];
            }
        }
    weight = total;
    }
}
manageSprite(prof);
