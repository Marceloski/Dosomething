extends Node2D
#inicio actua como estado del juego, 1 es antes del inicio, 
var inicio = 1
#oficina
var arrayoficina = []
var eventos = []
var dias
var genero
var Iniciodialogos = 0
var dialtext = [
	"Esta es tu oficina, Nuevo jefe, soy tu secretaria sana banana y te contare las eventualidades que sucedan en la oficina.",
	"Por ejemplo aqui abajo tenemos El dinero, este sirve para comprar o pagar cosas de las situaciones.",
	"Texto 3",
	"Texto 4"
]
#var dineroChangeOF 
#var empleadosChangeOF 
#var felicidadChangeOF  
#casa
#var DineroCasa = 10
#var Salud = 5
#var felicidadCasa = 10
#var DineroChangeCasa 
#var SaludChangeCasa
#var felicidadChangeCasa

func Lectura():
	var file = FileAccess.open("res://eventos.txt", FileAccess.READ)
	### estructura del txt eventos con su variable "positiva y negativa"
	### Numero del evento 
	### OpcionA texto
	### OpcionB texto
	### OpcionB texto
	### Dinero A Numerico
	### Empleados A Numerico
	### Felicidad A Numerico
	### Dinero B Numerico
	### Empleados B Numerico
	### Felicidad B Numerico
	### Dinero C Numerico
	### Empleados C Numerico
	### Felicidad C Numerico
	### Feedbackopcion1 texto
	### FeedBackopcion2 texto
	### Feedbackopcion3 texto
	
	if file:
		while true:
			var NumeroEvento = file.get_line()  # Read a single line from the file
			#print(NumeroEvento)
			if NumeroEvento == "":  # Check for empty line
				break  # Exit the loop if an empty line is encountered
			var Dialogo = file.get_line()  # Read the next line
			var OpcionA = file.get_line()
			var OpcionB = file.get_line()
			var OpcionC = file.get_line()
			var DineroA = file.get_line()
			var EmpleadosA = file.get_line()
			var FelicidadA = file.get_line()
			var DineroB = file.get_line()
			var EmpleadosB = file.get_line()
			var FelicidadB = file.get_line()
			var DineroC = file.get_line()
			var EmpleadosC = file.get_line()
			var FelicidadC = file.get_line()
			var FeedbackA = file.get_line()
			var FeedbackB = file.get_line()
			var FeedbackC = file.get_line()
			llenado(NumeroEvento.to_int(),Dialogo, OpcionA,OpcionB,OpcionC,DineroA.to_int(),EmpleadosA.to_int(),FelicidadA.to_int(),DineroB.to_int(),EmpleadosB.to_int(),FelicidadB.to_int(),DineroC.to_int(),EmpleadosC.to_int(),FelicidadC.to_int(),FeedbackA,FeedbackB,FeedbackC)
		file.close()
	else:
		print("Error al abrir el archivo")

	pass
#funcion secundaria donde se asigna toda la lectura al array dentro del sistema
func llenado(NumeroEvento,Dialogo, OpcionA,OpcionB,OpcionC,DineroA,EmpleadosA,FelicidadA,DineroB,EmpleadosB,FelicidadB,DineroC,EmpleadosC,FelicidadC,FeedbackA,FeedbackB,FeedbackC):
	eventos = [NumeroEvento,Dialogo, OpcionA,OpcionB,OpcionC,DineroA,EmpleadosA,FelicidadA,DineroB,EmpleadosB,FelicidadB,DineroC,EmpleadosC,FelicidadC,FeedbackA,FeedbackB,FeedbackC]
	pass	
# Called when the node enters the scene tree for the first time.
func _ready():
	#Carga del juego, donde se toman todos los nodos y posteriomente se ocultan
	var nodeprincipal = $NodeMenuPrincipal
	var nodeintrucciones = $NodeInstrucciones
	var nodecomic = $NodeComic
	var nodegenero = $NodeGenero
	var nodeoficina = $NodeOficina
	var nodecasa = $NodeCasa
	#se aplica la lectura, que toma el txt eventos y carga todos a un array
	Lectura()
	#oculta todos los nodos menos el de menu principal
	nodeintrucciones.hide()
	nodecomic.hide()
	nodegenero.hide()
	nodeoficina.hide()
	nodecasa.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_node_oficina_visibility_changed():
	#cuando se carga el nodo, dejo un estado para que se sepa en que parte del sistema esta
	#1 cuando se carga, 2 cuando se oculta y 3 cuando aparece la primera vez al usuario
	# hombre y mujer son una flag para mostrar el modelo de hombre y mujer
	var oficina = get_node("NodeOficina")
	var dialogo = get_node("NodeOficina/Dialogo/Dialogo")
	var hombre = get_node("NodeOficina/HombreOficina")
	var Mujer = get_node("NodeOficina/MujerOficina")
	if genero == "Hombre" :
		Mujer.hide()
	if genero == "Mujer":
		hombre.hide()
	if inicio == 3:
		if oficina.is_visible_in_tree():
			PrimerDiaOficina()
		else:
			print("ErrorPrimerEvento")
	else:
		if (inicio <= 3):
			inicio+=1
	pass
	
func PrimerDiaOficina():
	#funcion cuando aparece el primer "evento" donde aparecen las presentaciones 
	#al jugador
	var dialogo = get_node("NodeOficina/Dialogo/Dialogo")
	var Dinero = get_node("NodeOficina/Dialogo/Dinero")
	var Felicidad = get_node("NodeOficina/Dialogo/Felicidad")
	var Empleados = get_node("NodeOficina/Dialogo/Empleados")
	var Ganancias = get_node("NodeOficina/Ganancias")
	var Flechas = get_node("NodeOficina/Flehcas")
	#aqui un intento de asignar las variables iniciales a los labels iniciales para
	#ser mostrados en pantalla
	Flechas.hide()
	Dinero.text ="$" + str(10)
	Felicidad.text =  str(10)
	Empleados.text = str(5)
	Ganancias.text = "$" + str(5)
	
	
	
	
	
	pass
	



func _on_mujer_pressed():
	genero = "Mujer"
	print(genero)
	pass # Replace with function body.


func _on_hombre_pressed():
	genero = "Hombre"
	print(genero)
	pass # Replace with function body.


func _on_buttonsigueinte_pressed():
	var dialogo = get_node("NodeOficina/Dialogo/Dialogo")
	var flechaDialogo= get_node("NodeOficina/Flehcas/Flecha Dialogo")
	var flechadinero = get_node("NodeOficina/Flehcas/Flecha dinero")
	var flechaempleados = get_node("NodeOficina/Flehcas/Flecha Empleados")
	var flechaganancia = get_node("NodeOficina/Flehcas/Fecha Icono")
	if Iniciodialogos == 0:
		dialogo.text = dialtext[0]
		flechaDialogo.show
		Iniciodialogos = 1 
	if Iniciodialogos == 1:
		dialogo = ("Justo aqui mismo tenemos Los empleados, estos generan una unidad de ganancia al dia ")
		Iniciodialogos = 2 
	if Iniciodialogos == 2:
		dialogo = ("")
		Iniciodialogos = 3
		
	
	pass # Replace with function body.



	

func _on_jugar_button_principal_genero_pressed():
	#Primer boton del menu principal, el cual al apretarlo pasa a la escena de genero
	var Titulo = get_node("NodeMenuPrincipal")
	var Genero = get_node("NodeGenero")
	Titulo.hide()
	Genero.show()
	pass 

func _on_instruccion_boton_principal_instrucciones_pressed():
	#Segundo boton del menu principal, el cual al apretarlo pasa a la escena de Instrucciones
	var Titulo = get_node("NodeMenuPrincipal")
	var Instrucciones = get_node("NodeInstrucciones")
	Titulo.hide()
	Instrucciones.show()
	pass 
func _on_boton_instrucciones_genero_pressed():
	#Primer Boton en Instrucciones donde se procede a genero
	var Genero  = get_node("NodeGenero")
	var Instrucciones = get_node("NodeInstrucciones")
	Instrucciones.hide()
	Genero.show()
	pass 


func _on_boton_instrucciones_principal_pressed():
	#Segundo Boton en Instrucciones donde se procede de instrucciones al menu principal
	var Principal  = get_node("NodeMenuPrincipal")
	var Instrucciones = get_node("NodeInstrucciones")
	Instrucciones.hide()
	Principal.show()
	pass 


func _on_boton_genero_menu_principal_pressed():
	#primer boton en Genero que va a Menu Principal
	var Principal  = get_node("NodeMenuPrincipal")
	var genero = get_node("NodeGenero")
	genero.hide()
	Principal.show()
	pass 
func _on_boton_jugar_genero_comic_pressed():
	#Segundo boton en Genero que va al comic
	var Comic  = get_node("NodeComic")
	var genero = get_node("NodeGenero")
	genero.hide()
	Comic.show()
	pass 

func _on_boton_siguiente_comic_oficina_pressed():
	var Comic  = get_node("NodeComic")
	var genero = get_node("NodeGenero")
	genero.hide()
	Comic.show()
	pass 


func _on_boton_dialogo_pressed():
	#Boton dialogo de la oficina
	pass # Replace with function body.
