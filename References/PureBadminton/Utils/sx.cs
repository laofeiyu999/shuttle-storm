using System;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class sx : JsonConverter
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
	{
		string[] array = ((string)reader.Value).Split(';');
		TournamentParticipant tournamentParticipant = new TournamentParticipant(array[0]);
		string[] array2 = array[1].Split('-');
		tournamentParticipant.CharacterAEnergy = float.Parse(array2[0]);
		if (array2.Length > 1)
		{
			tournamentParticipant.CharacterBEnergy = float.Parse(array2[1]);
		}
		return tournamentParticipant;
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
	{
		TournamentParticipant tournamentParticipant = value as TournamentParticipant;
		serializer.Serialize(writer, (tournamentParticipant.PairId != null) ? $"{tournamentParticipant.PairId};{Math.Round(tournamentParticipant.CharacterAEnergy, 4)}-{Math.Round(tournamentParticipant.CharacterBEnergy, 4)}" : $"{tournamentParticipant.CharacterAId};{Math.Round(tournamentParticipant.CharacterAEnergy, 4)}");
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool CanConvert(Type objectType)
	{
		return objectType == typeof(TournamentParticipant);
	}
}
