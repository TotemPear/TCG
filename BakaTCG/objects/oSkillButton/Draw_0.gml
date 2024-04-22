if (hovered){
	image_alpha = 1;
} else{
	image_alpha = 0.8;
}
draw_self();

var _y = y+sprite_height+8;

if (cost1 > 0){
	if (cost2 > 0){ // BOTH
		var _x = x + sprite_width/2 - sprite_get_width(sDiceColoured)*0.75 - 4;
		draw_sprite_ext(sDiceColoured,0,_x,_y,0.75,0.75,image_angle,global.elementColours[type],image_alpha);
		
		scribble($"[fa_middle][fa_center][c_white][fSmall]{cost1}").draw(_x+sprite_get_width(sDiceColoured)*0.75/2,_y+sprite_get_height(sDiceColoured)*0.75/2);
		
		var _x = x + sprite_width/2+4;
		draw_sprite_ext(sDiceAny,0,_x,_y,0.75,0.75,image_angle,image_blend,image_alpha);
		
		scribble($"[fa_middle][fa_center][c_white][fSmall]{cost1}").draw(_x+sprite_get_width(sDiceAny)*0.75/2,_y+sprite_get_height(sDiceColoured)*0.75/2);

	} else{ // ONLY ELEMENTAL
		var _x = x+sprite_width/2-sprite_get_width(sDiceColoured)*0.75/2;
		draw_sprite_ext(sDiceColoured,0,_x,_y,0.75,0.75,image_angle,global.elementColours[type],image_alpha);
	}
} else if (cost2 > 0){ // ONLY BLACK
	var _x = x+sprite_width/2-sprite_get_width(sDiceAny)*0.75/2;
	draw_sprite_ext(sDiceAny,0,_x,_y,0.75,0.75,image_angle,image_blend,image_alpha);
}