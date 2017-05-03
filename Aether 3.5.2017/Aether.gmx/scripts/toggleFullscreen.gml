///toggleFullscreen
if(window_get_fullscreen()) {
//Maintain 1280x720 Resolution
    var width = RES_WIDTH;
    var height = RES_HEIGHT;
    display_set_gui_size(width,height);
    window_set_size(width,height);
    var baseWidth = RES_WIDTH, baseHeight = RES_HEIGHT;
    
    if(width >= height) {
        var height = min(baseHeight, height);
        var width = height * (width/height);
    }
    surface_resize(application_surface,width,height);
    window_set_fullscreen(false);
} else {
    //Change to Users Resolution
    var width = display_get_width();
    var height = display_get_height();
    display_set_gui_size(width,height);
    window_set_size(width,height);
    var baseWidth = RES_WIDTH, baseHeight = RES_HEIGHT;
    
    //if(width >= height) {
    //    var height = min(baseHeight, height);
    //    var width = height * (width/height);
    //}
    surface_resize(application_surface,width,height);
    window_set_fullscreen(true);
}
