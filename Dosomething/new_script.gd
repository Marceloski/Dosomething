extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Button_pressed():
  # Cambiar a la escena "NodeOfi
	get_tree().change_scene("res://path/to/NodeOficina.tscn")
  
  # Ocultar NodeMenuPrincipa
	self.queue_free()
	
