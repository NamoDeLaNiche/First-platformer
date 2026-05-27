// Custom functions for player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	}
	else
	{
		onGround = false;
		coyoteHangTimer = 0;
	}
}

// Check if the player was running before jumping
wasRunning = false;

// Sprite
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
runSpr = sPlayerRun;
jumpSpr = sPlayerJump;
crouchSpr = sPlayerCrouch;

// Controls setup
controlsSetup()

// Movements
face = 1;
moveDir = 0;
airMoveSpd = 3.5;
moveSpd = 2;
minMoveSpd = 3;
maxMoveSpd = 8;
xspd=0;
yspd=0;


// Jumping
grav = .3;
maxVel = 4.5;
onGround = true; 
didJump = false;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
secretRoomJumpCount = 0;

// Jump values
jumpSpd = [-3]
jumpHoldFrames = [18]

// Coyote time
coyoteJumpFrames = 5;
coyoteJumpTimer = 0;

coyoteHangFrames = 2;
coyoteHangTimer = 0;

