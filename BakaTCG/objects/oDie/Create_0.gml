type = irandom_range(1,8);
targetX = x-sprite_width-16;
targetY = y;
moveSpeed = 0.01;
hovered = false;
switch(type){
	case 0:
	image_blend = c_blue;
	break;
	case 1:
	image_blend = c_red;
	break;
	case 2:
	image_blend = c_green;
	break;
	case 3:
	image_blend = c_aqua;
	break;
	case 4:
	image_blend = c_orange;
	break;
	case 5:
	image_blend = c_purple;
	break;
	case 6:
	image_blend = c_maroon;
	break;
	case 7:
	image_blend = c_white;
}
