extends Position2D

var Velocidad = Vector2()
export (float) var GRAVEDAD = 100
export (float) var VEL_MOVIMIENTO = 25
export (float) var VEL_SALTO = 25

func _ready():
	pass
	
func _physics_process(delta):
	
	Velocidad.y += GRAVEDAD * delta
	
	if(Input.is_action_pressed("tecla_a")):
		Velocidad.x = -VEL_MOVIMIENTO
		if(!get_node("animacion_J1").is_playing()):
			get_node("animacion_J1").play("j1_corriendo")
			get_node("cuerpo_J1/spr_J1").flip_h = false
	elif(Input.is_action_pressed("tecla_d")):
		if(!get_node("animacion_J1").is_playing()):
			get_node("animacion_J1").play("j1_corriendo")
			get_node("cuerpo_J1/spr_J1").flip_h = true
		Velocidad.x = VEL_MOVIMIENTO
	else:
		Velocidad.x = 0
		get_node("animacion_J1").play("j1_idle")
		
	if(Input.is_action_pressed("tecla_z")):
		Velocidad.y -= VEL_SALTO
		get_node("animacion_J1").play("j1_salto")
	#
	var movimiento = Velocidad * delta
	get_node("cuerpo_J1").move_and_slide(movimiento)
	#obtener los coliders
	
	if(get_node("cuerpo_J1").get_slide_collision(get_node("cuerpo_J1").get_slide_count()-1) != null):
		var obj_colisionado =  get_node("cuerpo_J1").get_slide_collision(get_node("cuerpo_J1").get_slide_count()-1).collider
	
	
	
	