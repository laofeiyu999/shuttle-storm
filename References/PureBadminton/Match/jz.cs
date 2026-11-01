using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jz : kd
{
	public byte lsx;

	public CancelShotReason lsy;

	public MatchLogRecordType peu => MatchLogRecordType.CancelShot;

	public void eex(BinaryWriter a)
	{
		a.Write(lsx);
		a.Write((byte)lsy);
	}

	public static jz egg(BinaryReader a)
	{
		return new jz
		{
			lsx = a.ReadByte(),
			lsy = (CancelShotReason)((a.BaseStream.Position < a.BaseStream.Length) ? a.ReadByte() : 0)
		};
	}
}
