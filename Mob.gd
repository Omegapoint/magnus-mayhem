extends RigidBody2D

export var min_speed = 50
export var max_speed = 150

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_dying = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func die():
	is_dying = true
	$DieAudio.play()
	$AnimatedSprite.play("die")
	

func _on_AnimatedSprite_animation_finished():
	if is_dying:
		queue_free()
