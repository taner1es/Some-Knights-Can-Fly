//check health
if(hp <= 0)
{
    if(direction == 180)
        instance_change(object_enemy_silver_knight_dead_left,1);
    else if(direction == 0)
        instance_change(object_enemy_silver_knight_dead_right,1);
}
else
{

//search character and walk to him if see
if(!saw_character)
{
    for(i = 150 ; i < 1000 ; i+=1)
    {
        if(instance_place(x-i,y,object_character))
        {
            saw_character = true;
            direction = 180;
            break;
        }
        else if(instance_place(x+i,y,object_character))
        {
            saw_character = true;
            direction = 0;
            break;
        }
    }
    speed = 0;
    state = "idle";
}
if(saw_character)
{
    state = "walk";
    speed = 8;
    for(i = 150; i < 1000 ; i+=1)
        if(!instance_place(x-i,y,object_character)) saw_character = false;
        if(!instance_place(x+i,y,object_character)) saw_character = false;
        else saw_character = true;
}

    for(i = 0; i < 150 ; i+=1)
        if(instance_place(x-i,y,object_character)) state = "attack";
        else if(instance_place(x+i,y,object_character)) state = "attack";
}
if(place_free(x,y+8))
{
    direction = 270;
    speed = 8;
}

        
