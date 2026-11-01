using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class vk
{
	private static Sprite psl => Resources.Load<Sprite>("Images/Medals/Placeholder");

	private static Sprite psm => Resources.Load<Sprite>("Images/Medals/Bronze");

	private static Sprite psn => Resources.Load<Sprite>("Images/Medals/Silver");

	private static Sprite pso => Resources.Load<Sprite>("Images/Medals/Gold");

	private static Sprite psp => Resources.Load<Sprite>("Images/MedalsSmall/Placeholder");

	private static Sprite psq => Resources.Load<Sprite>("Images/MedalsSmall/Bronze");

	private static Sprite psr => Resources.Load<Sprite>("Images/MedalsSmall/Silver");

	private static Sprite pss => Resources.Load<Sprite>("Images/MedalsSmall/Gold");

	public static Sprite hgm(MedalType? a)
	{
		return a switch
		{
			MedalType.Bronze => psm, 
			MedalType.Silver => psn, 
			MedalType.Gold => pso, 
			_ => psl, 
		};
	}

	public static Sprite hgr(MedalType? a)
	{
		return a switch
		{
			MedalType.Bronze => psq, 
			MedalType.Silver => psr, 
			MedalType.Gold => pss, 
			_ => throw new NotImplementedException(), 
		};
	}
}
