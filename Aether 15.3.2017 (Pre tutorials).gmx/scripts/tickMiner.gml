#define tickMiner
//Count Weight
var b;
total = 0;
for(i = 0; i < array_height_2d(carriedItems);i++) {
    for(b = 0; b < array_length_2d(carriedItems,i);b++) {
       total += carriedItems[i, b];
    }
}
weight = total;

//Check state
switch(state) {
    case state.move: MinerMove();
    break;
    
    case state.action: MinerAction();
    break;
    
    case state.idle:
        doAction = false;
        alarm[0] = -1;
        if(ActionAuto) {
            if(instance_exists(res_stone) && weight < capacity-5) {
                target = instance_nearest(workArea[0],workArea[1],res_stone);
                if(distance_to_point(target.x,target.y) >= 16 && locateTarget(workArea[0],workArea[1],target.x,target.y) <= workArea[2]) state = state.move;
                else if(locateTarget(workArea[0],workArea[1],target.x,target.y) <= workArea[2] && distance_to_point(target.x,target.y) <= 16) state = state.action;
            }
            else if (weight >= capacity-5) {
                if(instance_exists(storage_stone)) {
                    target = instance_nearest(x,y,storage_stone);
                    mp_potential_step(target.x,target.y,moveSpeed,1);
                }
            }
        }
    break;
}

#define MinerAction
if(target != noone && weight < capacity-5) {
    speed = 0;
    if(instance_exists(target)) {
        if(locateTarget(x,y,target.x,target.y) <= 16 && locateTarget(target.x,target.y,workArea[0],workArea[1]) <= workArea[2]) {
            if(doAction == false) {
                doAction = true;
                alarm[0] = actionSpeed*room_speed;
            }
            if(alarm[0] = -1 && doAction == true) {
                carriedItems[res.stone, target.type] += target.amount;
                with(target) {
                    instance_destroy();
                }
                target = noone;
                state = state.move;
                doAction = false;
            }
        } else state = state.move;
    } else state = state.idle;
} else if (weight >= capacity-5) {
    if(instance_exists(storage_stone)) {
        target = instance_nearest(x,y,storage_stone);
        mp_potential_step(target.x,target.y,moveSpeed,1);
    }
}

#define MinerMove
if(ActionAuto) {
    if(instance_exists(res_stone)) {
        target = instance_nearest(workArea[0],workArea[1],res_stone);
        if(locateTarget(x,y,target.x,target.y) >= 16 && locateTarget(target.x,target.y,workArea[0],workArea[1]) <= workArea[2]) 
        {
            mp_potential_step_object(target.x,target.y,moveSpeed,village_parent);
        } 
        else if(locateTarget(x,y,target.x,target.y) <= 16 && locateTarget(target.x,target.y,workArea[0],workArea[1]) <= workArea[2]) 
        {
            state = state.action;
        } else if (locateTarget(target.x,target.y,workArea[0],workArea[1]) >= workArea[2]) state = state.idle;
    } else state = state.idle;
} else state = state.idle;