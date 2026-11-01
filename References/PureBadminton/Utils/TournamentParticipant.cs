using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[Serializable]
[JsonConverter(typeof(sx))]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class TournamentParticipant
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sv
	{
		public TournamentMatch nam;

		public TournamentParticipant nan;

		internal int goj(qx a)
		{
			if (!((nam.TeamB == nan) ^ a.pmg))
			{
				return -1;
			}
			return 1;
		}

		internal int gok(qx a)
		{
			return (a.muk - a.mul) * ((nam.TeamA == nan) ? 1 : (-1));
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class sw
	{
		public string nao;

		internal bool gol(CareerParticipant a)
		{
			return a.piz == nao;
		}
	}

	[JsonProperty("PairId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string PairId;

	[JsonProperty("CharacterAId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string CharacterAId;

	[JsonProperty("CharacterBId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string CharacterBId;

	[JsonProperty("CharacterAEnergy")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float CharacterAEnergy = 1f;

	[JsonProperty("CharacterBEnergy")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float CharacterBEnergy = 1f;

	[JsonProperty("GroupId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int? GroupId;

	[JsonProperty("PoolResults")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public TournamentPoolResults PoolResults;

	[JsonIgnore]
	public CharacterInfo pof => goz(CharacterAId);

	[JsonIgnore]
	public CharacterInfo pog
	{
		get
		{
			if (CharacterBId == null)
			{
				return null;
			}
			return goz(CharacterBId);
		}
	}

	public string[] poh
	{
		get
		{
			if (CharacterBId != null)
			{
				return new string[2] { CharacterAId, CharacterBId };
			}
			return new string[1] { CharacterAId };
		}
	}

	[JsonProperty("PairComplicity")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public float? PairComplicity
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get
		{
			if (Career.Current == null || PairId == null)
			{
				return null;
			}
			return Career.Current?.Pairs.Find((CareerPair a) => a.piz == PairId)?.Complicity;
		}
	}

	[JsonIgnore]
	public float poi
	{
		get
		{
			if (CharacterBId == null)
			{
				return pof.stats.pjo;
			}
			return (pof.stats.pjo + pog.stats.pjo) / 2f;
		}
	}

	public ob poj
	{
		get
		{
			if (PairId == null)
			{
				return Career.Current?.Characters.FirstOrDefault((CareerParticipant a) => a.CharacterId == CharacterAId);
			}
			return Career.Current?.Pairs.FirstOrDefault((CareerPair a) => a.PairId == PairId);
		}
	}

	public string pok
	{
		get
		{
			if (!GroupId.HasValue)
			{
				return null;
			}
			return Tournament.gmz(GroupId.Value);
		}
	}

	public int? gor()
	{
		if (Career.Current != null)
		{
			return poj.Points;
		}
		if (PairId != null)
		{
			return pd.ftx(PairId)?.points ?? 0;
		}
		return pof.singlePoints.GetValueOrDefault();
	}

	public int? gos()
	{
		if (Career.Current != null)
		{
			return poj.Rank.Value;
		}
		if (PairId == null)
		{
			return os.pji.Where((CharacterInfo a) => a.singlePoints > 0 && a.gender == pof.gender).ToList().FindIndex((CharacterInfo a) => a.id == CharacterAId) + 1;
		}
		PairInfo pairInfo = pd.ftx(PairId);
		if (pairInfo != null)
		{
			return pd.fua(pairInfo.pju).FindIndex((PairInfo a) => a.id == PairId) + 1;
		}
		return null;
	}

	[JsonConstructor]
	private TournamentParticipant()
	{
	}

	public TournamentParticipant(string id)
	{
		if (id.Contains("-"))
		{
			PairId = id;
			string[] array = id.Split("-");
			CharacterAId = array[0];
			CharacterBId = array[1];
		}
		else
		{
			CharacterAId = id;
		}
	}

	public TournamentParticipant(CharacterInfo character)
	{
		CharacterAId = character.id;
		gou();
	}

	public TournamentParticipant(PairInfo pair)
	{
		if (string.IsNullOrEmpty(pair.id))
		{
			pair.id = pair.pjs.id + "-" + pair.pjt.id;
		}
		PairId = pair.id;
		CharacterAId = pair.pjs.id;
		CharacterBId = pair.pjt.id;
	}

	public TournamentParticipant(CareerPair pair)
	{
		PairId = pair.PairId;
		CharacterAId = pair.CharacterAId;
		CharacterBId = pair.CharacterBId;
		gou();
	}

	private void gou()
	{
		if (Career.Current != null && CharacterAId == Career.Current.MainCharacter.CharacterId)
		{
			CharacterAEnergy = pn.fya(Career.Current.MainCharacter.Energy);
			if (pog != null)
			{
				CharacterBEnergy = CharacterAEnergy;
			}
		}
	}

	public void gov()
	{
		CharacterOutfit outfit = pof.outfit;
		if (outfit != null)
		{
			pz.pr top = outfit.Top;
			if (top != null)
			{
				_ = top.Type;
				if (0 == 0)
				{
					goto IL_0048;
				}
			}
		}
		pof.fsu(Countries.fxc(pof.country).Outfit, b: false);
		goto IL_0048;
		IL_0048:
		if (pog != null)
		{
			pog.fsu(pof.outfit, b: true);
		}
	}

	public void gow(IEnumerable<TournamentMatch> a)
	{
		PoolResults = new TournamentPoolResults();
		foreach (TournamentMatch nam in a.Where((TournamentMatch a) => a.TeamA == this || a.TeamB == this))
		{
			if ((nam.TeamB == this) ^ nam.Stats.Recap.pmf)
			{
				PoolResults.VictoryPoints++;
			}
			PoolResults.Sets += nam.Stats.Recap.SetsScore.Sum((qx a) => ((nam.TeamB == this) ^ a.pmg) ? 1 : (-1));
			PoolResults.Points += nam.Stats.Recap.SetsScore.Sum((qx a) => (a.muk - a.mul) * ((nam.TeamA == this) ? 1 : (-1)));
		}
	}

	public bool gox(string a)
	{
		if (!(CharacterAId == a))
		{
			return CharacterBId == a;
		}
		return true;
	}

	public bool goy(TournamentParticipant a)
	{
		if (!a.gox(CharacterAId))
		{
			if (a.CharacterBId != null)
			{
				return a.gox(CharacterBId);
			}
			return false;
		}
		return true;
	}

	private static CharacterInfo goz(string a)
	{
		if (string.IsNullOrEmpty(a))
		{
			return null;
		}
		if (Career.Current == null)
		{
			return os.fsk(a);
		}
		return Career.Current.Characters.Find((CareerParticipant a) => a.piz == a)?.CharacterInfo;
	}

	[CompilerGenerated]
	private bool gpa(CareerPair a)
	{
		return a.piz == PairId;
	}

	[CompilerGenerated]
	private bool gpb(CareerPair a)
	{
		return a.PairId == PairId;
	}

	[CompilerGenerated]
	private bool gpc(CareerParticipant a)
	{
		return a.CharacterId == CharacterAId;
	}

	[CompilerGenerated]
	private bool gpd(CharacterInfo a)
	{
		if (a.singlePoints > 0)
		{
			return a.gender == pof.gender;
		}
		return false;
	}

	[CompilerGenerated]
	private bool gpe(CharacterInfo a)
	{
		return a.id == CharacterAId;
	}

	[CompilerGenerated]
	private bool gpf(PairInfo a)
	{
		return a.id == PairId;
	}

	[CompilerGenerated]
	private bool gpg(TournamentMatch a)
	{
		if (a.TeamA != this)
		{
			return a.TeamB == this;
		}
		return true;
	}
}
