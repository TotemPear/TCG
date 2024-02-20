draw_sprite_ext(cardSpriteIndex,cardImageIndex,x+spriteOffsetX,y+spriteOffsetY+z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y+z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
var scribble_object = scribble($"[fa_center][fa_middle][fBig]{name}");
scribble_object.wrap(sprite_width*image_xscale-8);
scribble_object.blend(c_black,image_alpha);
scribble_object.draw(x+sprite_width/2+image_xscale,y+z+sprite_height/2+image_yscale);
scribble_object.blend(c_white,image_alpha);
scribble_object.draw(x+sprite_width/2-image_xscale,y+z+sprite_height/2-image_yscale);

if (!hovered) && (!selected){
	draw_sprite_ext(sCardFull,0,x,y+z,image_xscale,image_yscale,image_angle,c_white,image_alpha/4);
}

var _circleRadius = (image_xscale+image_yscale)/2*12;
var _circleX = _circleRadius/8;
var _circleY = _circleRadius/2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_circle(x+_circleX,y+z+_circleY,_circleRadius,false);
draw_set_color(c_white);
draw_circle(x+_circleX,y+z+_circleY,_circleRadius,true);
scribble($"[fa_center][fa_middle][c_white][fSmall]{cost}").draw(x+_circleX,y+z+_circleY);
if (!hovered) && (!selected){
	draw_set_color(c_black);
	draw_set_alpha(image_alpha/4);
	draw_circle(x+_circleX,y+z+_circleY,_circleRadius,false);
}
draw_set_alpha(1);

if (selected){
	var xx = 10
	var yy = 10
	var _boxXScale = 13;
	var _boxYScale = 10;
	draw_sprite_ext(sBox,0,xx,yy,_boxXScale,_boxYScale,0,c_white,0.9);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_sprite(cardSpriteIndex,cardImageIndex,xx+spriteOffsetX+10,yy+spriteOffsetY+10);
	draw_sprite(sprite_index,image_index,xx+10,yy+10);
	
	var _circleRadius = 12
	var _circleX = _circleRadius/8;
	var _circleY = _circleRadius/2;
	draw_set_color(c_black);
	draw_circle(xx+10+_circleX,yy+10+_circleY,_circleRadius,false);
	draw_set_color(c_white);
	draw_circle(xx+10+_circleX,yy+10+_circleY,_circleRadius,true);
	scribble($"[fa_center][fa_middle][c_white][fSmall]{cost}").draw(xx+10+_circleX,yy+10+_circleY);
	
	if (type == "[rainbow]Legendary"){
		scribble($"[fa_left][fa_top][fBig][wave]{name}").draw(xx+10,yy+sprite_height+20);
	} else {
		scribble($"[fa_left][fa_top][c_amaranth][fBig]{name}").draw(xx+10,yy+sprite_height+20);
	}
	var scribble_object = scribble($"[/c]{description}");
	scribble_object.wrap(sprite_get_width(sBox)*_boxXScale-16);
	scribble_object.draw(xx+10,yy+sprite_height+50);
	
	scribble($"[alpha,0.5][fSmall]{type} card").draw(xx+sprite_width+20,yy+10)
}