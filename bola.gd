extends Area2D

var speed_ball : int = 500
var posicao_initial : Vector2 = Vector2(640, 360)
var direction_initial : Vector2 = Vector2(0, 0)
var new_direction : Vector2 = Vector2(0, 0)
var y_min : float = 0
var y_max : float = 720

func resetBall() -> void:
	position = posicao_initial
	random_direction_initial()

func random_direction_initial() -> void:
	var x_random = [-1,1].pick_random()
	var y_random = [-1,1].pick_random()
	
	direction_initial = Vector2(x_random, y_random)
	new_direction = direction_initial

func move_ball(delta) -> void:
	position += new_direction * speed_ball * delta

func runTimer() -> void:
	$Timer.start()

func limit_map() -> void:
	if position.y >= y_max or position.y <= y_min:
		new_direction.y *= -1

func _ready() -> void:
	resetBall()

func _process(delta: float) -> void:
	limit_map()
	move_ball(delta)


func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		new_direction.x *= -1


func _on_timer_timeout() -> void:
	resetBall()
