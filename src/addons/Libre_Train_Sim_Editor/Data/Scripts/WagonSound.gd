extends Spatial

var player
onready var wagon = get_parent()

var sollCurveSound = -50
var sollDriveSound = -50

export (String) var driveSoundPath = "res://Resources/Basic/Sounds/Drive.ogg"
export (String) var curveSoundPath = "res://Resources/Basic/Sounds/Curve.ogg"
export (String) var switchSoundPath = "res://Resources/Basic/Sounds/DriveOverSwitch.ogg"
export (String) var brakeSoundPath = "res://Resources/Basic/Sounds/Brakes.ogg"



func _process(delta):
	if player == null:
		player = get_parent().player
		return
	

	
	## sollCurveSound:
	if wagon.currentRail.radius == 0 or Math.speedToKmH(player.speed) < 35 or abs(wagon.currentRail.radius) > 600:
		sollCurveSound = -50
	else:
		sollCurveSound = -25.0 + (Math.speedToKmH(player.speed)/80.0 * abs(300.0/wagon.currentRail.radius))*5
	
#	print(sollCurveSound)
	$CurveSound.unit_db = Root.clampViaTime(sollCurveSound, $CurveSound.unit_db, delta)
#	$CurveSound.unit_db = 10
	
	## Drive Sound:
	$DriveSound.pitch_scale = 0.5 + Math.speedToKmH(player.speed)/200.0
	var driveSoundDb = -20.0 + Math.speedToKmH(player.speed)/2.0
	if driveSoundDb > 10:
		driveSoundDb = 10
	if player.speed == 0:
		driveSoundDb = -50.0
	$DriveSound.unit_db = Root.clampViaTime(driveSoundDb, $DriveSound.unit_db, delta) 
	
	var sollBreakSound = -50.0
	if not (player.speed >= 5 or player.command >= 0 or player.speed == 0):
		sollBreakSound = -20.0 -player.command * 5.0/player.speed
		if sollBreakSound > 10:
			sollBreakSound = 10
	$BrakeSound.unit_db = Root.clampViaTime(sollBreakSound, $BrakeSound.unit_db, delta)
	

	checkAndPlaySwitchSound()
	

func _ready():
	$DriveSound.stream = load(driveSoundPath)
	$CurveSound.stream = load(curveSoundPath)
	$SwitchSound.stream = load(switchSoundPath)
	$SwitchSound.stream.loop = false
	$SwitchSound2.stream = load(switchSoundPath)
	$SwitchSound2.stream.loop = false
	$BrakeSound.stream = load(brakeSoundPath)
	
	$DriveSound.unit_db = -50
	$CurveSound.unit_db = -50

var lastSwitchSoundRail = null
var secondSwitchSoundDistance = -1 # If this distance is set, and its bigger than the complete distance of the wagon, the second switch sound will be played 
func checkAndPlaySwitchSound():
	
	if secondSwitchSoundDistance != -1 and secondSwitchSoundDistance < wagon.distance:
		$SwitchSound2.play()
		print("played second")
		secondSwitchSoundDistance = -1
		
	if not wagon.switchOnNextChange:
		return
	
	if wagon.forward:
		if wagon.currentRail.length - (wagon.distanceOnRail + wagon.length/2.0) < 1 and not wagon.currentRail == lastSwitchSoundRail:
			$SwitchSound.play()
			lastSwitchSoundRail = wagon.currentRail
			secondSwitchSoundDistance = wagon.distance + wagon.length -1
	else:
		if wagon.distanceOnRail - wagon.length/2.0 < 1 and not wagon.currentRail == lastSwitchSoundRail:
			$SwitchSound.play()
			lastSwitchSoundRail = wagon.currentRail
			secondSwitchSoundDistance = wagon.distance + wagon.length -1
			
	
	
		
	
	