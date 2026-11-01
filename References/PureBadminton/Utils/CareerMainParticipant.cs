using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CareerMainParticipant : CareerParticipant
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class of
	{
		public float mna;

		internal float fql(float a)
		{
			return a + mna;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class og
	{
		public Career mnb;

		internal bool fqm((CareerDate, CareerTrainingScore) a)
		{
			return CareerDate.fow(a.Item1, mnb.CurrentDate);
		}
	}

	[JsonProperty("PendingPairs")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<CareerPair> PendingPairs
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	} = new List<CareerPair>();


	[JsonProperty("Energy")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public float Energy
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		set;
	}

	public override bool fqd()
	{
		return true;
	}

	[JsonConstructor]
	private CareerMainParticipant()
	{
	}

	public CareerMainParticipant(CharacterInfo character)
	{
		base.CharacterInfo = character.fsp();
		CharacterId = character.id;
		Energy = 1f;
		base.ProgressionPotential = 1.2f;
		base.CharacterInfo.stats = fqn();
	}

	private CharacterStats fqn()
	{
		new CharacterStats();
		float[] array = new float[5];
		for (int i = 0; i < array.Length; i++)
		{
			array[i] = UnityEngine.Random.Range(55f, 65f);
		}
		float num = array.Average();
		float mna = 60f - num;
		array = array.Select((float a) => a + mna).ToArray();
		return new CharacterStats
		{
			defense = array[0],
			power = array[1],
			precision = array[2],
			speed = array[3],
			stamina = array[4]
		};
	}

	public void fqo(Career a)
	{
		float energy = Energy;
		energy = (a.Trainings.Any(((CareerDate, CareerTrainingScore) a) => CareerDate.fow(a.Item1, a.CurrentDate)) ? (energy - pn.fyd()) : ((!a.CurrentRegisteredTournaments.Any()) ? (energy + pn.fyf()) : (energy - pn.fye(Energy, base.CharacterInfo.stats.stamina, a.CurrentRegisteredTournaments))));
		Energy = energy.gtg(0f, 1f);
	}
}
