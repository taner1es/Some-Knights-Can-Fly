//firstly check am i death or not 
if(health <= 0 || y > room_height)
{
    speed = 0;
    if(direction == 0)
        instance_change(object_character_dead_right,1);
    else if(direction == 180)
        instance_change(object_character_dead_left,1);
    else //it works when you fell down outside of screen
    {
        show_message("where are you ? you dead.. be careful ");
        room_restart();
    }
    lives -=1;
}
if(health > 100) health = 100;
if(mana > 100) mana = 100;


//keyboard check
go_left = keyboard_check(vk_left);
go_right = keyboard_check(vk_right);
go_jump = keyboard_check_pressed(vk_space);
empty_right = place_free(x+16,y);
empty_left = place_free(x-16,y);
empty_bottom = place_free(x,y+8);
empty_top = place_free(x,y-8);
go_attack = keyboard_check_pressed(ord('X'));
go_run = keyboard_check(vk_shift);
switch_fly = keyboard_check_pressed(vk_enter);
check_sword_fly = instance_exists(object_sword_fly);




if(switch_fly && !flying && grounded) flying = true;
else if( (switch_fly && flying && !start_fly && !check_sword_fly) || mana <= 0 ) flying = false;

if(!flying)
{
//run kontrol
if(go_run) char_speed = 16;
else char_speed = 8;




//sprite control 

//sprite : idle & walk & run
if(grounded && !attack)
{
    image_speed = 1;
    if(!go_run)
    {
        if(go_left) sprite_index = sprite_character_go_left ;
        if(go_right) sprite_index = sprite_character_go_right;
        if((!go_left && !go_right) || (go_left && go_right))
        {
            if(direction == 180)
                sprite_index = sprite_character_idle_left;
            else if(direction == 0)
                sprite_index = sprite_character_idle_right;
        }
}
else
{
    if(go_left) sprite_index = sprite_character_run_left ;
    if(go_right) sprite_index = sprite_character_run_right;
    if((!go_left && !go_right) || (go_left && go_right))
    {
        if(direction == 180)
            sprite_index = sprite_character_idle_left;
        else if(direction == 0)
            sprite_index = sprite_character_idle_right;
    }
}
if(mana < 100)  mana += 1;
if(health < 100) health += 0.1;
}
//sprite : fall
if(fall)
{
    if(go_left) 
        sprite_index = sprite_character_go_jump_left;
    if(go_right) 
        sprite_index = sprite_character_go_jump_right;
    
    image_index = 4;
    image_speed = 0;
}

//sprite : jump
if(jump && !grounded)
{
    if(go_left || direction == 180) 
        sprite_index = sprite_character_go_jump_left;
    if(go_right || direction == 0) 
        sprite_index = sprite_character_go_jump_right;

    image_speed = 0.3;
}

//horizontal moving
if(go_left && !go_right && empty_left)
{   
    if(image_index == 0) sound_play(sound_character_walk);
    direction = 180;
    speed = char_speed;
}
else if(go_right && !go_left && empty_right)
{
    if(image_index == 0) sound_play(sound_character_walk);
    direction = 0;
    speed = char_speed;
}
else
{
    speed = 0;
}

//vertical moving
if(empty_bottom && !jump) fall = true;
if(!grounded && !jump) fall = true;
if(fall) grounded = false;
if(jump) grounded = false;



//falling
if(fall)
{
    if(!grounded && empty_bottom)
    {
        direction = 270;
        speed = 8;
        if(go_left && empty_left && !go_right) x -= char_speed;
        if(go_right && empty_right && !go_left) x += char_speed;
        if(go_left && go_right) x += 0;
    }
    //grounding
    else if(!grounded && !empty_bottom)
    {
        if(sprite_index == sprite_character_idle_right || sprite_index == sprite_character_go_jump_right)
            direction = 0;
        else if(sprite_index == sprite_character_idle_left || sprite_index == sprite_character_go_jump_left)
        direction = 180;
        
        speed = 0;
        grounded = true;
        fall = false;
    }
}


//jumping
if(grounded && go_jump && empty_top) 
{
    jump = true;
    if(sprite_index == sprite_character_idle_right)
        jump_dir = "right";
    else
        jump_dir = "left";
}

if(jump && empty_top && jmp != jumplength)
{
    direction = 90;
    if(go_left && empty_left && !go_right) x -= char_speed;
    if(go_right && empty_right && !go_left) x += char_speed;
    if(go_left && go_right) x += 0;
    speed = char_speed;
    jmp += 8;
    gravity_direction = 270;
    gravity = 0.5;
}
else if(jump && !fall)
{
    image_speed = 1;
    jump = false;
    jmp = 0;
    fall = true;
    gravity = 0;
}

//Turn on Attack
if(go_attack && grounded && !attack)
{
    if(!attack && go_left) sprite_index = sprite_character_attack_left ;
    if(!attack && go_right) sprite_index = sprite_character_attack_right;
    if(!attack && ((!go_left && !go_right) || (go_left && go_right)))
    {
        if(direction == 180)
            sprite_index = sprite_character_attack_left;
        else if(direction == 0)
            sprite_index = sprite_character_attack_right;
    }
    
    image_index = 0;
    attack = true;
    mana -= 5;
}
//on Attack
if(attack)
{
    if(empty_right && empty_left)
        speed = 4;
    else speed = 0;
    if(image_index == 9)
        attack = false;
    if(direction == 0)
    {
        if(go_left) 
            attack = false;
        if(!instance_exists(object_sword))
            instance_create(x+53,y,object_sword);
        else
            object_sword.x = x+53;    
    }

    if(direction == 180)
    {
        if(go_right) 
            attack = false;
        if(!instance_exists(object_sword))
            instance_create(x,y,object_sword);
        else
            object_sword.x = x-10;   
    }
    
    if(!grounded) attack = false;
}
else
{
    with(object_sword)
    {
        instance_destroy();
    }
}
} //on grounded section finished here


else //mode fly on here
{
    if(start_fly)
    {
        sprite_index = sprite_character_gotofly;
        direction = 90;
        speed = 4;
        if(image_index == 74) image_speed = 0;
        if(y <= 0)
        {
            y = 0;
            speed = 0;
            direction = 0;
            start_fly = false;
            image_speed = 1;
        }
    }
    //flying
    else
    {
        
        if(switch_fly && !check_sword_fly) start_fly = true;
        if(!fly_attack)
        {
            if(go_left) 
            {
                direction = 180;
                if(!empty_left) speed = 0;
                else speed = char_speed;
                
            }
            else if(go_right)
            {
                direction = 0;
                if(!empty_right) speed = 0;
                else speed = char_speed;
            }
            else speed = 0;
        }
        else speed = 0;
        mana -= mana_usage;
        
        
        
        //sprite control
        if(!fly_attack)
        {
            if(direction == 0) 
                sprite_index = sprite_character_fly_right;
            else if(direction == 180) 
                sprite_index = sprite_character_fly_left;
        }
        
        //fly attack
        if(go_attack && !fly_attack)
        {
            if(direction == 0)
            {
                sprite_index = sprite_fly_attack_body_right;
                fly_attack = true;
                instance_create(x,y+150,object_sword_fly);
                object_sword_fly.sprite_index = sprite_fly_attack_sword_right;
            }
            else if(direction == 180)
            {
                sprite_index = sprite_fly_attack_body_left;
                fly_attack = true;
                instance_create(x,y+100,object_sword_fly);
                object_sword_fly.sprite_index = sprite_fly_attack_sword_left;
            }
              
        }
        else if(fly_attack)
        {
            if(!instance_exists(object_sword_fly))
            {
                fly_attack = false;   
            }
        }
    }
    
}


