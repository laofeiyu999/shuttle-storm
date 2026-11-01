using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CareerTrainingScore
{
	[JsonIgnore]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public bool JustFinished;

	[JsonProperty("TrainingInfo")]
	[JsonConverter(typeof(ol))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public tn TrainingInfo
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	}

	[JsonProperty("Scores")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[field: NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<int?> Scores
	{
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		get;
		[NotObfuscatedCause("Belonging property gets skipped: Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		private set;
	}

	[JsonConstructor]
	protected CareerTrainingScore()
	{
	}

	public CareerTrainingScore(tn trainingInfo)
	{
		TrainingInfo = trainingInfo;
		Scores = new int?[trainingInfo.ncc.Count].ToList();
	}
}
