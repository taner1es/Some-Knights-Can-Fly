///initialize character
direction = 0;
spd = 0;
fall = false;
jump = false;
go_left = 0;
go_right = 0;
grounded = false;
jumplength = 128; 
jmp= 0;
jmp_dir = "right";
image_speed = 1;
last_direction = 0;
attack = false;
jump_attack = false;
char_speed = 8;
health = 100;
mana = 100;
mana_max = 100;
mana_usage = 0.1;
health_max = 100;



//flymode
fly = false;
flying = false;
start_fly = true;
fly_attack = false;

//check lives

if(lives == 0)
{
    room_goto(HOME);
}