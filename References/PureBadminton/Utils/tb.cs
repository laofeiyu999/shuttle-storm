using System;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class tb : JsonConverter<(float, float)>
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override (float, float) ReadJson(JsonReader reader, Type objectType, (float, float) existingValue, bool hasExistingValue, JsonSerializer serializer)
	{
		JObject jObject = JObject.Load(reader);
		return ((jObject["lat"] ?? throw new JsonSerializationException("Missing 'lat' property")).Value<float>(), (jObject["lng"] ?? throw new JsonSerializationException("Missing 'lng' property")).Value<float>());
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, (float, float) value, JsonSerializer serializer)
	{
		writer.WriteStartObject();
		writer.WritePropertyName("lat");
		writer.WriteValue(value.Item1);
		writer.WritePropertyName("lng");
		writer.WriteValue(value.Item2);
		writer.WriteEndObject();
	}
}
