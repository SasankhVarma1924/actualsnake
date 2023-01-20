extends Control



func _on_Start_pressed():
	pass
	get_tree().change_scene("res://MainGame.tscn");


func _on_Create_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://User.tscn");
	


func _on_Quit_pressed():
	pass # Replace with function body.
	get_tree().quit();
	
