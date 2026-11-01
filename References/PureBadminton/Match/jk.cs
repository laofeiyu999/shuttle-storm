using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class jk : kd
{
	public byte lpw;

	public byte lpx;

	public MatchLogRecordType peu => MatchLogRecordType.Intensity;

	public void eex(BinaryWriter a)
	{
		a.Write(lpw);
		a.Write(lpx);
	}

	public static jk efe(BinaryReader a)
	{
		return new jk
		{
			lpw = a.ReadByte(),
			lpx = a.ReadByte()
		};
	}
}
