using System.IO;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jy : kd
{
	public byte lse;

	public uint lsf;

	public float lsg;

	public float lsh;

	public float lsi;

	public float lsj;

	public float lsk;

	public float lsl;

	public sbyte lsm;

	public bool lsn;

	public float lso;

	public ushort lsp;

	public bool lsq;

	public sbyte lsr;

	public sbyte lss;

	public float lst;

	public bool lsu;

	public string lsv = "";

	public bool lsw;

	public MatchLogRecordType peu => MatchLogRecordType.AuthShot;

	public static jy egd(byte a, uint b, Vector3 c, Vector3 d, ShotType e)
	{
		return new jy
		{
			lse = a,
			lsf = b,
			lsg = c.x,
			lsh = c.y,
			lsi = c.z,
			lsj = d.x,
			lsk = d.y,
			lsl = d.z,
			lsm = (sbyte)e
		};
	}

	public static jy ege(byte a, uint b, Vector3 c, Vector3 d, ShotType e, ShotInputsSnapshot f)
	{
		jy obj = egd(a, b, c, d, e);
		obj.lsn = true;
		obj.lso = f.ArrivalSpeed;
		obj.lsp = kc.egm(f.Power);
		obj.lsq = f.PowerProjected;
		obj.lsr = kc.egk(f.Direction.x);
		obj.lss = kc.egk(f.Direction.y);
		obj.lst = f.EnergyFactor;
		obj.lsu = f.Aggressive;
		obj.lsv = f.Animation ?? "";
		obj.lsw = f.RallyStarted;
		return obj;
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lse);
		a.Write(lsf);
		a.Write(lsg);
		a.Write(lsh);
		a.Write(lsi);
		a.Write(lsj);
		a.Write(lsk);
		a.Write(lsl);
		a.Write(lsm);
		a.Write(lsn);
		if (lsn)
		{
			a.Write(lso);
			a.Write(lsp);
			a.Write(lsq);
			a.Write(lsr);
			a.Write(lss);
			a.Write(lst);
			a.Write(lsu);
			a.Write(lsv);
			a.Write(lsw);
		}
	}

	public static jy egf(BinaryReader a)
	{
		jy jy2 = new jy
		{
			lse = a.ReadByte(),
			lsf = a.ReadUInt32(),
			lsg = a.ReadSingle(),
			lsh = a.ReadSingle(),
			lsi = a.ReadSingle(),
			lsj = a.ReadSingle(),
			lsk = a.ReadSingle(),
			lsl = a.ReadSingle(),
			lsm = a.ReadSByte(),
			lsn = a.ReadBoolean()
		};
		if (!jy2.lsn)
		{
			return jy2;
		}
		jy2.lso = a.ReadSingle();
		jy2.lsp = a.ReadUInt16();
		jy2.lsq = a.ReadBoolean();
		jy2.lsr = a.ReadSByte();
		jy2.lss = a.ReadSByte();
		jy2.lst = a.ReadSingle();
		jy2.lsu = a.ReadBoolean();
		jy2.lsv = a.ReadString();
		jy2.lsw = a.ReadBoolean();
		return jy2;
	}
}
