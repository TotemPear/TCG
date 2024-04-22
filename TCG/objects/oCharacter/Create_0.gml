z = 0;
hoverable = false;
hovered = false;
selectable = false;
selected = false;
targetX = x;
targetY = y;
targetZ = z;
moveSpeed = 0.05;
startDepth = depth;
spriteOffsetX = 1;
spriteOffsetY = 1;
usingSkill = -1;
skillProgress = 0;

cardPositionCenter = 0;
cardPositionCenter = room_width/2;
maxWidth = sprite_width*4;


cardSpriteIndex = sCardDefault;
cardImageIndex = 0;
cardImageSpeed = 0;
hp = 10;
name = "Default Name";
type = 0;
description = "Default Description";
signature = "Default Signature"
skills = {name : "Default Skill", description : "Default Description"};
switch(cardID){
	case CHARACTER.SOLOMON:
	name = "Solomon";
	type = ELEMENT.BOZO;
	description = "A massive bozo.";
	signature = "Suck it u stupid midget";
	sprite_index = sprite_index;
	skills = [
		{
			name : "Cock Slap",
			description : $"[c_amaranth]{name}[/c] uses his massive 13\" cock to slap the [c_red]enemy[/c] in their face",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Twerk",
			description : "He fucking twerks his level 10 ass all around the [c_red]enemies[/c] bodies",
			cost1 : 3,
			dmg : 2,
			aoe : true,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Stare Down",
			description : "Stares, with his beautiful gaze into the [c_red]enemies[/c] eyes, making them [#FF007F]horny[/c]. They are [c_aqua]unable to play for 3 turns",
			cost1 : 2,
			charge : 3,
			image_xscale : 2,
			image_yscale : 2
		}
	];
	break;
	case CHARACTER.CHARLES:
	name = "Charles";
	type = ELEMENT.DUMBASS;
	description = description;
	signature = signature;
	sprite_index = sprite_index;
	skills = [
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		}
	];
	break;
	case CHARACTER.ABBY:
	name = "Abby";
	type = ELEMENT.e4;
	description = "Bozo";
	signature = "Okay first of all no";
	sprite_index = sprite_index;
	skills = [
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		}
	];
	break;
	case CHARACTER.KIM:
	name = "Kim";
	type = ELEMENT.OLD;
	description = "Dumb fucking squishmallows";
	signature = "SQUISHMALLOWS SQUISHMALLOWS SQUISHMALLOWS";
	sprite_index = sprite_index;
	skills = [
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		},
		{
			name : "Something",
			description : $"[c_amaranth]{name}[/c] does something",
			cost1 : 1,
			cost2 : 2,
			dmg : 2,
			image_xscale : 2,
			image_yscale : 2
		}
	];
	break;
}
<<<<<<< Updated upstream:TCG/objects/oCharacter/Create_0.gml
switch(type){
	case ELEMENT.BOZO: default:
	cardColor = c_maroon;
	typeString = "Bozo";
	break;
	case ELEMENT.GIGACHAD:
	cardColor = c_silver;
	typeString = "Gigachad";
	break;
	case ELEMENT.OLD:
	cardColor = c_green;
	typeString = "Old";
=======

if (type >= 0) && (type <= 8){
	cardColor = global.elementColours[type];
	cardEIcon = global.elementIcons[type];
	typeString = global.elementNames[type];
} else{
	cardColor = c_white;
	cardEIcon = sPlaceholder;
	typeString = "No element";
>>>>>>> Stashed changes:BakaTCG/objects/oCharacter/Create_0.gml
}

for (var i = 0; i < array_length(skills); i++){
	if (!variable_instance_exists(skills[i],"cost1")) skills[i].cost1 = -infinity;
	if (!variable_instance_exists(skills[i],"cost2")) skills[i].cost2 = -infinity;
	if (!variable_instance_exists(skills[i],"dmg")) skills[i].dmg = -infinity;
	if (!variable_instance_exists(skills[i],"charge")) skills[i].charge = -infinity;
	if (!variable_instance_exists(skills[i],"aoe")) skills[i].aoe = false;
	
	if (!variable_instance_exists(skills[i],"sprite_index")) skills[i].sprite_index = sSkillIconDefault;
	if (!variable_instance_exists(skills[i],"image_index")) skills[i].image_index = 0;
	if (!variable_instance_exists(skills[i],"image_speed")) skills[i].image_speed = 0;
	if (!variable_instance_exists(skills[i],"image_xscale")) skills[i].image_xscale = 1;
	if (!variable_instance_exists(skills[i],"image_yscale")) skills[i].image_yscale = 1;
	if (!variable_instance_exists(skills[i],"image_alpha")) skills[i].image_alpha = 1
	if (!variable_instance_exists(skills[i],"image_angle")) skills[i].image_angle = 0;
	if (!variable_instance_exists(skills[i],"image_blend")) skills[i].image_blend = c_white;
	if (!variable_instance_exists(skills[i],"x")) skills[i].x = 0;
	if (!variable_instance_exists(skills[i],"y")) skills[i].y = 0;
	if (!variable_instance_exists(skills[i],"xstart")) skills[i].xstart = 0;
	if (!variable_instance_exists(skills[i],"ystart")) skills[i].ystart = 0;
	
	skills[i].sprite_width = sprite_get_width(skills[i].sprite_index) * skills[i].image_xscale;
	skills[i].sprite_height = sprite_get_height(skills[i].sprite_index) * skills[i].image_yscale;
	skills[i].sprite_xoffset = sprite_get_xoffset(skills[i].sprite_index);
	skills[i].sprite_yoffset = sprite_get_yoffset(skills[i].sprite_index);
	skills[i].image_number = sprite_get_number(skills[i].sprite_index);
	skills[i].image_timer = skills[i].image_speed;
}

if (status == 0) && (!enemy){
	array_push(global.currentCharacters,cardID);
	arrayPosition = array_length(global.currentCharacters)-1;
	x = room_width/2;
	y = room_height;
	targetX = x;
	targetY = room_height-sprite_height*2.5;
} else{
	array_push(global.currentEnemyCharacters,cardID);
	arrayPosition = array_length(global.currentEnemyCharacters)-1;
	x = room_width/2;
	y = -sprite_height;
	targetX = x;
	targetY = sprite_height*1.5;
}

