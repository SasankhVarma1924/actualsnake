extends Node2D

var snake_pos : Array = [Vector2(7,4),Vector2(6,4),Vector2(5,4)];
var snake_head : Vector2;
var food_pos : Vector2 = Vector2.ZERO;
const SNAKET = 1;
const SNAKEH = 0;
const FOOD = 4;
var sdir : Vector2 = Vector2(1,0);
var ud : bool = false;
var lr : bool = false;
var OVER : bool = false;

func rand():
	randomize();
	var posx = randi()%16;
	var posy = randi()%16;
	return Vector2(posx,posy);

func _ready():
	pass
	snake_head = snake_pos[0];
	


func drawWalls():
	for wall in Globalvar.walls:
		$EntityMap.set_cell(wall.x,wall.y,3,false,false,false,Vector2(0,0));
		if wall == snake_head :
			OVER=true;


func _process(delta):
	if snake_head.x >= 16 or snake_head.y >=16 or snake_head.x <=-1 or snake_head.y <=-1:
		OVER = true;
		
	if OVER == true:
		get_tree().change_scene("res://Score.tscn");
	

func _on_Timer_timeout():
	delete_tiles();
	
	drawSnake();
	drawFood();
	drawWalls();
	


func _input(event):
	if Input.is_action_just_pressed("move_up"):
		if not sdir.y == 1:
			sdir.y = -1;
			sdir.x=0;
	if Input.is_action_just_pressed("move_down"):
		if not sdir.y == -1:
			sdir.y = 1;
			sdir.x=0;
	if Input.is_action_just_pressed("move_right"):
		if not sdir.x == -1:
			sdir.x = 1;
			sdir.y=0;
	if Input.is_action_just_pressed("move_left"):
		if not sdir.x == 1:
			sdir.x = -1;
			sdir.y=0;
	


func update_snake():
	var head : Vector2 = snake_pos[0];
	head += sdir;
	snake_pos.pop_back();
	snake_pos.push_front(head);

func snake_increase():
	var head : Vector2 = snake_pos[0];
	head += sdir;
	snake_pos.push_front(head);
	

func delete_tiles():
	var cells = $EntityMap.get_used_cells();
	for cell in cells:
		$EntityMap.set_cell(cell.x,cell.y,-1);


func update_food():
	food_pos = rand();

func drawFood():
	pass
	$EntityMap.set_cell(food_pos.x,food_pos.y,FOOD,false,false,false,Vector2(0,0));


func drawSnake():
	pass
	if(snake_head == food_pos):
		snake_increase();
		update_food();
	else:
		update_snake();
	
	
	snake_head = snake_pos[0];
	
	$EntityMap.set_cell(snake_head.x,snake_head.y,SNAKEH,false,false,false,Vector2(0,0));
	
	for i in range(1,snake_pos.size()):
		var body = snake_pos[i];
		if body == snake_head:
			OVER = true;
		if body == food_pos:
			var flag = true;
			while(flag):
				if food_pos != body:
					flag = false;
				
		$EntityMap.set_cell(body.x,body.y,SNAKET,false,false,false,Vector2(0,0));
		
	

		

