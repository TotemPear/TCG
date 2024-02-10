/// @desc Make request

textBox1 = new Box();
textBox1.sprite_index = sBox
textBox1.image_index = 0;
textBox1.x = room_width/2;
textBox1.y = room_height/2 - (50 * (2/3));
textBox1.image_xscale = make_sprite_width(textBox1.sprite_index, 600);
textBox1.image_yscale = make_sprite_height(textBox1.sprite_index, 50);

textBox2 = new Box();
textBox2.sprite_index = sBox
textBox2.image_index = 0;
textBox2.x = room_width/2;
textBox2.y = room_height/2 + (50 * (2/3));
textBox2.image_xscale = make_sprite_width(textBox2.sprite_index, 600);
textBox2.image_yscale = make_sprite_height(textBox2.sprite_index, 50);