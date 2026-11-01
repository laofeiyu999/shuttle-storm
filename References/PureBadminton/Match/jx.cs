using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jx : kd
{
	public byte lrz;

	public sbyte lsa;

	public ushort lsb;

	public sbyte lsc;

	public sbyte lsd;

	public MatchLogRecordType peu => MatchLogRecordType.PreShotInputs;

	public static jx egb(byte a, int b, float c, Vector2 d)
	{
		return new jx
		{
			lrz = a,
			lsa = (sbyte)Mathf.Clamp(b, -1, 127),
			lsb = kc.egm(c),
			lsc = kc.egk(d.x),
			lsd = kc.egk(d.y)
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lrz);
		a.Write(lsa);
		a.Write(lsb);
		a.Write(lsc);
		a.Write(lsd);
	}

	public static jx egc(BinaryReader a)
	{
		return new jx
		{
			lrz = a.ReadByte(),
			lsa = a.ReadSByte(),
			lsb = a.ReadUInt16(),
			lsc = a.ReadSByte(),
			lsd = a.ReadSByte()
		};
	}
}
