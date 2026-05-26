function controlsSetup()
{
	bufferTime = 3;
	
	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}

function getControls()
{
	// Direction inputs
	rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
	leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
	
	// Action inputs
	jumpKeyPressed = keyboard_check_pressed(vk_space)
	jumpKeyHeld = keyboard_check(vk_space)
	runKey = keyboard_check(vk_lshift)
	
	// Jump key buffering
	if jumpKeyPressed
	{
		jumpKeyBufferTimer = bufferTime;
	}
	if jumpKeyBufferTimer > 0
	{
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	}
	else 
	{
		jumpKeyBuffered= 0;	
	}
}