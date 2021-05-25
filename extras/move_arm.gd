func move_arm():
	var rotation = get_global_mouse_position().angle_to_point(position)
	if(rotation > -PI/2 && rotation < PI/2):
		_arm_sprite.flip_v = false
		#_muzzleSprite.flip_v = false
	else:
		_arm_sprite.flip_v = true
		#_muzzleSprite.flip_v = true
	_arm_sprite.rotation = rotation