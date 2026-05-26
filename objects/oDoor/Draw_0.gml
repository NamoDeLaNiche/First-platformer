draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_halign(fa_center)
draw_set_font(fntArial);

if room == rmLevel1
{
draw_text_ext_transformed(x, y - 32, "Room 2", 50, 500, 0.4, 0.4, 0)
}
else if room == rmLevel2
{
draw_text_ext_transformed(x, y - 32, "Room 1", 50, 500, 0.4, 0.4, 0)
}
draw_set_halign(fa_left);