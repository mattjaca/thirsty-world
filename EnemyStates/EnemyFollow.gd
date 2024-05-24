extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed = 40.0
var Enemy2: CharacterBody2D

func Enter():
	Enemy2 = get_tree().get_first_node_in_group("Enemy2")
	
func PhysicsUpdate(delta: float):
	var direction = Enemy2.global_position - enemy.global_position
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		
	if direction.length() > 50:
		Transitioned.emit(self, "EnemyWander")
	
	
	
