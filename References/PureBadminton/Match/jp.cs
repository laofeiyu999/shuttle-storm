using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jp : kd
{
	public const int lql = 128;

	public string lqm = "";

	public string lqn = "";

	public MatchLogRecordType peu => MatchLogRecordType.Alert;

	public static jp efo(string a, string b)
	{
		return new jp
		{
			lqm = (a ?? ""),
			lqn = kc.egs(b, 128)
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lqm);
		a.Write(lqn);
	}

	public static jp efp(BinaryReader a)
	{
		return new jp
		{
			lqm = a.ReadString(),
			lqn = a.ReadString()
		};
	}
}
