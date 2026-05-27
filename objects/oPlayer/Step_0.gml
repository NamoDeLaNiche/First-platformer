// Get inputs
getControls();


// Tp to room1 if you jump in room secret
if room == rmSecret  && didJump
{
	secretRoomJumpCount = 1;
}
if onGround && secretRoomJumpCount == 1
{
	room_goto(rmLevel1)
}


// X Movement
	// Direction
	moveDir = rightKey - leftKey;
	
	// Get my face (sprite orientation)
	if moveDir != 0 {face = moveDir};


	// Running
	if onGround
	{
		if runKey
		{
			// Accélération progressive mais avec une limite
			moveSpd = clamp(moveSpd + 0.03, minMoveSpd, maxMoveSpd)
			wasRunning = true;
		}
		else
		{	
			moveSpd = 2;
			wasRunning = false;
		}
		airMoveSpd = moveSpd;
	}
	else
	{
		moveSpd = airMoveSpd;
	}
	
	// Check if the player was running before jumping
	
	// Get xspd
	xspd = moveDir * moveSpd;

	// X collision
	var _subPixel = .5;
	if place_meeting(x + xspd, y, oWall)
	{
		
		// First check if there is a slope to go up (pente)
		if !place_meeting(x + xspd, y - abs(xspd) - 1, oWall)
		{
			while place_meeting(x + xspd, y, oWall)
			{
				y -= _subPixel;
			}
		}
		else
		{
			// Get as close as possible to  wall
			var _pixelCheck = _subPixel * sign(xspd);
			while !place_meeting(x + _pixelCheck, y, oWall)
			{
				x += _pixelCheck
			}	 

			// Stop the player
			xspd = 0;
		}
	}
	// Move
	x += xspd	
	
// Y movement
	// Gravity
	if coyoteHangTimer > 0
	{
		coyoteHangTimer--;
	}
	else
	{
		yspd += grav;
		setOnGround(false);
	}
	
	// Reset jumping count
	if onGround
	{
		didJump = false;
		jumpCount = 0;
		coyoteJumpTimer = coyoteJumpFrames;
	}
	else
	{
		// If the player is in the air	
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <= 0 {jumpCount = 1};
	}
	
	// Initiate Jump
	if jumpKeyBuffered && jumpCount < jumpMax
	{
		// Tell the game you jumped
		didJump = true;
		// reset the buffer
 		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		// Increased the number of jumps
		jumpCount++
		
		// Set the jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1]
		
		// Tell yourself we're no longer on the ground
		setOnGround(false)
	}
	
	// Cut off the jump
	if !jumpKeyHeld
	{
		jumpHoldTimer = 0;	
	}
	
	// Jump based on the timer/holding of the butto
	if jumpHoldTimer > 0
	{
		// Jump
		yspd = jumpSpd[jumpCount-1];
		
		// Count down the timer
		jumpHoldTimer--;
	}
	
	// Y collision
	// Cap falling speed
	if yspd > maxVel {yspd = maxVel}
	
	
	// Collision
	var _subPixel = 0.5;
	
	if	place_meeting(x, y + yspd, oWall) 
	{
		// Get as close as possible to the roof
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting(x, y + _pixelCheck, oWall)
		{
			y += _pixelCheck
		}
		// Stop the player
		yspd = 0;
	}
	
	// Cut the jump it the player is touching a roof
	if place_meeting(x, y-1, oWall)
	{
		jumpHoldTimer = 0;
	}	
	// Set if i'm on the ground
	if yspd >= 0 && place_meeting(x, y+1, oWall)
	{
		setOnGround(true)
	}
	
	// Move
	y += yspd;

// Sprite Control
// Walking
if abs(xspd) > 0 
{
	sprite_index = walkSpr	
	image_speed = 1
}
// Idle
if abs(xspd) == 0
{
	sprite_index = idleSpr
	image_speed = 1
}

if (runKey && onGround) ||(runKey && wasRunning && !onGround)
{
	sprite_index = runSpr	
	image_speed = moveSpd / 5
}

if !onGround
{
	sprite_index = jumpSpr
	image_speed = 1
}

mask_index = maskSpr;



