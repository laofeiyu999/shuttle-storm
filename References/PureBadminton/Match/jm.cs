using System;
using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jm : kd
{
	public const ushort lqa = ushort.MaxValue;

	public string lqb = "";

	public ushort lqc = ushort.MaxValue;

	public ushort lqd = ushort.MaxValue;

	public MatchLogRecordType peu => MatchLogRecordType.Rtt;

	public static jm efg(string a, long b)
	{
		return new jm
		{
			lqb = (a ?? ""),
			lqc = (ushort)Math.Min(b, 65534L)
		};
	}

	public static jm efh(string a, float b)
	{
		return new jm
		{
			lqb = (a ?? ""),
			lqd = (ushort)Math.Min((long)Math.Round(b * 1000f), 65534L)
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lqb);
		a.Write(lqc);
		a.Write(lqd);
	}

	public static jm efi(BinaryReader a)
	{
		return new jm
		{
			lqb = a.ReadString(),
			lqc = a.ReadUInt16(),
			lqd = a.ReadUInt16()
		};
	}
}
