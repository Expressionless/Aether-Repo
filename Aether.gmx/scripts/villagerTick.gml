    ///villagerTick(prof)
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
//if(state == state.idle) tickIdle();
//else
//{
    /*switch(p) {
        
        case prof.miner: tickMiner();
        break;
        
        case prof.woodc: 
            if(weight < capacity -5) tickWoodcutter();
            else {
                target = instance_nearest(x,y, storage_wood);
                move_towards_point(target.x,target.y,moveSpeed);
                if(distance_to_object(target) < 24) {
                    for(i = 0; i < array_height_2d(carriedItems);i++) {
                        for(b = 0; b < array_length_2d(carriedItems,i);b++) {
                            global.storage[i, b] += carriedItems[i, b];
                            carriedItems[i, b] = 0;
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
        break;
        
        case prof.builder: tickBuilder();
        break;
        
        case prof.basic: tickBasic();
        break;
        
        case prof.farmer: tickFarmer();
        break;
    
    }*/
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
//}
