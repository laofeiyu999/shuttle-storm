using System.IO;
using System.IO.Compression;
using System.Text;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class tu
{
	private static void grc(Stream a, Stream b)
	{
		byte[] array = new byte[4096];
		int count;
		while ((count = a.Read(array, 0, array.Length)) != 0)
		{
			b.Write(array, 0, count);
		}
	}

	public static byte[] grd(string a)
	{
		using MemoryStream a2 = new MemoryStream(Encoding.UTF8.GetBytes(a));
		using MemoryStream memoryStream = new MemoryStream();
		using (GZipStream b = new GZipStream(memoryStream, CompressionMode.Compress))
		{
			grc(a2, b);
		}
		return memoryStream.ToArray();
	}

	public static string gre(byte[] a)
	{
		using MemoryStream stream = new MemoryStream(a);
		using MemoryStream memoryStream = new MemoryStream();
		using (GZipStream a2 = new GZipStream(stream, CompressionMode.Decompress))
		{
			grc(a2, memoryStream);
		}
		return Encoding.UTF8.GetString(memoryStream.ToArray());
	}
}
