extends Node2D

export (PackedScene) var Mob

func _ready():
	randomize()
	$MobTimer.start()

func _on_MobTimer_timeout():
	var screen_size = get_viewport().get_visible_rect().size
	var x = screen_size.x
	var y = rand_range(0, screen_size.y)
	
	var mob = Mob.instance()
	
	mob.position.x = x
	mob.position.y = y
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(PI)
	
	add_child(mob)
