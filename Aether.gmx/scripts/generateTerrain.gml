///generateTerrain(type)
//Set Object
doodad[0, 0] = res_tree;
//Set Amount per 'Chunk'
doodad[0, 1] = choose(2, 4, 6);

doodad[1, 0] = res_stone;
doodad[1, 1] = choose(4, 6, 8);

//Set Chunk Size
chunkWidth = 1000;
chunkHeight = 1000;
chunkCount[0] = room_width/chunkWidth;
chunkCount[1] = room_height/chunkHeight;
var i, j, c1, c2;
for(c1 = 0; c1 < ceil(chunkCount[0]); c1++) {
    for(c2 = 0; c2 < ceil(chunkCount[1]); c2++) {
        for(i = 0; i < array_height_2d(doodad); i++) {
            for(j = 0; j < doodad[i, 1]; j++) {
                var xx = round(random(chunkWidth))+c1*chunkWidth;
                var yy = round(random(chunkHeight))+c2*chunkHeight;
                var obj = instance_create(xx,yy, doodad[i, 0]);
            }
        }
    }
}
