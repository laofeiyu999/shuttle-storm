using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class oi
{
	public static void fqt(int a, string b)
	{
		switch (a)
		{
		case 0:
			fqu(b);
			break;
		case 1:
			fqv(b);
			break;
		default:
			throw new Exception($"Unknown migration for Career save file version {a}");
		}
	}

	public static void fqu(string a)
	{
		string json = null;
		byte[] array = new byte[256];
		using (FileStream fileStream = File.OpenRead(a))
		{
			fileStream.Read(array);
			byte[] array2 = new byte[fileStream.Length - 256];
			fileStream.Read(array2);
			using (Aes.Create())
			{
				json = tu.gre(na.fhn(array2));
			}
		}
		string @string = Encoding.UTF8.GetString(array, 0, 128);
		long value = BitConverter.ToInt64(array, 128);
		byte[] first;
		using (MemoryStream memoryStream = new MemoryStream())
		{
			memoryStream.Write(ng.mln);
			memoryStream.Write(BitConverter.GetBytes((ushort)1));
			memoryStream.Write(Encoding.UTF8.GetBytes(@string));
			memoryStream.Write(BitConverter.GetBytes(value));
			memoryStream.Write(Enumerable.Repeat((byte)0, 256 - (int)memoryStream.Position).ToArray());
			first = memoryStream.ToArray();
		}
		JObject jObject = JObject.Parse(json);
		foreach (JToken item in (JArray)jObject["Characters"])
		{
			if (!(item["StatsEvolution"] is JObject jObject2))
			{
				continue;
			}
			JProperty[] array3 = jObject2.Properties().ToList().SkipLast(1)
				.ToArray();
			for (int i = 0; i < array3.Length; i++)
			{
				string text = array3[i].Value.ToString();
				string text2 = string.Join(",", from a in text.Split(',')
					select Math.Floor(float.Parse(a, CultureInfo.InvariantCulture)).ToString());
				array3[i].Value = text2;
				if (i > 0 && array3[i - 1].Value.ToString() == text2)
				{
					array3[i].Remove();
				}
			}
		}
		JArray jArray = (JArray)jObject["Tournaments"];
		for (int j = 0; j < jArray.Count; j++)
		{
			Tournament tournament = jArray[j]["Item2"].ToObject<Tournament>();
			jArray[j]["Item2"] = JToken.FromObject(tournament.gnq());
		}
		JsonSerializerSettings settings = new JsonSerializerSettings
		{
			Culture = CultureInfo.InvariantCulture,
			ContractResolver = new qd(),
			NullValueHandling = NullValueHandling.Ignore
		};
		json = JsonConvert.SerializeObject(jObject, settings);
		File.WriteAllBytes(a, first.Concat(tu.grd(json)).ToArray());
		Debug.Log("File " + a + " migrated from v0 to v1");
	}

	public static void fqv(string a)
	{
		fqw(a, 2, delegate(JObject a)
		{
			a["Settings"] = new JObject();
			a["Settings"]["WinningSets"] = a["MatchSettings"]["WinningSets"];
			a["Settings"]["SetPoints"] = a["MatchSettings"]["SetPoints"];
			a["Settings"]["Difficulty"] = a["MatchSettings"]["Difficulty"];
			a.Remove("MatchSettings");
			return a;
		});
		Debug.Log("File " + a + " migrated from v1 to v2");
	}

	private static void fqw(string a, ushort b, Func<JObject, JObject> c)
	{
		string json = null;
		byte[] array = new byte[256];
		using (FileStream fileStream = File.OpenRead(a))
		{
			fileStream.Read(array);
			byte[] array2 = new byte[fileStream.Length - 256];
			fileStream.Read(array2);
			json = tu.gre(array2);
		}
		JObject arg = JObject.Parse(json);
		JObject value = c(arg);
		JsonSerializerSettings settings = new JsonSerializerSettings
		{
			Culture = CultureInfo.InvariantCulture,
			ContractResolver = new qd(),
			NullValueHandling = NullValueHandling.Ignore
		};
		json = JsonConvert.SerializeObject(value, settings);
		array[4] = (byte)b;
		File.WriteAllBytes(a, array.Concat(tu.grd(json)).ToArray());
	}
}
