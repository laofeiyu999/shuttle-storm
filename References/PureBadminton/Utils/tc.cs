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
public static class tc
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum OldV2TournamentType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		WorldChampionships = 0,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		WorldTourFinals = 1,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		EnglandOpen = 101,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ChinaOpen = 102,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndonesiaOpen = 103,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MalaysiaOpen = 104,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		DenmarkOpen = 201,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		FrenchOpen = 202,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ChinaMasters = 203,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		JapanOpen = 204,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndiaOpen = 205,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SingaporeOpen = 206,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		HongKongOpen = 301,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndonesiaMasters = 302,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		KoreaOpen = 303,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MalaysiaMasters = 304,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ThailandOpen = 305,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		AustralianOpen = 306,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CanadaOpen = 307,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		FinlandArcticOpen = 308,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		KumamotoMastersJapan = 309,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		GermanOpen = 401,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		HyloOpen = 402,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		KoreaMasters = 403,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SpainMasters = 404,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SwissOpen = 405,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SyedModiInternational = 406,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TaipeiOpen = 407,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ThailandMasters = 408,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		USOpen = 409,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		OrleansMasters = 410,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		AbuDhabiMasters = 501,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		GuwahatiMasters = 502,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		OdishaMasters = 503,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndonesiaMastersSuper100I = 504,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndonesiaMastersSuper100II = 505,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		KaohsiungMasters = 506,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MalaysiaSuper100 = 507,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		RuichangChinaMasters = 508,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		VietnamOpen = 509,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IranInternationalChallenge = 601,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		UgandaInternationalChallenge = 602,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ThailandInternationalChallenge = 603,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		VietnamInternationalChallenge = 604,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		PolishOpen = 605,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		OsakaInternationalChallenge = 606,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MexicanInternationalChallenge = 607,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SloveniaOpen = 608,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ItalianInternational = 609,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MaldivesInternationalChallenge = 610,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		NorthernMarianasOpen = 611,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		DenmarkMasters = 612,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SaipanInternational = 613,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		NantesInternationalChallenge = 614,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		HangzhouInternationalChallenge = 615,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MongoliaInternationalChallenge = 616,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ReunionOpen = 617,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndonesiaInternationalChallengeI = 618,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		LagosInternationalClassics = 619,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		GuatemalaInternationalChallenge = 620,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		BelgianInternational = 621,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		PeruChallenge = 622,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ScottishOpen = 623,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		BendigoInternational = 624,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		DutchOpen = 625,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndonesiaInternationalChallengeII = 626,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndiaInternationalChallengeI = 627,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		NorthHarbourInternational = 628,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IndiaInternationalChallengeII = 629,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MalaysiaInternationalChallenge = 630,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		IrishOpen = 631,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		BahrainInternationalChallenge = 632,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		ElSalvadorInternational = 633,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		WelshInternationalBadmintonChampionships = 634,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		CanadianInternationalChallenge = 635,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		BangladeshInternationalChallenge = 636
	}

	public static void gpt(int a, string b)
	{
		switch (a)
		{
		case 0:
			gpu(b);
			break;
		case 1:
			gpv(b);
			break;
		case 2:
			gpw(b);
			break;
		default:
			throw new Exception($"Unknown migration for Tournament save file version {a}");
		}
	}

	public static void gpu(string a)
	{
		byte[] second = null;
		byte[] array = new byte[256];
		using (FileStream fileStream = File.OpenRead(a))
		{
			fileStream.Read(array);
			byte[] array2 = new byte[fileStream.Length - 256];
			fileStream.Read(array2);
			using (Aes.Create())
			{
				second = na.fhn(array2);
			}
		}
		int value = BitConverter.ToInt32(array, 0);
		int value2 = BitConverter.ToInt32(array, 4);
		long value3 = BitConverter.ToInt64(array, 8);
		byte[] first;
		using (MemoryStream memoryStream = new MemoryStream())
		{
			memoryStream.Write(sb.myt);
			memoryStream.Write(BitConverter.GetBytes((ushort)1));
			memoryStream.Write(BitConverter.GetBytes(value));
			memoryStream.Write(BitConverter.GetBytes(value2));
			memoryStream.Write(BitConverter.GetBytes(value3));
			memoryStream.Write(Enumerable.Repeat((byte)0, 256 - (int)memoryStream.Position).ToArray());
			first = memoryStream.ToArray();
		}
		File.WriteAllBytes(a, first.Concat(second).ToArray());
		Debug.Log("File " + a + " migrated from v0 to v1");
	}

	public static void gpv(string a)
	{
		gpx(a, 2, delegate(JObject a)
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

	public static void gpw(string a)
	{
		byte[] array = null;
		byte[] array2 = new byte[256];
		using (FileStream fileStream = File.OpenRead(a))
		{
			fileStream.Read(array2);
			array = new byte[fileStream.Length - 256];
			fileStream.Read(array);
		}
		int num = BitConverter.ToInt32(array2, 6);
		int value = BitConverter.ToInt32(array2, 10);
		long value2 = BitConverter.ToInt64(array2, 14);
		OldV2TournamentType oldV2TournamentType = (OldV2TournamentType)num;
		byte[] first;
		using (MemoryStream memoryStream = new MemoryStream())
		{
			memoryStream.Write(sb.myt);
			memoryStream.Write(BitConverter.GetBytes((ushort)3));
			memoryStream.Write(Encoding.UTF8.GetBytes(oldV2TournamentType.ToString().PadRight(64, ' ')));
			memoryStream.Write(BitConverter.GetBytes(value));
			memoryStream.Write(BitConverter.GetBytes(value2));
			memoryStream.Write(Enumerable.Repeat((byte)0, 256 - (int)memoryStream.Position).ToArray());
			first = memoryStream.ToArray();
		}
		File.WriteAllBytes(a, first.Concat(array).ToArray());
		Debug.Log("File " + a + " migrated from v2 to v3");
	}

	private static void gpx(string a, ushort b, Func<JObject, JObject> c)
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
