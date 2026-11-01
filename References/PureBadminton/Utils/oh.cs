using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class oh : JsonConverter
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
	{
		return JObject.Load(reader).ToObject<Dictionary<string, string>>().ToDictionary((KeyValuePair<string, string> a) => new CareerDate(a.Key), (KeyValuePair<string, string> a) => new CharacterStats(a.Value));
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
	{
		Dictionary<CareerDate, CharacterStats> dictionary = value as Dictionary<CareerDate, CharacterStats>;
		Dictionary<string, string> dictionary2 = new Dictionary<string, string>();
		if (dictionary.Any())
		{
			string text = null;
			CareerDate key = dictionary.Last().Key;
			foreach (KeyValuePair<CareerDate, CharacterStats> item in dictionary)
			{
				if (CareerDate.fow(item.Key, key))
				{
					dictionary2.Add(item.Key.ToString(), item.Value.ToString());
					continue;
				}
				string text2 = item.Value.ftp();
				if (text2 != text)
				{
					dictionary2.Add(item.Key.ToString(), text2);
				}
				text = text2;
			}
		}
		serializer.Serialize(writer, dictionary2);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override bool CanConvert(Type objectType)
	{
		return objectType == typeof(Dictionary<CareerDate, CharacterStats>);
	}
}
