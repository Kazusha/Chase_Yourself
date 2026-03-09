extends Node

@export var mob_scene: PackedScene
var score
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()



func game_over() -> void:
	$score_timer.stop()
	$mod_timer.stop()

func new_game():
	score =0 
	$TileMap/Player.start($start_position.position)	
	$start_timer.start()
	


func _on_start_timer_timeout():
	#$mod_timer.start()
	$score_timer.start()


func _on_score_timer_timeout():
	score +=1


func _on_mod_timer_timeout():
	var mob= mob_scene.instantiate()
	
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	#var direction = mob_spawn_location.rotation + PI / 2;
	#mob.position = mob_spawn_location.position;
	#var velocity = Vector2(randf_range(150.0 , 250.0) , 0.0)
	#mob.linear_velocity =  velocity.rotated(direction)
	
	add_child(mob)
