extends StaticBody2D

@export var jogador1 : bool 
var velocidade_do_jogador : int = 500


func _handle_movement(delta):
	var direction_P1 := Input.get_axis("p1_cima", "p1_baixo")
	var direction_P2 := Input.get_axis("p2_cima", "p2_baixo")
	if jogador1:
		position.y += direction_P1 * velocidade_do_jogador * delta
	else:
		position.y += direction_P2 * velocidade_do_jogador * delta

func limit_map() -> void:
	position.y = clamp(position.y, 64, 656)

func _process(delta: float) -> void:
	limit_map()
	_handle_movement(delta)
