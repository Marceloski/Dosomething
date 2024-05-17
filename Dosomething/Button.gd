extends Button


func _ready():
	# Crea un botón para cambiar de escena
	pass



func _on_pressed():
	var grandparrent = get_parent().get_parent() # Obtiene el nodo abuelo
	var parent = get_parent()
	var ins = grandparrent.get_node("NodeGenero")
	parent.hide()
	ins.show()
	pass 
