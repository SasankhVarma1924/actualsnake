extends Control



func _on_Restart_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://scenes/MainGame.tscn");


func _on_quit_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://scenes/UserOI.tscn");

func _ready():
	$val.text = str(Globalvar.score);
