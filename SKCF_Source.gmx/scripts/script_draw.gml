///character details
draw_set_font(font_dialog);
draw_set_color(c_gray);

//I used this section to check states and fix some bugs .. 
/*
draw_text(object_character.x-50,50,"jump : " + string(object_character.jump));
draw_text(object_character.x-50,80,"fall : " + string(object_character.fall));
draw_text(object_character.x-50,110,"grounded : " + string(object_character.grounded));
draw_text(object_character.x-50,140,"direction : " + string(object_character.direction));
draw_text(object_character.x-50,170,"attack : " + string(object_character.attack));
draw_text(object_character.x-50,200,"image_index : " + string(object_character.image_index));
draw_text(object_character.x-50,230,"sprite_index : " + string(sprite_get_name(object_character.sprite_index)));
draw_text(object_character.x-50,260,"fly_attack : " + string(object_character.fly_attack));

draw_text(object_character.x-50,290,"character_x : " + string(object_character.x));
draw_text(object_character.x-50,320,"character_y : " + string(object_character.y));



draw_text(50,500,"y : " + string(object_ground.y));*/


/*
if(instance_exists(object_enemy_silver_knight))
{
    draw_text(object_enemy_silver_knight.x,object_enemy_silver_knight.y-110,"image_index : " + string(object_enemy_silver_knight.direction));
    draw_text(object_enemy_silver_knight.x,object_enemy_silver_knight.y-80,"image_index : " + string(object_enemy_silver_knight.image_index));
    draw_text(object_enemy_silver_knight.x,object_enemy_silver_knight.y-50,"health : " + string(object_enemy_silver_knight.hp));
    draw_text(object_enemy_silver_knight.x,object_enemy_silver_knight.y-20,"state : " + string(object_enemy_silver_knight.state));
}
*/
//draw_text(object_character.x-50,390,"character_health : " + string(object_character.health));


//important draw section here..
if(instance_exists(object_character)){

    //draw healthbar
    draw_healthbar(view_xview[0],view_hview[0]-22,view_xview[0]+view_wview[0]-1,view_hview[0]-12,object_character.health,c_red,c_green,c_lime,0,1,1);
    //draw manabar
    draw_healthbar(view_xview[0],view_hview[0]-11,view_xview[0]+view_wview[0]-1,view_hview[0]-1,object_character.mana,c_white,c_aqua,c_blue,0,1,1);
}

draw_text(view_xview[0]+1080,64,"Score : " + string(score));
