using Godot;
using System;
using System.Collections.Generic;
using System.Diagnostics;

public partial class Enemy : Sprite2D
{
	public int Hp = 12;
	public int Spd = 69;
	public int MoneyReward = 16;
	
	public bool Slowed = false;
	
	private PathFollow2D track;

	private Node levelLogic;

	//TODO: add presets for enemy type
	public void SetValues(int[] values) //int hp, int spd, int moneyReward
	{
		Hp = values[0];
		Spd = values[1];
		MoneyReward = values[2];
	}

	override public void _Ready()
	{
		levelLogic = GetNode("/root/Level");
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
		GetParent().QueueFree();
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
		levelLogic.Set("money",
			(int) levelLogic.Get("money") + MoneyReward
		);
		GetParent().QueueFree();
	}
}
