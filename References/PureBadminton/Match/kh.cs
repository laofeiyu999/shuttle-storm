using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Text;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class kh
{
	public const uint ltj = 262144u;

	public static string ehf(int a, bool b)
	{
		return string.Format("{0:000}{1}.pblog", a, b ? ".final" : "");
	}

	public static byte[] ehg(MatchLogSliceHeader a, IReadOnlyList<MatchLogRecord> b)
	{
		using MemoryStream memoryStream = new MemoryStream();
		using (BinaryWriter a2 = new BinaryWriter(memoryStream, Encoding.UTF8, leaveOpen: true))
		{
			a.ehc(a2);
		}
		using (GZipStream output = new GZipStream(memoryStream, CompressionLevel.Optimal, leaveOpen: true))
		{
			using BinaryWriter binaryWriter = new BinaryWriter(output, Encoding.UTF8, leaveOpen: true);
			using MemoryStream memoryStream2 = new MemoryStream();
			using BinaryWriter binaryWriter2 = new BinaryWriter(memoryStream2, Encoding.UTF8, leaveOpen: true);
			uint num = a.StartTick;
			foreach (MatchLogRecord item in b)
			{
				uint num2 = Math.Max(item.Tick, num);
				ehi(binaryWriter, num2 - num);
				num = num2;
				memoryStream2.SetLength(0L);
				item.Payload.eex(binaryWriter2);
				binaryWriter2.Flush();
				binaryWriter.Write((byte)item.Payload.peu);
				ehi(binaryWriter, (uint)memoryStream2.Length);
				binaryWriter.Write(memoryStream2.GetBuffer(), 0, (int)memoryStream2.Length);
			}
		}
		return memoryStream.ToArray();
	}

	public static (MatchLogSliceHeader Header, List<MatchLogRecord> Records) ehh(byte[] a)
	{
		try
		{
			using MemoryStream memoryStream = new MemoryStream(a ?? new byte[0]);
			MatchLogSliceHeader item;
			using (BinaryReader a2 = new BinaryReader(memoryStream, Encoding.UTF8, leaveOpen: true))
			{
				item = MatchLogSliceHeader.ehd(a2);
			}
			List<MatchLogRecord> list = new List<MatchLogRecord>();
			using GZipStream a3 = new GZipStream(memoryStream, CompressionMode.Decompress);
			uint num = item.StartTick;
			uint b;
			while (ehj(a3, out b))
			{
				num += b;
				int num2 = ehk(a3);
				if (!ehj(a3, out var b2))
				{
					throw new MatchLogFormatException("truncated record");
				}
				if (b2 > 262144)
				{
					throw new MatchLogFormatException($"record too long ({b2} bytes)");
				}
				byte[] b3 = ehl(a3, (int)b2);
				kd payload;
				try
				{
					payload = jr.efq((MatchLogRecordType)num2, b3);
				}
				catch (MatchLogFormatException)
				{
					throw;
				}
				catch (Exception inner)
				{
					throw new MatchLogFormatException("corrupt record payload", inner);
				}
				list.Add(new MatchLogRecord(num, payload));
			}
			return (Header: item, Records: list);
		}
		catch (MatchLogFormatException)
		{
			throw;
		}
		catch (Exception ex3) when (ex3 is EndOfStreamException || ex3 is InvalidDataException || ex3 is IOException || ex3 is ArgumentException)
		{
			throw new MatchLogFormatException("corrupt or truncated slice", ex3);
		}
	}

	private static void ehi(BinaryWriter a, uint b)
	{
		while (b >= 128)
		{
			a.Write((byte)(b | 0x80u));
			b >>= 7;
		}
		a.Write((byte)b);
	}

	private static bool ehj(Stream a, out uint b)
	{
		b = 0u;
		int num = a.ReadByte();
		if (num < 0)
		{
			return false;
		}
		int num2 = 0;
		int num3 = num;
		while (true)
		{
			b |= (uint)((num3 & 0x7F) << num2);
			if ((num3 & 0x80) == 0)
			{
				return true;
			}
			num2 += 7;
			if (num2 > 28)
			{
				break;
			}
			num3 = ehk(a);
		}
		throw new MatchLogFormatException("varint too long");
	}

	private static int ehk(Stream a)
	{
		int num = a.ReadByte();
		if (num < 0)
		{
			throw new MatchLogFormatException("truncated record");
		}
		return num;
	}

	private static byte[] ehl(Stream a, int b)
	{
		byte[] array = new byte[b];
		int num;
		for (int i = 0; i < b; i += num)
		{
			num = a.Read(array, i, b - i);
			if (num <= 0)
			{
				throw new MatchLogFormatException("truncated payload");
			}
		}
		return array;
	}
}
