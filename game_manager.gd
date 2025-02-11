extends Node2D

var point_player1 : int = 0
var point_player2 : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gol_1_area_entered(area: Area2D) -> void:
	point_player2 += 1
	$"../pointPlayer2".text =  str(point_player2)
	$"../bola".runTimer()

func _on_gol_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	point_player1 += 1
	$"../pointPlayer1".text = str(point_player1)
	$"../bola".runTimer()
