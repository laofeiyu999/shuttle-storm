using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jo : kd
{
	public ushort lqg;

	public float lqh;

	public byte lqi;

	public string lqj = "";

	public byte lqk;

	public MatchLogRecordType peu => MatchLogRecordType.Connection;

	public static jo efm(int a, MatchAbsenceEvent b)
	{
		return new jo
		{
			lqg = (ushort)a,
			lqh = b.MatchTime,
			lqi = (byte)b.Kind,
			lqj = (b.SubjectPlayerId ?? ""),
			lqk = (byte)b.Probe
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lqg);
		a.Write(lqh);
		a.Write(lqi);
		a.Write(lqj);
		a.Write(lqk);
	}

	public static jo efn(BinaryReader a)
	{
		return new jo
		{
			lqg = a.ReadUInt16(),
			lqh = a.ReadSingle(),
			lqi = a.ReadByte(),
			lqj = a.ReadString(),
			lqk = a.ReadByte()
		};
	}
}
