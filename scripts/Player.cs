using Godot;
using System;

public partial class Player : Sprite2D
{
	public float max_movement_speed;
	public double attack_cooldown;
	private Node levelLogic;
	// public Vector2 position;
	public Vector2 movement_speed;
	public float speed_damping;
	
	public enum Direction{
		UP, DOWN, LEFT, RIGHT
	}

	public Player()
	{
		this.movement_speed = Vector2.Zero;
		this.Position = new Vector2(500, 500);
		this.speed_damping = 0.90f;  // Should be in the domain [0, 1]
		this.max_movement_speed = 10f;
	}

	public override void _Ready()
	{
		this.levelLogic = GetNode("/root/Level");
		AddToGroup("player");
	}

	public override void _PhysicsProcess(double delta)
	{
		this.Position += this.movement_speed;
		this.movement_speed *= this.speed_damping;
	}

	public void Move(Direction direction){
		const float add_speed = 1f;

		switch(direction){
			case Direction.UP:
				this._Move(new Vector2(0, -1) * add_speed);
				break;
			case Direction.DOWN:
				this._Move(new Vector2(0, 1) * add_speed);
				break;
			case Direction.LEFT:
				this._Move(new Vector2(-1, 0) * add_speed);
				break;
			case Direction.RIGHT:
				this._Move(new Vector2(1, 0) * add_speed);
				break;
		}
	}
	
	private void _Move(Vector2 speed){
		this.movement_speed += speed;

		if(this.movement_speed.Length() > this.max_movement_speed) this.movement_speed = this.movement_speed.Normalized() * max_movement_speed;
	}

	public void Attack(){
	}

}
