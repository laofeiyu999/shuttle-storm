using System;
using System.IO;
using System.Text;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class ng : qc
{
	public const int mlm = 4;

	public static readonly byte[] mln = new byte[4] { 80, 66, 27, 145 };

	public ushort mlo { get; set; }

	public string mlp { get; set; }

	public DateTime mlq { get; set; }

	public byte[] fjj()
	{
		using MemoryStream memoryStream = new MemoryStream();
		memoryStream.Write(mln);
		memoryStream.Write(BitConverter.GetBytes(mlo));
		memoryStream.Write(Encoding.UTF8.GetBytes(mlp.PadRight(128, ' ')));
		memoryStream.Write(BitConverter.GetBytes(mlq.Ticks));
		return memoryStream.ToArray();
	}

	public static ng fjk(byte[] a)
	{
		return new ng
		{
			mlo = BitConverter.ToUInt16(a, 4),
			mlp = Encoding.UTF8.GetString(a, 6, 128).TrimEnd(),
			mlq = DateTime.FromBinary(BitConverter.ToInt64(a, 134))
		};
	}
}
