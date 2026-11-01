using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class os
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class oo
	{
		public TournamentCategory moa;

		internal bool fsc(CharacterInfo a)
		{
			op CS_0024_003C_003E8__locals0 = new op
			{
				mob = a
			};
			return pd.fua(moa).Any((PairInfo a) => a.characterId1 == CS_0024_003C_003E8__locals0.mob.id || a.characterId2 == CS_0024_003C_003E8__locals0.mob.id);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class op
	{
		public CharacterInfo mob;

		internal bool fsd(PairInfo a)
		{
			if (!(a.characterId1 == mob.id))
			{
				return a.characterId2 == mob.id;
			}
			return true;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class oq
	{
		public string moc;

		internal bool fse(CharacterInfo a)
		{
			return a.gender == moc;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class or
	{
		public string mod;

		internal bool fsf(CharacterInfo a)
		{
			return a.id == mod;
		}
	}

	private static CharacterInfo[] moe;

	public static IEnumerable<CharacterInfo> pji
	{
		get
		{
			if (moe == null)
			{
				moe = JsonConvert.DeserializeObject<CharacterInfo[]>(Resources.Load<TextAsset>("GeneratedCharacters").text);
				fsn();
			}
			return moe;
		}
	}

	public static IEnumerable<CharacterInfo> pjj
	{
		get
		{
			CharacterInfo[] array = pji.Where((CharacterInfo a) => a.isPlayable).ToArray();
			foreach (CharacterInfo item in array.Where((CharacterInfo a) => a.outfit == null))
			{
				item.fsu(Countries.fxc(item.country).Outfit, b: false);
			}
			return array;
		}
	}

	public static IEnumerable<CharacterInfo> pjk => pji.Where((CharacterInfo a) => a.isCustomizable).ToArray();

	public static IEnumerable<CharacterInfo> pjl => pji.Where((CharacterInfo a) => !a.isPlayable && !a.isCustomizable).ToArray();

	public static CharacterInfo fsk(string a)
	{
		return pji.FirstOrDefault((CharacterInfo a) => a.id == a);
	}

	public static IEnumerable<CharacterInfo> fsl(TournamentCategory a)
	{
		return a switch
		{
			TournamentCategory.MenSingles => pji.Where((CharacterInfo a) => a.singlePoints > 0 && a.gender == "m"), 
			TournamentCategory.WomenSingles => pji.Where((CharacterInfo a) => a.singlePoints > 0 && a.gender == "f"), 
			_ => pji.Where((CharacterInfo a) => pd.fua(a).Any((PairInfo a) => a.characterId1 == a.id || a.characterId2 == a.id)), 
		};
	}

	public static CharacterInfo fsm(string a)
	{
		return pji.Where((CharacterInfo a) => a.gender == a).gtk();
	}

	private static void fsn()
	{
		try
		{
			string path = Path.Combine(Application.dataPath, "mods", "characters.json");
			if (!File.Exists(path))
			{
				return;
			}
			Debug.Log("Start to load modded characters...");
			int num = 0;
			CharacterInfoModded[] array = JsonConvert.DeserializeObject<CharacterInfoModded[]>(File.ReadAllText(path));
			foreach (CharacterInfoModded characterInfoModded in array)
			{
				if (string.IsNullOrEmpty(characterInfoModded.id))
				{
					continue;
				}
				CharacterInfo characterInfo = fsk(characterInfoModded.id);
				if (characterInfo == null)
				{
					Debug.Log("Unknown character " + characterInfoModded.id);
					continue;
				}
				if (characterInfoModded.firstName != null)
				{
					characterInfo.firstName = characterInfoModded.firstName;
				}
				if (characterInfoModded.lastName != null)
				{
					characterInfo.lastName = characterInfoModded.lastName;
				}
				if (characterInfoModded.serveReceiveId.HasValue)
				{
					characterInfo.serveReceiveId = characterInfoModded.serveReceiveId.Value;
				}
				if (characterInfoModded.haircut.HasValue)
				{
					characterInfo.haircut = characterInfoModded.haircut.Value;
				}
				if (characterInfoModded.hairColor != null)
				{
					characterInfo.hairColor = characterInfoModded.hairColor;
				}
				if (characterInfoModded.beardType.HasValue)
				{
					characterInfo.beardType = characterInfoModded.beardType;
				}
				if (characterInfoModded.beardColor != null)
				{
					characterInfo.beardColor = characterInfoModded.beardColor;
				}
				if (characterInfoModded.eyesColor.HasValue)
				{
					characterInfo.eyesColor = characterInfoModded.eyesColor;
				}
				if (characterInfoModded.eyebrowsId.HasValue)
				{
					characterInfo.eyebrowsId = characterInfoModded.eyebrowsId;
				}
				if (characterInfoModded.singlePoints.HasValue)
				{
					characterInfo.singlePoints = characterInfoModded.singlePoints;
				}
				if (characterInfoModded.stats != null && new float[5]
				{
					characterInfoModded.stats.defense,
					characterInfoModded.stats.power,
					characterInfoModded.stats.precision,
					characterInfoModded.stats.speed,
					characterInfoModded.stats.stamina
				}.All((float a) => a >= 0f && a <= 100f))
				{
					characterInfo.stats = characterInfoModded.stats;
				}
				num++;
			}
			Debug.Log($"Finish loading {num} characters");
		}
		catch (Exception exception)
		{
			Debug.LogError("Failed to load the modded characters file");
			Debug.LogException(exception);
		}
	}
}
