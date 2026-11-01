using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qf
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class qe
	{
		public Type mre;

		public string mrf;

		public ushort mrg;

		public void fzi()
		{
			ushort num = mrg;
			ushort num2 = (ushort)((mre == typeof(Career)) ? 2 : 3);
			if (num > num2)
			{
				throw new Exception($"This Career save file version {num} is not supported (max supported version: {num2})");
			}
			if (num < num2)
			{
				string fileName = Path.GetFileName(mrf);
				string path = ((mre == typeof(Career)) ? qa.mrd : qa.mrb);
				File.Copy(mrf, Path.Combine(path, $"{fileName}.bak_v{num}"), overwrite: true);
			}
			while (num < num2)
			{
				try
				{
					if (mre == typeof(Career))
					{
						oi.fqt(num, mrf);
					}
					if (mre == typeof(Tournament))
					{
						tc.gpt(num, mrf);
					}
					num++;
				}
				catch (Exception ex)
				{
					Debug.LogError($"Unable to migrate {mrf} from version {num} to {num + 1}:");
					Debug.LogException(ex);
					throw new Exception("Unable to migrate file", ex);
				}
			}
		}
	}

	public static List<qe> fzk()
	{
		List<qe> list = new List<qe>();
		if (Directory.Exists(qa.mra))
		{
			string[] files = Directory.GetFiles(qa.mra, "*.save");
			foreach (string text in files)
			{
				ushort? num = fzl<Tournament>(text);
				if (num.HasValue && num < 3)
				{
					list.Add(new qe
					{
						mre = typeof(Tournament),
						mrf = text,
						mrg = num.Value
					});
				}
			}
		}
		if (Directory.Exists(qa.mrc))
		{
			string[] files = Directory.GetFiles(qa.mrc, "*.save");
			foreach (string text2 in files)
			{
				ushort? num2 = fzl<Career>(text2);
				if (num2.HasValue && num2 < 2)
				{
					list.Add(new qe
					{
						mre = typeof(Career),
						mrf = text2,
						mrg = num2.Value
					});
				}
			}
		}
		if (list.Any((qe a) => a.mrg == 0))
		{
			na.Initialize();
		}
		return list;
	}

	public static ushort? fzl<a>(string a) where a : qb
	{
		using FileStream a2 = File.OpenRead(a);
		return fzm<a>(a2, a);
	}

	public static ushort? fzm<b>(FileStream a, string b) where b : qb
	{
		try
		{
			a.Seek(0L, SeekOrigin.Begin);
			byte[] array = new byte[4];
			a.Read(array);
			if (!array.SequenceEqual((typeof(b) == typeof(Career)) ? ng.mln : sb.myt))
			{
				int num = ((typeof(b) == typeof(Career)) ? 128 : 8);
				a.Seek(num, SeekOrigin.Begin);
				byte[] array2 = new byte[8];
				a.Read(array2);
				DateTime dateTime = DateTime.FromBinary(BitConverter.ToInt64(array2));
				if (dateTime.Year > 2020 && dateTime.Year < 3000)
				{
					return 0;
				}
				return null;
			}
			a.Seek((typeof(b) == typeof(Career)) ? 4 : 4, SeekOrigin.Begin);
			byte[] array3 = new byte[2];
			a.Read(array3);
			return BitConverter.ToUInt16(array3);
		}
		catch (Exception exception)
		{
			Debug.LogError("Unable to parse file version from file " + b);
			Debug.LogException(exception);
			return null;
		}
	}

	public static ushort fzn<c>() where c : qb
	{
		if (!(typeof(c) == typeof(Career)))
		{
			return 3;
		}
		return 2;
	}

	public static void fzo<d>(string a, string b) where d : qb
	{
		ushort? num = fzl<d>(a);
		if (num.HasValue)
		{
			ushort num2 = fzn<d>();
			if (num < num2)
			{
				qe qe = new qe();
				qe.mre = typeof(d);
				qe.mrf = a;
				qe.mrg = num.Value;
				qe.fzi();
			}
		}
	}
}
