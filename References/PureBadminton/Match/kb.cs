using System.IO;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public sealed class kb : kd
{
	public byte ltf;

	public MatchLogRecordType peu => MatchLogRecordType.ServeForced;

	public void eex(BinaryWriter a)
	{
		a.Write(ltf);
	}

	public static kb egj(BinaryReader a)
	{
		return new kb
		{
			ltf = a.ReadByte()
		};
	}
}
