using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class ju : kd
{
	public byte lrl;

	public short lrm;

	public short lrn;

	public short lro;

	public short lrp;

	public MatchLogRecordType peu => MatchLogRecordType.Clamp;

	public static ju efw(byte a, Vector3 b, Vector3 c)
	{
		return new ju
		{
			lrl = a,
			lrm = kc.ego(b.x),
			lrn = kc.ego(b.z),
			lro = kc.ego(c.x),
			lrp = kc.ego(c.z)
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lrl);
		a.Write(lrm);
		a.Write(lrn);
		a.Write(lro);
		a.Write(lrp);
	}

	public static ju efx(BinaryReader a)
	{
		return new ju
		{
			lrl = a.ReadByte(),
			lrm = a.ReadInt16(),
			lrn = a.ReadInt16(),
			lro = a.ReadInt16(),
			lrp = a.ReadInt16()
		};
	}
}
