extends Node2D

func _process(delta):
	var mouse_pos = $Ubackground.world_to_map(get_global_mouse_position());
	var local_pos = $Ubackground.map_to_world(mouse_pos);
	var world_pos = $Ubackground.to_global(local_pos);
#	print(mouse_pos);
	if Input.is_action_just_pressed("copy"):
		pass
		$Ubackground.set_cell(mouse_pos.x,mouse_pos.y,2,false,false,false,Vector2(0,0));
	if Input.is_action_just_pressed("escape"):
		pass
		Globalvar.walls = $Ubackground.get_used_cells_by_id(2);
		print(Globalvar.walls);
		get_tree().change_scene("res://MainGame.tscn");
		
	
