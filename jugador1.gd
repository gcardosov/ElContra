extends Position2D
#Variables 
var Velocidad = Vector2()
#export nos ayuda a manipular el valor desde afuera
export (float) var GRAVEDAD = 100

func _ready():
	pass
	
func _physics_process(delta):
	
	Velocidad.y += GRAVEDAD * delta
	
	#ACA VOY A CALCULAR EL RESTO	
	var movimiento = Velocidad * delta	
	get_node("cuerpo_J1").move_and_slide(movimiento) 


