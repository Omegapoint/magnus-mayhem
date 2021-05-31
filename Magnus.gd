extends KinematicBody2D

onready var _sprite = $MagnusSprite
onready var _arm_sprite = $MagnusSprite/ArmSprite
onready var _muzzle_sprite = $MagnusSprite/ArmSprite/MuzzleSprite
onready var _shootAudio = $ShootAudio
onready var _aim = $MagnusSprite/ArmSprite/RayCast2D

var motion = Vector2()
const speed = 200
const jump_speed = 350
const gravity = 500

func _ready():
	_muzzle_sprite.frame = 7

func _physics_process(delta):

	get_input()
	animate()
	
	
	
	if Input.is_action_just_pressed("click"):
		handle_shoot()
		kill_mob()
			
	motion.y += gravity * delta	
	move_and_slide(motion, Vector2.UP)

func get_input():
	motion.x = 0
	if Input.is_action_pressed("right"):
		motion.x = speed
	elif Input.is_action_pressed("left"):
		motion.x = -speed
	
	if(is_on_floor()):
		motion.y = 0
		if Input.is_action_pressed("jump"):
			motion.y = -jump_speed	


func kill_mob():
	if _aim.is_colliding():
		var collider = _aim.get_collider()
		if collider.is_in_group("mob"):
			print("Kill " + collider.name)
			collider.die()
		

func handle_shoot():
	_arm_sprite.frame = 0
	_arm_sprite.play("shoot")
	_shootAudio.play()
	_muzzle_sprite.frame = 0
	_muzzle_sprite.play("fire")

func animate():
	_sprite.play("walk")
	if motion.x > 0:
		_sprite.flip_h = false
	elif motion.x < 0:
		_sprite.flip_h = true
	
	if motion.y < 0:
		_sprite.play("jump")
	elif motion.y > 0:
		_sprite.play("fall")
		
	if is_on_floor() && motion.x == 0:
		_sprite.play("idle")	
		
	move_arm()


func move_arm():
	var rotation = get_global_mouse_position().angle_to_point(position)
	if(rotation > -PI/2 && rotation < PI/2):
		_arm_sprite.flip_v = false
		#_muzzleSprite.flip_v = false
	else:
		_arm_sprite.flip_v = true
		#_muzzleSprite.flip_v = true
	_arm_sprite.rotation = rotation
