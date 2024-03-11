if (room == rGame){
	instance_create_layer(x,y,"Cards",oCard,{cardID : CARD.CHANTAL});
	instance_create_layer(x,y,"Cards",oCard,{cardID : CARD.DAVID});
	repeat(irandom_range(0,10)){
		instance_create_layer(x,y,"Cards",oCard,{cardID : irandom_range(0,1)})
	}
	for(var i = 0; i < 8; i++){
		instance_create_layer(room_width,distribute(room_height-room_height/5,i,8,room_height/2)-sprite_get_height(sDieOmni)/2,"Dice",oDie,{order : i});
	}
	instance_create_layer(x,y,"Cards",oCharacter,{cardID : CHARACTER.ABBY});
	instance_create_layer(x,y,"Cards",oCharacter,{cardID : CHARACTER.SOLOMON});
	instance_create_layer(x,y,"Cards",oCharacter,{cardID : CHARACTER.KIM});
	
	instance_create_layer(x,y,"Cards",oCharacter,{cardID : CHARACTER.ABBY, enemy : true});
	instance_create_layer(x,y,"Cards",oCharacter,{cardID : CHARACTER.SOLOMON, enemy : true});
	instance_create_layer(x,y,"Cards",oCharacter,{cardID : CHARACTER.KIM, enemy : true})
	status = 1;
}