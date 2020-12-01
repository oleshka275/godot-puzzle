extends KinematicBody2D

const SPEED = 50
const ACCELERATION = 20

var velocity = Vector2()

var swipe = ''
const SWIPED_SPEED = 10
var gameLoop = true

func _process(delta):
		
		if gameLoop:
			if swipe && swipe != 'swiped':
				if swipe == 'up':
					velocity.y = int(-SPEED*ACCELERATION)
					print(swipe)
				if swipe == 'down':
					velocity.y = int(SPEED*ACCELERATION)
					print(swipe)
				if swipe == 'right':
					velocity.x = int(-SPEED*ACCELERATION)
					print(swipe)	
				if swipe == 'left':
					velocity.x = int(SPEED*ACCELERATION)
					print(swipe)
				
				swipe = 'swiped'
			
		velocity.normalized()

		velocity = move_and_slide(velocity)
			
func _input(event):
	if event is InputEventScreenDrag:
		if !swipe:
			if event.relative.y < -SWIPED_SPEED:
				swipe = 'up'
				
			if event.relative.x < -SWIPED_SPEED:
				swipe = 'right'
				
			if event.relative.x > SWIPED_SPEED:
				swipe = 'left'
				
			if event.relative.y > SWIPED_SPEED:
				swipe = 'down'
				
	elif event is InputEventScreenTouch:
		if !event.pressed:
			swipe = ''
