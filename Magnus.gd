extends KinematicBody2D

onready var _sprite = $MagnusSprite

var motion = Vector2()
const speed = 200
const jump_speed = 350
const gravity = 500
	
func _physics_process(delta):

	get_input()
	animate()
			
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

func animate():
	_sprite.play("walk")
	if motion.x > 0:
		_sprite.flip_h = false
	else:
		_sprite.flip_h = true
	
	if motion.y < 0:
		_sprite.play("jump")
	elif motion.y > 0:
		_sprite.play("fall")
		
	if is_on_floor() && motion.x == 0:
		_sprite.play("idle")	
