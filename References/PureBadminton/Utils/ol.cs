using System;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class ol : JsonConverter
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class oj
	{
		public string[] mnc;

		internal bool fqx(tn a)
		{
			if (a.nca.ToString() == mnc[0])
			{
				return a.ncb == int.Parse(mnc[1]);
			}
			return false;
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
	{
		string[] mnc = ((string)reader.Value).Split("-");
		return tn.ncf.Find((tn a) => a.nca.ToString() == mnc[0] && a.ncb == int.Parse(mnc[1]));
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
	{
		tn tn2 = (tn)value;
		serializer.Serialize(writer, $"{tn2.nca}-{tn2.ncb}");
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool CanConvert(Type objectType)
	{
		return objectType == typeof(tn);
	}
}
