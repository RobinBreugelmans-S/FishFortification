using Godot;
using System;

public partial class Projectile : Sprite2D
{
	private int dmg;
	private float radius;
	private Vector2 vel;

	public void SetValues(int damage, float radius, Vector2 velocity)
	{
		dmg = damage;
		this.radius = radius;
		vel = velocity;
	}

	override public void _PhysicsProcess(double delta)
	{
		//TODO: add doing damage
		Position += vel;
	}

}
