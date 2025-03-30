using Godot;
using System;
using System.Collections.Generic;
using System.Diagnostics;

public partial class Enemy : Sprite2D
{
	public int Hp = 12;
	public int Spd = 69;
	public bool Slowed = false;
	private PathFollow2D track;

	//TODO: add presets for enemy type
	public Enemy()
	{

	}

	override public void _Ready()
	{
		track = GetParent<PathFollow2D>();
		AddToGroup("enemy");
	}

	override public void _PhysicsProcess(double delta)
	{
		track.Progress += Spd * (float)delta;

		if(track.ProgressRatio == 1)
		{
			damageBaseAndDie();
		}
	}

	private void damageBaseAndDie()
	{
		GetTree().GetCurrentScene().Call("damage_base", Hp);
		die();
	}
	
	public void DoDamage(int dmg)
	{
		Hp -= dmg;
		if(Hp <= 0)
		{
			die();
		}
	}
	
	private void die()
	{
		GetParent().QueueFree();
	}
}
