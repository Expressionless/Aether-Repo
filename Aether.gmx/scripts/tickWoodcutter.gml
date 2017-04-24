#define tickWoodcutter
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
    case state.move: WoodcutterMove();
    break;
    
    case state.action: WoodcutterAction();
    break;
    
    case state.idle:
        doAction = false;
        alarm[0] = -1;
        if(ActionAuto) {
            if(instance_exists(resource) && weight < capacity-5) {
                target = instance_nearest(workArea[0],workArea[1],resource);
                if(distance_to_point(target.x,target.y) >= 16 && locateTarget(workArea[0],workArea[1],target.x,target.y) <= workArea[2]) state = state.move;
                else if(locateTarget(workArea[0],workArea[1],target.x,target.y) <= workArea[2] && distance_to_point(target.x,target.y) <= 16) state = state.action;
            }
            else if (weight >= capacity-5) {
                state = state.move;
            }
        }
    break;
}

#define WoodcutterAction
if(target != noone && weight < capacity-5) {
    speed = 0;
    if(instance_exists(target)) {
        if(locateTarget(x,y,target.x,target.y) <= 16 && locateTarget(target.x,target.y,workArea[0],workArea[1]) <= workArea[2]) {
            if(doAction == false) {
                doAction = true;
                alarm[0] = actionSpeed*room_speed;
            }
            if(alarm[0] = -1 && doAction == true) {
                carriedItems[target.item, target.type] += target.amount;
                if(prof = prof.woodc) {
                    with(target) {
                        stump = instance_create(x,y,res_stump);
                        stump.type = type;
                        stump.image_xscale = image_xscale;
                        stump.image_yscale = image_yscale;
                        instance_destroy();
                    }
                } else 
                {
                    with(target) instance_destroy();
                
                }
                target = noone;
                state = state.move;
                doAction = false;
            }
        } else state = state.move;
    } else state = state.idle;
} else if (weight >= capacity-5) {
    state  = state.move;
}

#define WoodcutterMove
if(ActionAuto) {
    if(instance_exists(resource) && !(weight >= capacity-5)) {
        target = instance_nearest(workArea[0],workArea[1],resource);
        desx = target.x;
        desy = target.y;
        if(locateTarget(x,y,desx,desy) >= 16 && locateTarget(desx,desy,workArea[0],workArea[1]) <= workArea[2]) 
        {
            mp_potential_step_object(desx,desy,moveSpeed,village_parent);
        } 
        else if(locateTarget(x,y,desx,desy) <= 16 && locateTarget(desx,desy,workArea[0],workArea[1]) <= workArea[2]) 
        {
            desx = x;
            desy = y;
            state = state.action;
        } else if (locateTarget(desx,desy,workArea[0],workArea[1]) >= workArea[2]) state = state.idle;
    }  else if (weight >= capacity-5) {
        if(instance_exists(storage)) {
            target = instance_nearest(x,y,storage);
            desx = target.x;
            desy = target.y;
            if(locateTarget(x,y,desx,desy) <= 16) {
                mp_potential_step_object(desx,desx,moveSpeed,village_parent);
            } else {
                desx = x;
                desy = y;
            }
        } 
    } else state = state.idle;
} else state = state.idle;
