using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class qa
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum SaveType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Tournament,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Career
	}

	public const int mqy = 256;

	private const int mqz = 4;

	public static readonly string mra = Path.Combine(Application.persistentDataPath, "Save", "Tournaments");

	public static readonly string mrb = Path.Combine(Application.persistentDataPath, "Save", "Tournaments", ".backups");

	public static readonly string mrc = Path.Combine(Application.persistentDataPath, "Save", "Careers");

	public static readonly string mrd = Path.Combine(Application.persistentDataPath, "Save", "Careers", ".backups");

	private static void fyw()
	{
		if (!Directory.Exists(mra))
		{
			Directory.CreateDirectory(mra);
		}
		if (!Directory.Exists(mrb))
		{
			Directory.CreateDirectory(mrb);
		}
		if (!Directory.Exists(mrc))
		{
			Directory.CreateDirectory(mrc);
		}
		if (!Directory.Exists(mrd))
		{
			Directory.CreateDirectory(mrd);
		}
	}

	private static Dictionary<string, b> fyx<a, b>(string a, Func<byte[], b> b) where a : qb where b : qc
	{
		fyw();
		FileInfo[] files = new DirectoryInfo(a).GetFiles("*.save");
		Dictionary<string, b> dictionary = new Dictionary<string, b>();
		FileInfo[] array = files;
		foreach (FileInfo fileInfo in array)
		{
			try
			{
				byte[] array2 = new byte[256];
				using (FileStream fileStream = File.OpenRead(fileInfo.FullName))
				{
					ushort? num = qf.fzm<a>(fileStream, fileInfo.FullName);
					if (num != qf.fzn<a>())
					{
						Debug.LogError($"Unable to open preview for save file {fileInfo.Name} (bad version {num})");
						continue;
					}
					fileStream.Seek(0L, SeekOrigin.Begin);
					fileStream.Read(array2);
				}
				b value = b(array2);
				dictionary.Add(fileInfo.FullName, value);
			}
			catch (Exception)
			{
				Debug.LogError("Unable to load preview from save file " + fileInfo.Name);
			}
		}
		return dictionary;
	}

	public static Career fyy(string a)
	{
		return fza<Career>(a, mrd);
	}

	public static Tournament fyz(string a)
	{
		return fza<Tournament>(a, mrb);
	}

	public static c fza<c>(string a, string b) where c : qb
	{
		fyw();
		string value = null;
		using (FileStream fileStream = File.OpenRead(a))
		{
			fileStream.Seek(256L, SeekOrigin.Begin);
			byte[] array = new byte[fileStream.Length - 256];
			fileStream.Read(array);
			value = tu.gre(array);
		}
		JsonSerializerSettings settings = new JsonSerializerSettings
		{
			Culture = CultureInfo.InvariantCulture,
			ContractResolver = new qd(),
			ConstructorHandling = ConstructorHandling.AllowNonPublicDefaultConstructor
		};
		return JsonConvert.DeserializeObject<c>(value, settings);
	}

	public static void fzb(string a)
	{
		File.Delete(a);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private static void Save<T>(T item, string folderPath, string backupsFolderPath) where T : qb
	{
		fyw();
		string text = item.pio + ".save";
		string text2 = Path.Combine(folderPath, text);
		if (File.Exists(text2))
		{
			string text3 = Path.Combine(backupsFolderPath, item.pio + ".save.bak");
			if (File.Exists(text3))
			{
				if (File.GetLastWriteTime(text2).Subtract(File.GetLastWriteTime(text3)).TotalDays > 1.0)
				{
					fzc(text3);
				}
				else
				{
					File.Delete(text3);
				}
			}
			File.Copy(text2, text3);
		}
		item.LastSavedDate = DateTime.Now;
		JsonSerializerSettings settings = new JsonSerializerSettings
		{
			Culture = CultureInfo.InvariantCulture,
			ContractResolver = new qd(),
			NullValueHandling = NullValueHandling.Ignore
		};
		Debug.Log("Saving file " + text + "...");
		string a = JsonConvert.SerializeObject(item, settings);
		IEnumerable<byte> enumerable = item.pip.fjj();
		if (enumerable.Count() < 256)
		{
			enumerable = enumerable.Concat(Enumerable.Repeat((byte)0, 256 - enumerable.Count()));
		}
		File.WriteAllBytes(text2, enumerable.Concat(tu.grd(a)).ToArray());
		Debug.Log("File " + text + " saved");
	}

	private static void fzc(string a, int b = 0)
	{
		string text = string.Format("{0}{1}", a, (b > 0) ? ((object)b) : "");
		string text2 = $"{a}{b + 1}";
		if (b >= 3)
		{
			File.Delete(text);
			return;
		}
		if (File.Exists(text2))
		{
			fzc(a, b + 1);
		}
		File.Move(text, text2);
	}

	public static Dictionary<string, sb> fzd()
	{
		return fyx<Tournament, sb>(mra, sb.gkb);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Save(Tournament tournament)
	{
		Save(tournament, mra, mrb);
	}

	public static void fze(Tournament a)
	{
		string path = Path.Combine(mra, a.pio + ".save");
		if (File.Exists(path))
		{
			File.Delete(path);
		}
	}

	public static Dictionary<string, ng> fzf()
	{
		return fyx<Career, ng>(mrc, ng.fjk);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Save(Career career)
	{
		Save(career, mrc, mrd);
	}

	public static void fzg(Career a)
	{
		string path = Path.Combine(mrc, a.pio + ".save");
		if (File.Exists(path))
		{
			File.Delete(path);
		}
	}
}
