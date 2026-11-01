using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class wf
{
	private static Sprite pty => Resources.Load<Sprite>("Images/Trophies/Placeholder");

	private static Sprite ptz => Resources.Load<Sprite>("Images/Trophies/Bronze");

	private static Sprite pua => Resources.Load<Sprite>("Images/Trophies/Silver");

	private static Sprite pub => Resources.Load<Sprite>("Images/Trophies/Gold");

	public static Sprite hno(MedalType? a)
	{
		return a switch
		{
			MedalType.Bronze => ptz, 
			MedalType.Silver => pua, 
			MedalType.Gold => pub, 
			_ => pty, 
		};
	}
}
