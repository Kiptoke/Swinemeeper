extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$GPUParticles2D.emitting = true
	$GPUParticles2D.restart()
	$AnimatedSprite2D.play()
	$ExplosionAudio.play()
	$PigAudio.play()

func _on_gpu_particles_2d_finished():
	queue_free()

