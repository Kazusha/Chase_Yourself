extends Area2D
signal hit 

@export var speed = 200
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y +=1
	if Input.is_action_pressed("move_top"):
		velocity.y -=1
			
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		$AnimatedSprite2D2.play()
	else:
		$AnimatedSprite2D2.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO , screen_size)	
	if velocity.x !=0 :
		$AnimatedSprite2D2.animation = "move_r"
		$AnimatedSprite2D2.flip_h = velocity.x <0
	if velocity.y !=0 :
		$AnimatedSprite2D2.animation = "down"


func _on_body_entered(body: Node2D):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled" , true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
