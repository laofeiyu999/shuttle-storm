using System;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CareerPair : ob
{
	[JsonProperty("PairId")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string PairId;

	[JsonIgnore]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string CharacterAId;

	[JsonIgnore]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string CharacterBId;

	[JsonProperty("Category")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public TournamentCategory Category;

	[JsonProperty("InvitationDate")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public CareerDate? InvitationDate;

	[JsonProperty("InvitationStatus")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public PairInvitationStatus? InvitationStatus;

	public string piz => PairId;

	[JsonIgnore]
	public CareerParticipant mmq { get; protected set; }

	[JsonIgnore]
	public CareerParticipant mmr { get; protected set; }

	[JsonProperty("Points")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int Points
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Rank")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? Rank
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("PreviousRank")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int? PreviousRank
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	[JsonProperty("Complicity")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public float? Complicity
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	public bool pja
	{
		get
		{
			if (InvitationStatus.HasValue)
			{
				return InvitationStatus == PairInvitationStatus.InvitationAccepted;
			}
			return true;
		}
	}

	[JsonConstructor]
	private CareerPair()
	{
	}

	public CareerPair(PairInfo pair, Career career)
	{
		PairId = pair.id;
		CharacterAId = pair.characterId1;
		CharacterBId = pair.characterId2;
		Category = pair.pju;
		fpe(career);
	}

	public CareerPair(CareerParticipant characterA, CareerParticipant characterB, TournamentCategory category, CareerDate proposalDate, PairInvitationStatus proposalStatus)
	{
		PairId = characterA.CharacterId + "-" + characterB.CharacterId;
		CharacterAId = characterA.CharacterId;
		mmq = characterA;
		CharacterBId = characterB.CharacterId;
		mmr = characterB;
		Category = category;
		Points = 0;
		Rank = 0;
		InvitationDate = proposalDate;
		InvitationStatus = proposalStatus;
	}

	public void fpe(Career a)
	{
		string[] array = piz.Split("-");
		if (array.Length != 2)
		{
			throw new Exception("Invalid Pair ID " + piz);
		}
		CharacterAId = array[0];
		CharacterBId = array[1];
		mmq = a.Characters.Find((CareerParticipant a) => a.CharacterId == CharacterAId);
		mmr = a.Characters.Find((CareerParticipant a) => a.CharacterId == CharacterBId);
	}

	public bool fpf(string a)
	{
		if (!(CharacterAId == a))
		{
			return CharacterBId == a;
		}
		return true;
	}

	public CareerParticipant fpg(string a)
	{
		if (!(CharacterAId == a))
		{
			return mmq;
		}
		return mmr;
	}

	[CompilerGenerated]
	private bool fph(CareerParticipant a)
	{
		return a.CharacterId == CharacterAId;
	}

	[CompilerGenerated]
	private bool fpi(CareerParticipant a)
	{
		return a.CharacterId == CharacterBId;
	}
}
