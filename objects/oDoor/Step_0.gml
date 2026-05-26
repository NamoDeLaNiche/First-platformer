if place_meeting(x, y, oPlayer)
{
	if room == rmLevel1
	{
		room_goto(rmLevel2)
	}
	else if room == rmLevel2
	{
		room_goto(rmLevel1)
	}
}