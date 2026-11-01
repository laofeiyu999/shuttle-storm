using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class jd
{
	public const float lop = 1.2f;

	public static float edf(float a, int b, bool c)
	{
		float num = 1f + ((195f - (float)b) / 200f).gtg(0f, 0.15f);
		return (0.8f + 0.3f * CharacterStats.ftj(a)) * num * (c ? 1f : 1.2f);
	}

	public static float edg(float a)
	{
		return ((a - 0.1f) / 0.5f).gtg(0f, 1f);
	}

	public static float edh(float a)
	{
		return 0.75f + 0.25f * a;
	}

	public static float edi(CharacterIntensityLevel a)
	{
		return a switch
		{
			CharacterIntensityLevel.Efficient => 0.85f, 
			CharacterIntensityLevel.Aggressive => 1.2f, 
			_ => 1f, 
		};
	}

	public static float edj(float a, float b, CharacterIntensityLevel c, float d)
	{
		return CharacterMovementManager.MaxRunAnimationSpeed * d * a * edh(b) * edi(c);
	}

	public static float edk(float a, float b)
	{
		return a * 1.2f * b;
	}
}
