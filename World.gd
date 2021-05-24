extends Node2D

var score

func new_game():
	$HUD.update_score(score)
	$HUD.show_message("Here he comes!")

func game_over():
	$HUD.show_game_over()
