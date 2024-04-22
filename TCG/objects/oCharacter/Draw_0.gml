draw_set_color(c_white);
<<<<<<< Updated upstream:TCG/objects/oCharacter/Draw_0.gml
draw_sprite_ext(cardSpriteIndex,cardImageIndex,x+spriteOffsetX,y+spriteOffsetY+z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
=======
draw_sprite_ext(cardSpriteIndex,cardImageIndex,x+spriteOffsetX,y+spriteOffsetY+z,image_xscale,image_yscale,image_angle,cardColor,image_alpha);
draw_sprite_ext(cardEIcon,0,x+spriteOffsetX+sprite_get_width(cardSpriteIndex)*image_xscale-2-sprite_get_width(cardEIcon)*image_xscale,y+spriteOffsetY+z+2,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
>>>>>>> Stashed changes:BakaTCG/objects/oCharacter/Draw_0.gml
draw_set_color(cardColor);
draw_sprite_ext(sprite_index,image_index,x,y+z,image_xscale,image_yscale,image_angle,c_yellow,image_alpha);
var scribble_object = scribble($"[fa_center][fa_middle][fBig]{name}");
scribble_object.wrap(sprite_width*image_xscale-8);
scribble_object.blend(c_black,image_alpha/1.5);
scribble_object.draw(x+sprite_width/2+image_xscale,y+z+sprite_height/2+image_yscale);
scribble_object.blend(c_white,image_alpha);
scribble_object.draw(x+sprite_width/2-image_xscale,y+z+sprite_height/2-image_yscale);

if (!hovered) && (!selected){
	draw_sprite_ext(sCardFull,0,x,y+z,image_xscale,image_yscale,image_angle,c_white,image_alpha/12);
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
scribble($"[fa_center][fa_middle][c_white][fSmall]{hp}").draw(x+_circleX,y+z+_circleY);
if (!hovered) && (!selected){
	draw_set_color(c_black);
	draw_set_alpha(image_alpha/12);
	draw_circle(x+_circleX,y+z+_circleY,_circleRadius,false);
}
draw_set_alpha(1);
if (selected){
	// Variables
	var xx = 10
	var yy = 10
	var _boxXScale = 13;
	var _boxYScale = 18;
	draw_sprite_ext(sBox,0,xx,yy,_boxXScale,_boxYScale,0,cardColor,0.85);
	
	// Box
	draw_set_color(cardColor);
	draw_set_alpha(1);
	draw_sprite(cardSpriteIndex,cardImageIndex,xx+spriteOffsetX+10,yy+spriteOffsetY+10);
	
	// Card Sprite
	draw_set_color(c_white);
	draw_sprite(sprite_index,image_index,xx+10,yy+10);
	
	// Card HP
	var _circleRadius = 12
	var _circleX = _circleRadius/8;
	var _circleY = _circleRadius/2;
	draw_set_color(c_black);
	draw_circle(xx+10+_circleX,yy+10+_circleY,_circleRadius,false);
	draw_set_color(c_white);
	draw_circle(xx+10+_circleX,yy+10+_circleY,_circleRadius,true);
	scribble($"[fa_center][fa_middle][c_white][fSmall]{hp}").draw(xx+10+_circleX,yy+10+_circleY);
	
	// Card Name
	scribble($"[fa_left][fa_top][c_amaranth][fBig]{name}").draw(xx+10,yy+sprite_height+20);
	
	// Card Signature
	scribble($"[fLight][#fff0db]\"{signature}\"").draw(xx+10,yy+sprite_height+45);
	
	// Card Description
	var scribble_object = scribble($"[/c]{description}");
	scribble_object.wrap(sprite_get_width(sBox)*15-16);
	scribble_object.draw(xx+10,yy+sprite_height+65);
	
	// Card Element
	scribble($"[alpha,0.5][fLight]{typeString} element").draw(xx+sprite_width+20,yy+10)
	
	// Skills
	var _skillYScale = 3;
	var _skillY = yy+sprite_get_height(sBox)*_boxYScale-sprite_get_height(sSkillBox)*_skillYScale*3-8;
	var _skillXOffset = 12;
	
	var _skillButtonOffset = 8 + 8;
	var _skillButtonX = room_width - skills[2].sprite_width - skills[1].sprite_width - skills[0].sprite_width;
	if (instance_exists(oDie)) {
		_skillButtonX -= room_width - oDie.x + 20;
	}
	for(var i = 0; i < 3; i++){
		// Variables
		var _skillY = yy+sprite_get_height(sBox)*_boxYScale-sprite_get_height(sSkillBox)*_skillYScale*3-8+((sprite_get_height(sSkillBox)*_skillYScale+4)*i);
		var _imageIndex = i == 2

		// Skill Boxes
		draw_sprite_ext(sSkillBox,_imageIndex,xx,_skillY,_boxXScale,_skillYScale,0,cardColor,0.95);
		
		// Skill Icon
		var _yCenter = _skillY+sprite_get_height(sSkillBox)*_skillYScale/2;
		draw_sprite_ext(skills[i].sprite_index,skills[i].image_index,xx+_skillXOffset,_yCenter-skills[i].sprite_height/2,skills[i].image_xscale,skills[i].image_yscale,skills[i].image_angle,skills[i].image_blend,skills[i].image_alpha);
		//do_animation("skills[i].image_index","skills[i].image_speed","skills[i].image_timer","skills[i].image_number");
		
		// Skill Name
		var scribble_object = scribble("[c_yellow][fDefault]"+skills[i].name);
		var _nameX = xx + _skillXOffset*2 + skills[i].sprite_width;
		var _nameY = _skillY+4;
		scribble_object.align(fa_left,fa_top);
		scribble_object.wrap((sprite_get_width(sBox)*_boxXScale+xx) - (_nameX));
		scribble_object.draw(_nameX,_nameY);
		
		// Skill Description
		var _desc = skills[i].description;
		if (skills[i].dmg > 0){
			_desc += $", dealing [c_red]{skills[i].dmg} DMG[/c]"; 
			_desc += skills[i].aoe == true ? " to [c_red]all enemies[/c]." : " to them.";
		} else{
			_desc += "[/c].";
		}
		var scribble_object = scribble($"[alpha,0.9]{_desc}");
		var _descX = _nameX
		var _descY = _nameY + string_height_scribble("[fDefault]"+skills[i].name)+32;
		scribble_object.align(fa_left,fa_center);
		scribble_object.wrap((sprite_get_width(sBox)*_boxXScale+xx) - (_descX)- _skillXOffset);
		scribble_object.draw(_descX, _descY);
		
		// Actual Skill Buttons
		if (!enemy){
			if(i != 0) _skillButtonX += skills[i-1].sprite_width + _skillButtonOffset;
		
			if (instance_exists(oSkillButton)) && (i == 0) global.skillsShown = true;
			if (!instance_exists(oSkillButton)) || (!global.skillsShown) {
				variable_instance_set(
					id,
					$"button{i}",
					instance_create_layer(
						_skillButtonX - skills[i].sprite_width/2,
						room_height-_skillButtonOffset-skills[i].sprite_height-sprite_get_height(sDiceColoured),
						"GUI",
						oSkillButton,
						{
							characterID : id,
							skillID : i,
						})); 
			} else if (i == 0) {
				button0.x = _skillButtonX - button0.sprite_width/2;
			} else if (i == 1) button1.x = _skillButtonX - button1.sprite_width/2;
			else button2.x = _skillButtonX - button2.sprite_width/2;
		}
		
		// COPY
		
		//if (instance_exists(oSkillButton)) && (i == 0) global.skillsShown = true;
		//if (!instance_exists(oSkillButton)) variable_instance_set(id,$"button{i}",instance_create_layer(_skillButtonX,room_height-_skillButtonOffset-skills[i].sprite_width*skills[i].image_xscale,"GUI",oSkillButton,{characterID : id, skillID : i, x : _skillButtonX}));
		//else if (!global.skillsShown) variable_instance_set(id,$"button{i}",instance_create_layer(_skillButtonX,room_height-_skillButtonOffset-skills[i].sprite_width*skills[i].image_xscale,"GUI",oSkillButton,{characterID : id, skillID : i, x : _skillButtonX}));
		//else if (i == 0) {
		//	show_debug_message(button0.x);
		//	button0.x = _skillButtonX - button0.sprite_width*button0.image_xscale/2;
		//	show_debug_message(button0.x);
		//} else if (i == 1) button1.x = _skillButtonX - button1.sprite_width*button1.image_xscale/2;
		//else button2.x = _skillButtonX - button2.sprite_width*button2.image_xscale/2;
		
	}
}




