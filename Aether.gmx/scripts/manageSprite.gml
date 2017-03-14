#define manageSprite
///manageSprite(prof)

/* PROFESSION LIST
* prof.miner = Miner
* prof.woodc = Woodcutter
* prof.builder = Builder
* prof.basic = Basic (Unemployed/Unoccupied)
* prof.farmer = Farmer
*/

var prof = argument0;
switch (prof) {

    //Woodcutter
    case prof.woodc: 
        sprW();
    break;
    
    //Miner
    case prof.miner: sprM();
    break;
    
    //Builder
    case prof.builder: sprBu();
    break;
    
    //Basic
    case prof.basic: sprBa();
    break;
    //Farmer
    case prof.farmer: sprF();
    break;
}

#define sprW
///sprW(Local Script!!)
if(state == state.idle) 
{  
    image_index = 0;
    image_speed = 0;
    if(!sprite_exists(idleSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = idleSprite;
} 
else if(state == state.move) 
{
    image_speed = 1/moveSpeed;
    if(!sprite_exists(moveSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = moveSprite;
}
else if(state == state.action)
{
    if(!sprite_exists(actionSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = actionSprite;
} else {
    sprite_index = missingTexture;
}

#define sprM
///sprM(Local Script!!)
if(state == state.idle) 
{  
    image_index = 0;
    image_speed = 0;
    if(!sprite_exists(idleSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = idleSprite;
} 
else if(state == state.move) 
{
    image_speed = 1/moveSpeed;
    if(!sprite_exists(moveSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = moveSprite;
}
else if(state == state.action)
{
    if(!sprite_exists(actionSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = actionSprite;
} else {
    sprite_index = missingTexture;
}

#define sprBu
///sprBu(Local Script!!)
if(state == state.idle) 
{  
    image_index = 0;
    image_speed = 0;
    if(!sprite_exists(idleSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = idleSprite;
} 
else if(state == state.move) 
{
    image_speed = 1/moveSpeed;
    if(!sprite_exists(moveSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = moveSprite;
}
else if(state == state.action)
{
    if(!sprite_exists(actionSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = actionSprite;
} else {
    sprite_index = missingTexture;
}

#define sprBa
///sprBa(Local Script!!)
if(state == state.idle) 
{  
    image_index = 0;
    image_speed = 0;
    if(!sprite_exists(idleSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = idleSprite;
} 
else if(state == state.move) 
{
    image_speed = 1/moveSpeed;
    if(!sprite_exists(moveSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = moveSprite;
}
else if(state == state.action)
{
    if(!sprite_exists(actionSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = actionSprite;
} else {
    sprite_index = missingTexture;
}

#define sprF
///sprF(Local Script!!)
if(state == state.idle) 
{  
    image_index = 0;
    image_speed = 0;
    if(!sprite_exists(idleSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = idleSprite;
} 
else if(state == state.move) 
{
    image_speed = 1/moveSpeed;
    if(!sprite_exists(moveSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = moveSprite;
}
else if(state == state.action)
{
    if(!sprite_exists(actionSprite)) {
        sprite_index = missingTexture;
    } else sprite_index = actionSprite;
} else {
    sprite_index = missingTexture;
}
