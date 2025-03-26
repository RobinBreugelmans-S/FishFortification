using Godot;
using System;
using System.Collections.Generic;
using System.Diagnostics;

public partial class Enemy : Sprite2D
{
	public int hp = 12;
	private int spd = 69;
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
		track.Progress += spd * (float)delta;

		if(track.ProgressRatio == 1)
		{
			damageBaseAndDie();
		}
	}

	private void damageBaseAndDie()
	{
		GetTree().GetCurrentScene().Call("damage_base", hp);
		die();
	}
	
	public void DoDamage(int dmg)
	{
		hp -= dmg;
		if(hp <= 0)
		{
			die();
		}
	}
	
	private void die()
	{
		GetParent().QueueFree();
	}
}
