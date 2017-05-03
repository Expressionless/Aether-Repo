///draw_text_outline(x,y,string,xscale,yscale,angle,margin, Main Color, Outline Color);
var x1, y1, str, xscale, yscale, angle, margin, color1, color2
x1 = argument0;
y1 = argument1;
str = argument2;
xscale = argument3;
yscale = argument4;
angle = argument5;
margin = argument6;
color1 = argument7;
color2 = argument8

//Set Color to Outline Color
draw_set_color(color2);

//Right
for(i = 0; i < margin; i++) draw_text_transformed(x1+i,y1,str,xscale,yscale,angle);
//Left
for(i = 0; i < margin; i++) draw_text_transformed(x1+i,y1,str,xscale,yscale,angle);
//Top
for(i = 0; i < margin; i++) draw_text_transformed(x1+i,y1,str,xscale,yscale,angle);
//Bottom
for(i = 0; i < margin; i++) draw_text_transformed(x1+i,y1,str,xscale,yscale,angle);

//Top-Right
for(i = 0; i < margin; i++) draw_text_transformed(x1+i,y1-i,str,xscale,yscale,angle);
//Top-Left
for(i = 0; i < margin; i++) draw_text_transformed(x1-i,y1-i,str,xscale,yscale,angle);
//Bottom-Right
for(i = 0; i < margin; i++) draw_text_transformed(x1+i,y1+i,str,xscale,yscale,angle);
//Bottom-Left
for(i = 0; i < margin; i++) draw_text_transformed(x1-i,y1+i,str,xscale,yscale,angle);

//Set Main Color
draw_set_color(color1);
draw_text_transformed(x1,y1,str,xscale,yscale,angle);
