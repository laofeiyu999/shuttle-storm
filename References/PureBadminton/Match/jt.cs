using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jt : kd
{
	public bool lrf;

	public byte lrg;

	public uint lrh;

	public short lri;

	public short lrj;

	public short lrk;

	public MatchLogRecordType peu
	{
		get
		{
			if (!lrf)
			{
				return MatchLogRecordType.StateSent;
			}
			return MatchLogRecordType.StateReceived;
		}
	}

	public static jt efu(bool a, byte b, uint c, Vector3 d, float e)
	{
		return new jt
		{
			lrf = a,
			lrg = b,
			lrh = c,
			lri = kc.ego(d.x),
			lrj = kc.ego(d.z),
			lrk = kc.egq(e)
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lrg);
		a.Write(lrh);
		a.Write(lri);
		a.Write(lrj);
		a.Write(lrk);
	}

	public static jt efv(bool a, BinaryReader b)
	{
		return new jt
		{
			lrf = a,
			lrg = b.ReadByte(),
			lrh = b.ReadUInt32(),
			lri = b.ReadInt16(),
			lrj = b.ReadInt16(),
			lrk = b.ReadInt16()
		};
	}
}
