using System;
using System.IO;
using System.Text;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class sb : qc
{
	public static readonly byte[] myt = new byte[4] { 80, 66, 27, 144 };

	public const int myy = 4;

	public ushort mlo { get; set; }

	public string myv { get; set; }

	public TournamentCategory myw { get; set; }

	public DateTime mlq { get; set; }

	public byte[] fjj()
	{
		using MemoryStream memoryStream = new MemoryStream();
		memoryStream.Write(myt);
		memoryStream.Write(BitConverter.GetBytes(mlo));
		memoryStream.Write(Encoding.UTF8.GetBytes(myv.PadRight(64, ' ')));
		memoryStream.Write(BitConverter.GetBytes((int)myw));
		memoryStream.Write(BitConverter.GetBytes(mlq.Ticks));
		return memoryStream.ToArray();
	}

	public static sb gkb(byte[] a)
	{
		return new sb
		{
			mlo = BitConverter.ToUInt16(a, 4),
			myv = Encoding.UTF8.GetString(a, 6, 64).TrimEnd(),
			myw = (TournamentCategory)BitConverter.ToInt32(a, 70),
			mlq = DateTime.FromBinary(BitConverter.ToInt64(a, 74))
		};
	}
}
