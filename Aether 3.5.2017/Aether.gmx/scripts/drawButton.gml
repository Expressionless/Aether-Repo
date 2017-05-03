///drawButton(x,y,width,height,text,ScaleToButton, Scale Ratio X, Scale Ratio Y)
var xx = argument0;
var yy = argument1;
var width = argument2;
var height = argument3;
var text = argument4;
var ScaleToButton = argument5;
var xR = argument6;
var yR = argument7;

//Set Color Of Button
draw_set_color(c_black);
//Draw Text scaled to button
if(ScaleToButton) {
    draw_rectangle(xx,yy,xx+width,yy+height,0);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text_transformed(xx+width/2,yy+height/8,text,xR,yR,image_angle);
}
else 
{
    //Draw Button
    draw_rectangle(xx,yy,xx+width,yy+height,0);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(xx+width/2,yy+height/8,text);
}
