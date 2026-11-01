using System;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class oa : JsonConverter
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
	{
		return new CareerDate((string)reader.Value);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
	{
		serializer.Serialize(writer, ((CareerDate)value).ToString());
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool CanConvert(Type objectType)
	{
		return objectType == typeof(CareerDate);
	}
}
