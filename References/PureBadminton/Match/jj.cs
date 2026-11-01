using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jj : kd
{
	public const byte lpp = 1;

	public const byte lpq = 2;

	public const byte lpr = 4;

	public const byte lps = 8;

	public const byte lpt = 16;

	public byte lpu;

	public ScoreCheckWire lpv;

	public MatchLogRecordType peu => MatchLogRecordType.RallyEnd;

	public static jj efc(RallyEndInfo a, ScoreCheck b)
	{
		return new jj
		{
			lpu = (byte)((a.LastShotByTeamA ? 1u : 0u) | (a.TouchedPartner ? 2u : 0u) | (a.TouchedOpponent ? 4u : 0u) | (a.EndedOut ? 8u : 0u) | (a.EndedInNet ? 16u : 0u)),
			lpv = ScoreCheckWire.eez(b)
		};
	}

	public void eex(BinaryWriter a)
	{
		a.Write(lpu);
		lpv.efa(a);
	}

	public static jj efd(BinaryReader a)
	{
		return new jj
		{
			lpu = a.ReadByte(),
			lpv = ScoreCheckWire.efb(a)
		};
	}
}
