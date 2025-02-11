# Pong em Godot 4 - Tutorial

Este projeto foi baseado no tutorial do canal [Desenvolvendo Jogos](https://youtu.be/AAIxswnnVtg).

## Descrição

Recriação do clássico jogo Pong usando Godot 4, onde dois jogadores competem rebatendo uma bola.

## Como Criar o Projeto

1. Crie um novo projeto no Godot 4
2. Estrutura de pastas recomendada:
   ```
   res://
   ├── assets/
   │   ├── fonts/
   │   ├── sounds/
   │   └── sprites/
   └── scenes/
   ```

## Scripts Principais

```gdscript
# filepath: res://scenes/Ball.gd
extends CharacterBody2D

var speed = 600
var direction = Vector2.ZERO

func _ready():
    randomize()
    direction.x = [1,-1].pick_random()
    direction.y = [1,-1].pick_random()

func _physics_process(delta):
    velocity = direction * speed
    move_and_slide()
```

```gdscript
# filepath: res://scenes/Player.gd
extends CharacterBody2D

var speed = 400

func _physics_process(delta):
    var direction = Input.get_axis("ui_up", "ui_down")
    velocity.y = direction * speed
    move_and_slide()
```

## Configuração dos Inputs

No menu Project > Project Settings > Input Map, adicione:

- ui_up: W (Player 1), Seta para Cima (Player 2)
- ui_down: S (Player 1), Seta para Baixo (Player 2)

## Assets Necessários

- Retângulo branco para raquetes (32x128 pixels)
- Círculo branco para bola (16x16 pixels)

## Nós Principais

1. Node2D (root)
   - CharacterBody2D (Player 1)
     - CollisionShape2D
     - Sprite2D
   - CharacterBody2D (Player 2)
     - CollisionShape2D
     - Sprite2D
   - CharacterBody2D (Ball)
     - CollisionShape2D
     - Sprite2D

## Links Úteis

- [Tutorial Original](https://youtu.be/AAIxswnnVtg)
- [Documentação Godot 4](https://docs.godotengine.org/en/stable/)
