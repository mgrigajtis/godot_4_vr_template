extends Node3D

var interface : XRInterface

# Called when the node enters the scene tree for the first time.
func _ready():
	# Find our interface and check if it was successfully initialised.
	# Note that Godot should initialise this automatically IF you've
	# enabled it in project settings!
	interface = XRServer.find_interface("OpenXR")
	
	if interface and interface.is_initialized():
		print("OpenXR initialised successfully")
		var vp : Viewport = get_viewport()
		
		vp.use_xr = true
		
		# Start playing the ambience
		$Ambience.play()
	else:
		print("OpenXR not initialised, please check if your headset is connected")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$"XROrigin3D/Left Controller/FPSText".text = "FPS: " + str(Engine.get_frames_per_second())
