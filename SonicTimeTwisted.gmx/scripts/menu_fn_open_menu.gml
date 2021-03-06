/// menu_fn_open_menu(menu_root_items_script, draw_ignores_views = false, is_touchscreen = false)
// if the menu is already open, don't try "reopening" it
if(state == 0)
{
    var use_touchscreen = objProgram.inputManager.is_touchscreen;
    if(argument_count > 2)
    {
        use_touchscreen = argument[2];
    }
    is_touchscreen = use_touchscreen;
    previous_input_state = objProgram.inputManager.state;
    menu_fn_set_scripts(argument[0], -1);
    var draw_absolutely = false;
    if(argument_count > 1)
    {
        if(argument[1])
        {
            draw_absolutely = true;
        }
    }
    /*
    if(draw_absolutely)
    {
        draw_offset_x = 0;
        draw_offset_y = 0;
    }
    else
    {
        draw_offset_x = view_xview[view_current];
        draw_offset_y = view_yview[view_current];
    }
    */
    if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
    {
        draw_offset_x = (get_smartphone_screen_width()-objScreen.width)/2;  
        gui_click_offset_x = draw_offset_x;
    }
    else
    {
        draw_offset_x = (display_get_gui_width()-objScreen.width)/2; 
        gui_click_offset_x = 0;   
    }
    
    show_debug_message("draw_offset_x: "+string(draw_offset_x));
    draw_offset_y = 0;
    
    
    state = 1;
    timer = 0;
    with(objProgram.inputManager)
    {
        use_fallback = true;
        visible = false;
    }
}
