///drawHud(x1,y1,x2,y2, margin, alpha)
var r = 90, g = 90, b = 90; //Colored: 237 233 171

var col1 = make_color_rgb(r,g,b);
var col2 = make_color_rgb(r-60,g-60,b-60);

var margin = 300;
var x1,y1,x2,y1;

//Set X And Y Coordinates for the HUD
x1 = argument0;
y1 = argument1;
x2 = argument2; 
y2 = argument3;

var margin = argument4;
draw_set_alpha(argument5);
draw_set_color(col2);
draw_roundrect(x1,y1,x2,y2,0);
draw_set_alpha(argument5-.3);
draw_set_color(col1);
draw_roundrect(x1+margin,y1+margin,x2-margin,y2-margin,0);
draw_set_alpha(1);

