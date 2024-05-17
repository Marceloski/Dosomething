extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_pressed():
	var grandparrent = get_parent().get_parent() # Obtiene el nodo abuelo
	var parent = get_parent()
	var ins = grandparrent.get_node("NodeMenuPrincipal")
	parent.hide()
	ins.show()
	
	
	pass 
