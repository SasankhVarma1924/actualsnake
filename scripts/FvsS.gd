extends Node2D

const SNAKEH = 0;
const SNAKET = 1;
const FOOD = 2;

var snake_pos : Array = [Vector2(5,5),Vector2(4,5),Vector2(3,5),Vector2(2,5),Vector2(1,5)];
var ai_snake_pos : Array ;
var food_pos : Vector2 = Vector2(10,10);
var vel : Vector2 = Vector2.ZERO;
var svel : Vector2;
var m;
var n;
var snake_head : Vector2;

func snake_q4(var x: int,var y: int):
	pass
	if x-1 == m or y-1 == n :
		return [Vector2(-1,-1)];
	var vecr : Array = snake_q4(x,y+1);
	var vecd : Array = snake_q4(x+1,y);
	vecr.push_back(Vector2(x,y));
	vecd.push_back(Vector2(x,y));
	
	if vecr[0] == Vector2(-1,-1) && vecd[0] == Vector2(-1,-1):
		return [Vector2(x,y)];
	elif vecr[0] == Vector2(-1,-1):
		return vecd;
	elif vecd[0] == Vector2(-1,-1):
		return vecr;
	elif vecr.size() < vecd.size():
		return vecr;
	elif vecr.size() > vecd.size():
		return vecd;
	elif vecr.size() == vecd.size():
		randomize();
		if randi() % 10 >= 5:
			return vecr;
		else:
			return vecd;
	
func snake_q1(var x:int,var y:int):
	pass
	if x-1 == m or y+1 == n :
		return [Vector2(-1,-1)];
	var vecr : Array = snake_q1(x,y-1);
	var vecd : Array = snake_q1(x+1,y);
	vecr.push_back(Vector2(x,y));
	vecd.push_back(Vector2(x,y));
	
	if vecr[0] == Vector2(-1,-1) && vecd[0] == Vector2(-1,-1):
		return [Vector2(x,y)];
	elif vecr[0] == Vector2(-1,-1):
		return vecd;
	elif vecd[0] == Vector2(-1,-1):
		return vecr;
	elif vecr.size() < vecd.size():
		return vecr;
	elif vecr.size() > vecd.size():
		return vecd;
	elif vecr.size() == vecd.size():
		randomize();
		if randi() % 10 >= 5:
			return vecr;
		else:
			return vecd;
	
func snake_q2(var x:int,var y:int):
	pass
	if x+1 == m or y+1 == n :
		return [Vector2(-1,-1)];
	var vecr : Array = snake_q2(x,y-1);
	var vecd : Array = snake_q2(x-1,y);
	vecr.push_back(Vector2(x,y));
	vecd.push_back(Vector2(x,y));
	
	if vecr[0] == Vector2(-1,-1) && vecd[0] == Vector2(-1,-1):
		return [Vector2(x,y)];
	elif vecr[0] == Vector2(-1,-1):
		return vecd;
	elif vecd[0] == Vector2(-1,-1):
		return vecr;
	elif vecr.size() < vecd.size():
		return vecr;
	elif vecr.size() > vecd.size():
		return vecd;
	elif vecr.size() == vecd.size():
		randomize();
		if randi() % 10 >= 5:
			return vecr;
		else:
			return vecd;
	
func snake_q3(var x:int,var y:int):
	pass
	if x+1 == m or y-1 == n :
		return [Vector2(-1,-1)];
	var vecr : Array = snake_q3(x,y+1);
	var vecd : Array = snake_q3(x-1,y);
	vecr.push_back(Vector2(x,y));
	vecd.push_back(Vector2(x,y));
	
	if vecr[0] == Vector2(-1,-1) && vecd[0] == Vector2(-1,-1):
		return [Vector2(x,y)];
	elif vecr[0] == Vector2(-1,-1):
		return vecd;
	elif vecd[0] == Vector2(-1,-1):
		return vecr;
	elif vecr.size() < vecd.size():
		return vecr;
	elif vecr.size() > vecd.size():
		return vecd;
	elif vecr.size() == vecd.size():
		randomize();
		if randi() % 10 >= 5:
			return vecr;
		else:
			return vecd;
	
func snake_px(var x:int,var y:int):
	pass
	if x == m:
		return [Vector2(x,y)];
	var vecx : Array = snake_px(x+1,y);
	vecx.push_back(Vector2(x,y));
	return vecx;
	
func snake_nx(var x:int,var y:int):
	pass
	if x == m:
		return [Vector2(x,y)];
	var vecx : Array = snake_nx(x-1,y);
	vecx.push_back(Vector2(x,y));
	return vecx;
	
func snake_py(var x:int,var y:int):
	pass
	if y == n:
		return [Vector2(x,y)];
	var vecx : Array = snake_py(x,y-1);
	vecx.push_back(Vector2(x,y));
	return vecx;
	
func snake_ny(var x:int,var y:int):
	pass
	if y == n:
		return [Vector2(x,y)];
	var vecx : Array = snake_ny(x,y+1);
	vecx.push_back(Vector2(x,y));
	return vecx;
	
func diff(var first : Vector2 ,var second : Vector2):
	return first-second;

func shortest_dis():
	m=food_pos.x ;
	n=food_pos.y ;
	var d = diff(snake_head,food_pos);
	if d.x < 0 && d.y == 0:
		ai_snake_pos = snake_px(snake_head.x,snake_head.y);
	elif d.x > 0 && d.y == 0:
		ai_snake_pos = snake_nx(snake_head.x,snake_head.y);
	elif d.x == 0 && d.y > 0:
		ai_snake_pos = snake_py(snake_head.x,snake_head.y);
	elif d.x == 0 && d.y < 0:
		ai_snake_pos = snake_ny(snake_head.x,snake_head.y);
	elif d.x < 0 && d.y > 0:
		ai_snake_pos = snake_q1(snake_head.x,snake_head.y);
	elif d.x < 0 && d.y < 0:
		ai_snake_pos = snake_q4(snake_head.x,snake_head.y);
	elif d.x > 0 && d.y > 0:
		ai_snake_pos = snake_q2(snake_head.x,snake_head.y);
	elif d.x > 0 && d.y < 0:
		ai_snake_pos = snake_q3(snake_head.x,snake_head.y);
	ai_snake_pos.pop_back();
		
	
	#print(ai_snake_pos);

func _ready():
	pass
	snake_head = snake_pos[0];

func _input(event):
	if Input.is_action_just_pressed("move_up"):
		vel = Vector2(0,-1);
		svel = vel;
	if Input.is_action_just_pressed("move_down"):
		vel = Vector2(0,1);
		svel = vel;
	if Input.is_action_just_pressed("move_right"):
		vel = Vector2(1,0);
		svel = vel;
	if Input.is_action_just_pressed("move_left"):
		vel = Vector2(-1,0);
		svel = vel;
	if Input.is_action_just_pressed("stop"):
		vel = Vector2(0,0);
	

func _process(delta):
	pass
	delete_tiles();
	draw_snake();
	draw_food();
	

func _on_Timer_timeout():
	pass # Replace with function body.
	food_pos += vel;
	

func delete_tiles():
	var tiles = $EntityMap.get_used_cells();
	for tile in tiles:
		$EntityMap.set_cell(tile.x,tile.y,-1);

func draw_snake():
	pass
	#print(snake_pos);
	$EntityMap.set_cell(snake_head.x,snake_head.y,SNAKEH,false,false,false,Vector2(0,0));
	for body in snake_pos.slice(1,snake_pos.size()):
		pass
		if body == food_pos + vel:
			vel = Vector2.ZERO;
		$EntityMap.set_cell(body.x,body.y,SNAKET,false,false,false,Vector2(0,0));

func update_snake():
	pass
	if(!ai_snake_pos.empty()):
		snake_pos.push_front(ai_snake_pos.back());
		snake_pos.pop_back();
	snake_head = snake_pos[0];

func draw_food():
	pass
	if food_pos.x + vel.x >= 16 or food_pos.y + vel.y >= 16 or food_pos.x + vel.x <=-1 or food_pos.y + vel.y <=-1:
		vel = Vector2.ZERO;
#	food_pos += vel;
	$EntityMap.set_cell(food_pos.x,food_pos.y,FOOD,false,false,false,Vector2(0,0));
	


func _on_STimer_timeout():
	pass # Replace with function body.
	
	update_snake();
	if snake_head == food_pos:
		get_tree().change_scene("res://scenes/GameOver.tscn");


func _on_TailInc_timeout():
	pass # Replace with function body.
	shortest_dis();

