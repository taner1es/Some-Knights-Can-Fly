// state = "idle"; // idle,walk,attack,hurt,dead


///switch sprites

switch(state)
{
    case "idle":
            if(direction == 180)
                sprite_index = sprite_enemy_silver_knight_idle_left;
            else
                sprite_index = sprite_enemy_silver_knight_idle_right;
        break;
    case "walk":
            if(direction == 180)
                sprite_index = sprite_enemy_silver_knight_walk_left;
            else
                sprite_index = sprite_enemy_silver_knight_walk_right;
        break;
    case "attack":
            if(direction == 180)
                sprite_index = sprite_enemy_silver_knight_attack_left;
            else
                sprite_index = sprite_enemy_silver_knight_attack_right;
        break;
    case "hurt":
            if(direction == 180)
                sprite_index = sprite_enemy_silver_knight_hurt_left;
            else
                sprite_index = sprite_enemy_silver_knight_hurt_right;
            
            speed = 0;
            if(image_index == 3)
                state = "idle";
        break;
}