#define script13
if(ActionAuto && weight < capacity-5) {
    if(instance_exists(res_tree)) target = instance_nearest(x,y,res_tree);
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

switch(state) {
    case state.move: script15();
    break;
    
    case state.action: script14();
    break;
    
    case state.idle:
        if(ActionAuto) {
            if(instance_exists(res_tree) && weight < capacity-5) {
                target = instance_nearest(x,y,res_tree);
                if(distance_to_point(target.x,target.y) >= 16) state = state.move;
                else state = state.action;
            }
            else if (weight >= capacity-5) {
                if(instance_exists(storage_wood)) {
                    target = instance_nearest(x,y,storage_wood);
                    mp_potential_step(target.x,target.y,moveSpeed,1);
                }
            }
        }
    break;
}

#define script14
if(target != noone && weight < capacity-5) {
    speed = 0;
    if(instance_exists(target)) {
        if(distance_to_point(target.x,target.y) <= 16 ) {
            if(doAction == false) {
                doAction = true;
                alarm[0] = actionSpeed*room_speed;
            }
            if(alarm[0] = -1 && doAction == true) {
                carriedItems[res.wood, target.type] += target.amount;
                with(target) {
                    stump = instance_create(x,y,res_stump);
                    stump.type = type;
                    stump.image_xscale = image_xscale;
                    stump.image_yscale = image_yscale;
                    instance_destroy();
                }
                target = noone;
                state = state.move;
                doAction = false;
            }
        } else state = state.idle;
    } else state = state.idle;
} else state = state.idle;

#define script15
if(ActionAuto) {
    if(instance_exists(res_tree)) {
        target = instance_nearest(x,y,res_tree);
        if(distance_to_point(target.x,target.y) >= 16) {
            move_towards_point(target.x,target.y,moveSpeed);
        } else state = state.action;
    } else state = state.idle;
} else state = state.idle;