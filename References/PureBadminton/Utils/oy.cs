using System;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class oy : JsonConverter
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ox
	{
		public string mor;

		internal bool ftr(ow a)
		{
			return a.mon == mor;
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
	{
		string mor = (string)reader.Value;
		return ow.moq.Find((ow a) => a.mon == mor);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
	{
		ow ow2 = (ow)value;
		serializer.Serialize(writer, ow2.mon);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool CanConvert(Type objectType)
	{
		return objectType == typeof(ow);
	}
}
