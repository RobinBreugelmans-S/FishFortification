using Godot;
using System;
using System.Collections.Generic;
using System.Diagnostics;

public partial class Enemy : Sprite2D
{
	private int hp;
	private float spd = 69f;
	private PathFollow2D track;

	//TODO: add presets for enemy type
	public Enemy()
	{

	}

	override public void _Ready()
	{
		track = GetParent<PathFollow2D>();
	}

	override public void _PhysicsProcess(double delta)
	{
		track.Progress += spd * (float)delta;
	}
}
