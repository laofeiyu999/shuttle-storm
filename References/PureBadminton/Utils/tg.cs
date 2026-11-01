using System;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class tg : JsonConverter
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
	{
		string[] array = ((string)reader.Value).Split(';');
		return new tf
		{
			nbr = array[0],
			nbs = (array[1] == "1"),
			nbt = (array[2] == "1")
		};
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
	{
		tf tf2 = (tf)value;
		serializer.Serialize(writer, tf2.nbr + ";" + (tf2.nbs ? "1" : "0") + ";" + (tf2.nbt ? "1" : "0"));
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool CanConvert(Type objectType)
	{
		return objectType == typeof(tf);
	}
}
