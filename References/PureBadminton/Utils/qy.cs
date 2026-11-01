using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class qy : JsonConverter
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
	{
		return ((string)reader.Value).Split(",").Select(delegate(string a)
		{
			string[] array = a.Split("-");
			return new qx(int.Parse(array[0]), int.Parse(array[1]));
		}).ToList();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
	{
		List<qx> source = value as List<qx>;
		serializer.Serialize(writer, string.Join(",", source.Select((qx a) => $"{a.muk}-{a.mul}")));
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool CanConvert(Type objectType)
	{
		return objectType == typeof(List<qx>);
	}
}
