using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qw
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class qv
	{
		public string muj;

		internal bool ger(KeyValuePair<string, qz> a)
		{
			return a.Key.StartsWith(muj + "#");
		}
	}

	[JsonProperty("SetsScore")]
	[JsonConverter(typeof(qy))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public List<qx> SetsScore;

	[JsonProperty("RallyLength")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public int AverageRallyLength;

	[JsonProperty("PlayersStats")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	public Dictionary<string, qz> PlayersStats;

	public bool pmf => SetsScore.Count((qx a) => a.pmg) > SetsScore.Count((qx a) => !a.pmg);

	public qz get(string a, MatchSettings.PositionOnCourt? b = null)
	{
		if (PlayersStats == null || a == null)
		{
			return null;
		}
		if (b.HasValue && PlayersStats.TryGetValue(qu.gel(a, b.Value), out var value))
		{
			return value;
		}
		if (PlayersStats.TryGetValue(a, out var value2))
		{
			return value2;
		}
		return PlayersStats.FirstOrDefault((KeyValuePair<string, qz> a) => a.Key.StartsWith(a + "#")).Value;
	}

	public qz geu(MatchSettings.PlayerSettings a)
	{
		return get(a?.CharacterInfo?.id, a?.Position);
	}
}
