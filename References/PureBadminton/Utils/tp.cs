using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public abstract class tp
{
	public string nch;

	public string nci;

	public int? ncj;

	public int? nck;

	public (int, int, int) ncl;

	public abstract ExerciseType pot { get; }

	public int gqy(MedalType a)
	{
		return a switch
		{
			MedalType.Bronze => ncl.Item1, 
			MedalType.Silver => ncl.Item2, 
			_ => ncl.Item3, 
		};
	}

	public MedalType? gqz(int a)
	{
		if (a >= ncl.Item3)
		{
			return MedalType.Gold;
		}
		if (a >= ncl.Item2)
		{
			return MedalType.Silver;
		}
		if (a >= ncl.Item1)
		{
			return MedalType.Bronze;
		}
		return null;
	}
}
