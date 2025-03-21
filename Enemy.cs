using Godot;
using System;
using System.Collections.Generic;

public partial class Enemy : Sprite2D
{
	public int HP;
	public float spd = 69f;
	public List<Vector2> track = new() { new(0, 174), new(120, 160), new(254, 111), new(230, 196), new(730, 120) };
	public int trackIndex = 1;
	override public void _Ready()
	{
		//TODO
		//track = GetNode<Path2D>(new NodePath("../Map/Path").Curve();
		Position = track[0];
	}
	override public void _PhysicsProcess(double delta)
	{
		Vector2 toNext = track[trackIndex] - Position;
		if (toNext.Length() <= 2)
		{
			trackIndex++;
			toNext = track[trackIndex] - Position;
		}

		Position += toNext.Normalized() * (float)delta * spd;
	}
}
