extends Node

func _ready():
	pass
	var dic : Dictionary = {};
	for i in range(1,10):
		dic[i]=i*10;
	for i in range(1,10):
		print(dic[i]);
		
	
