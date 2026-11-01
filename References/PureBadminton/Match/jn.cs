using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jn : kd
{
	public byte lqe;

	public ScoreCheckWire lqf;

	public MatchLogRecordType peu => MatchLogRecordType.Resync;

	public static jn efj()
	{
		return new jn
		{
			lqe = 0
		};
	}

	public static jn efk(ScoreCheck a)
	{
		return new jn
		{
			lqe = 1,
			lqf = ScoreCheckWire.eez(a)
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lqe);
		lqf.efa(a);
	}

	public static jn efl(BinaryReader a)
	{
		return new jn
		{
			lqe = a.ReadByte(),
			lqf = ScoreCheckWire.efb(a)
		};
	}
}
