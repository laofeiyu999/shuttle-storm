using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CharacterInfo
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ot
	{
		public string mof;

		internal bool fso(pz.pt a)
		{
			return a.Id == mof;
		}
	}

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string id;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string modelId;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool fake;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool isPlayable;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool isCustomizable;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string firstName;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string lastName;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool lastNameFirst;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string country;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string gender;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int height;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public DateTime birthDate;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool leftHanded;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int skinTintId;

	[JsonConverter(typeof(StringEnumConverter))]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public HaircutType haircut;

	[JsonConverter(typeof(oy))]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public ow hairColor;

	[JsonConverter(typeof(StringEnumConverter))]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public BeardType? beardType;

	[JsonConverter(typeof(oy))]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public ow beardColor;

	[JsonConverter(typeof(StringEnumConverter))]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public EyeColor? eyesColor;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int? eyebrowsId;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int? singlePoints;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public CharacterStats stats;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public CharacterOutfit outfit;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Dictionary<string, int> blendShapes;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int serveReceiveId = 1;

	[JsonIgnore]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool locked;

	private int? mog;

	public string pjm
	{
		get
		{
			if (!lastNameFirst)
			{
				return (firstName + " " + lastName?.ToUpper()).Trim();
			}
			return (lastName?.ToUpper() + " " + firstName).Trim();
		}
	}

	public int pjn
	{
		get
		{
			if (!mog.HasValue)
			{
				mog = birthDate.gtj();
			}
			return mog.Value;
		}
	}

	public CharacterInfo fsp()
	{
		return new CharacterInfo
		{
			id = id,
			modelId = modelId,
			fake = fake,
			isPlayable = isPlayable,
			isCustomizable = isCustomizable,
			firstName = firstName,
			lastName = lastName,
			lastNameFirst = lastNameFirst,
			country = country,
			gender = gender,
			height = height,
			birthDate = birthDate,
			skinTintId = skinTintId,
			leftHanded = leftHanded,
			haircut = haircut,
			hairColor = hairColor,
			beardType = beardType,
			beardColor = beardColor,
			eyesColor = eyesColor,
			eyebrowsId = eyebrowsId,
			singlePoints = singlePoints,
			stats = stats,
			outfit = outfit?.ftc(),
			blendShapes = blendShapes
		};
	}

	public int? fss(TournamentCategory a)
	{
		switch (a)
		{
		case TournamentCategory.MenSingles:
		case TournamentCategory.WomenSingles:
			return singlePoints;
		case TournamentCategory.MenDoubles:
			return pd.ftz(id, "MD")?.points;
		case TournamentCategory.WomenDoubles:
			return pd.ftz(id, "WD")?.points;
		case TournamentCategory.MixedDoubles:
			return pd.ftz(id, "XD")?.points;
		default:
			throw new NotImplementedException();
		}
	}

	public void fst()
	{
		fsu(Countries.fxc(country).Outfit, b: false);
	}

	public void fsu(CharacterOutfit a, bool b)
	{
		bool num = outfit == null;
		if (outfit == null)
		{
			outfit = new CharacterOutfit();
		}
		if (a != null)
		{
			a = a.ftc();
			if (b || outfit.Top == null)
			{
				outfit.Top = a.Top;
			}
			if (b || outfit.Bottom == null)
			{
				pz.BottomType? bottomType = outfit.Bottom?.Type;
				outfit.Bottom = a.Bottom;
				if (bottomType.HasValue)
				{
					outfit.Bottom.Type = bottomType.Value;
				}
			}
		}
		string text = pjm;
		int num2 = (((text.Length > 0) ? text.ToUpper()[0] : 'A') - 65) * 4;
		if (num && num2 % 10 > 5 && ty.ndi.Contains(haircut))
		{
			outfit.HeadbandColor = new Dictionary<Color, int>
			{
				{
					Color.white,
					40
				},
				{
					Color.black,
					25
				},
				{
					Color.grey,
					15
				},
				{
					new Color32(200, 22, 22, byte.MaxValue),
					10
				},
				{
					new Color32(16, 42, 121, byte.MaxValue),
					10
				}
			}.gto(num2);
			outfit.WristbandColor = outfit.HeadbandColor;
		}
		if (outfit.Shoes == null)
		{
			Dictionary<string, int> a2 = new Dictionary<string, int>
			{
				{ "1_White", 25 },
				{ "1", 25 },
				{ "1_Blue", 10 },
				{ "1_Orange", 10 },
				{ "1_Black_Blue", 10 },
				{ "1_Black_RedLace", 10 },
				{ "1_Black_TurquoiseLace", 10 }
			};
			string mof = a2.gto(num2);
			outfit.Shoes = pz.ple.FirstOrDefault((pz.pt a) => a.Id == mof);
		}
		if (!outfit.SocksColor.HasValue)
		{
			outfit.SocksColor = new Dictionary<Color, int>
			{
				{
					Color.white,
					65
				},
				{
					Color.black,
					25
				},
				{
					Color.grey,
					10
				}
			}.gto(num2 % 50 * 2);
		}
		if (outfit.Racket == null)
		{
			outfit.Racket = pz.plf.gtn(num2);
		}
		if (!outfit.GripColor.HasValue)
		{
			outfit.GripColor = new Color[5]
			{
				Color.white,
				Color.black,
				Color.yellow,
				new Color32(200, 22, 22, byte.MaxValue),
				new Color32(16, 42, 121, byte.MaxValue)
			}.gtn(num2);
		}
		if (!outfit.StringColor.HasValue)
		{
			outfit.StringColor = new Dictionary<Color, int>
			{
				{
					Color.white,
					70
				},
				{
					Color.black,
					30
				}
			}.gto(num2);
		}
	}
}
