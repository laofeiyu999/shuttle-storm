using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class js : kd
{
	public const byte lqq = 0;

	public const byte lqr = 1;

	public const byte lqs = 2;

	public bool lqt;

	public byte lqu;

	public byte lqv;

	public uint lqw;

	public sbyte lqx;

	public sbyte lqy;

	public sbyte lqz;

	public sbyte lra;

	public sbyte lrb;

	public ushort lrc;

	public sbyte lrd;

	public sbyte lre;

	public MatchLogRecordType peu
	{
		get
		{
			if (!lqt)
			{
				return MatchLogRecordType.InputSent;
			}
			return MatchLogRecordType.InputReceived;
		}
	}

	public static js efr(bool a, byte b, byte c, uint d, Vector2 e, Vector2 f, int g, float h, Vector2 i)
	{
		return new js
		{
			lqt = a,
			lqu = b,
			lqv = c,
			lqw = d,
			lqx = kc.egk(e.x),
			lqy = kc.egk(e.y),
			lqz = kc.egk(f.x),
			lra = kc.egk(f.y),
			lrb = (sbyte)Mathf.Clamp(g, -1, 127),
			lrc = kc.egm(h),
			lrd = kc.egk(i.x),
			lre = kc.egk(i.y)
		};
	}

	public bool efs(js a)
	{
		if (a != null && lqx == a.lqx && lqy == a.lqy && lqz == a.lqz && lra == a.lra && lrb == a.lrb && lrc == a.lrc && lrd == a.lrd)
		{
			return lre == a.lre;
		}
		return false;
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lqu);
		a.Write(lqv);
		a.Write(lqw);
		a.Write(lqx);
		a.Write(lqy);
		a.Write(lqz);
		a.Write(lra);
		a.Write(lrb);
		a.Write(lrc);
		a.Write(lrd);
		a.Write(lre);
	}

	public static js eft(bool a, BinaryReader b)
	{
		return new js
		{
			lqt = a,
			lqu = b.ReadByte(),
			lqv = b.ReadByte(),
			lqw = b.ReadUInt32(),
			lqx = b.ReadSByte(),
			lqy = b.ReadSByte(),
			lqz = b.ReadSByte(),
			lra = b.ReadSByte(),
			lrb = b.ReadSByte(),
			lrc = b.ReadUInt16(),
			lrd = b.ReadSByte(),
			lre = b.ReadSByte()
		};
	}
}
