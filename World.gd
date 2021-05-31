extends Node2D

export (PackedScene) var Mob

# Called when the node enters the scene tree for the first time.
func _ready():
	$MobTimer.start()

func _on_MobTimer_timeout():
	var screen_size = get_viewport().get_visible_rect().size
	var x = rand_range(0, screen_size.x)
	var y = 0
	
	var mob = Mob.instance()
	mob.position.x = x
	mob.position.y = y
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(PI/2)
	add_child(mob)
