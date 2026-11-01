using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class pz
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum EquipmentType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Top,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Bottom,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Shoes,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Racket,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Socks,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Grip,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		String
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum TopType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TShirt,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Polo,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TankTop
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum BottomType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Short,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Skirt
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class pq
	{
		[JsonProperty("id")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string Id;
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class pr : pq
	{
		[JsonProperty("texture")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string Texture;

		[JsonProperty("type")]
		[JsonConverter(typeof(StringEnumConverter))]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public TopType Type;

		[JsonProperty("colors", ItemConverterType = typeof(px))]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public List<Color> Colors;

		[JsonProperty("textInWhite")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public bool? TextInWhite;

		[JsonProperty("brand")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string Brand;
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class ps : pq
	{
		[JsonProperty("texture")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string Texture;

		[JsonProperty("type")]
		[JsonConverter(typeof(StringEnumConverter))]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public BottomType Type;

		[JsonProperty("colors", ItemConverterType = typeof(px))]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public List<Color> Colors;

		[JsonProperty("brand")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string Brand;
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class pt : pq
	{
		[JsonProperty("modelId")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public int ModelId;

		[JsonProperty("texture")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string Texture;
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class pu : pq
	{
		[JsonProperty("texture")]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public string Texture;

		[JsonProperty("colors", ItemConverterType = typeof(px))]
		[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
		public List<Color> Colors;
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class pw : JsonConverter
	{
		[CompilerGenerated]
		[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
		private sealed class pv
		{
			public string mqo;

			internal bool fyj(pr a)
			{
				return a.Id == mqo;
			}

			internal bool fyk(ps a)
			{
				return a.Id == mqo;
			}

			internal bool fyl(pt a)
			{
				return a.Id == mqo;
			}

			internal bool fym(pu a)
			{
				return a.Id == mqo;
			}
		}

		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
		{
			if (reader.TokenType == JsonToken.String)
			{
				string mqo = (string)reader.Value;
				CharacterOutfit characterOutfit = (mqo.StartsWith("Country_") ? Countries.fxc(mqo.Substring(8)).Outfit : null);
				if (objectType == typeof(pr))
				{
					return characterOutfit?.Top ?? plc.FirstOrDefault((pr a) => a.Id == mqo);
				}
				if (objectType == typeof(ps))
				{
					return characterOutfit?.Bottom ?? pld.FirstOrDefault((ps a) => a.Id == mqo);
				}
				if (objectType == typeof(pt))
				{
					return ple.FirstOrDefault((pt a) => a.Id == mqo);
				}
				return plf.FirstOrDefault((pu a) => a.Id == mqo);
			}
			if (reader.TokenType == JsonToken.StartObject)
			{
				return JObject.Load(reader).ToObject(objectType);
			}
			return null;
		}

		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
		{
			pq pq = (pq)value;
			if (string.IsNullOrEmpty(pq.Id))
			{
				serializer.Serialize(writer, value);
			}
			else
			{
				serializer.Serialize(writer, pq.Id);
			}
		}

		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		public override bool CanConvert(Type objectType)
		{
			if (!(objectType == typeof(pr)) && !(objectType == typeof(ps)) && !(objectType == typeof(pt)))
			{
				return objectType == typeof(pu);
			}
			return true;
		}
	}

	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class px : JsonConverter
	{
		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
		{
			return qh.fzu((string)reader.Value);
		}

		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
		{
			Color color = (Color)value;
			serializer.Serialize(writer, "#" + ColorUtility.ToHtmlStringRGB(color));
		}

		[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
		[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
		public override bool CanConvert(Type objectType)
		{
			return objectType == typeof(Color);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class py
	{
		public string mqp;

		internal bool fyn(ps a)
		{
			return fys(a, mqp);
		}
	}

	private static pr[] mqq;

	private static ps[] mqr;

	private static pt[] mqs;

	private static pu[] mqt;

	public static readonly List<Color> mqu = new List<Color>
	{
		Color.black,
		Color.white,
		Color.yellow,
		Color.red,
		Color.green,
		Color.blue,
		Color.grey,
		new Color32(51, byte.MaxValue, byte.MaxValue, byte.MaxValue),
		new Color32(byte.MaxValue, 51, 153, byte.MaxValue),
		new Color32(byte.MaxValue, 128, 0, byte.MaxValue),
		new Color32(102, 0, 204, byte.MaxValue),
		new Color32(153, 76, 0, byte.MaxValue)
	};

	public static readonly List<EquipmentType> mqv = new List<EquipmentType>
	{
		EquipmentType.Socks,
		EquipmentType.Grip,
		EquipmentType.String
	};

	public static pr[] plc
	{
		get
		{
			if (mqq == null)
			{
				mqq = JsonConvert.DeserializeObject<pr[]>(Resources.Load<TextAsset>("Equipments/Tops").text);
			}
			return mqq;
		}
	}

	public static ps[] pld
	{
		get
		{
			if (mqr == null)
			{
				mqr = JsonConvert.DeserializeObject<ps[]>(Resources.Load<TextAsset>("Equipments/Bottoms").text);
			}
			return mqr;
		}
	}

	public static pt[] ple
	{
		get
		{
			if (mqs == null)
			{
				mqs = JsonConvert.DeserializeObject<pt[]>(Resources.Load<TextAsset>("Equipments/Shoes").text);
			}
			return mqs;
		}
	}

	public static pu[] plf
	{
		get
		{
			if (mqt == null)
			{
				mqt = JsonConvert.DeserializeObject<pu[]>(Resources.Load<TextAsset>("Equipments/Rackets").text);
			}
			return mqt;
		}
	}

	public static bool fys(ps a, string b)
	{
		if (!(b != "m"))
		{
			return a.Type == BottomType.Short;
		}
		return true;
	}

	public static pq[] fyt(EquipmentType a, string b)
	{
		return a switch
		{
			EquipmentType.Top => plc, 
			EquipmentType.Bottom => pld.Where((ps a) => fys(a, b)).ToArray(), 
			EquipmentType.Shoes => ple, 
			EquipmentType.Racket => plf, 
			_ => throw new NotImplementedException(), 
		};
	}

	public static string fyu(EquipmentType a)
	{
		return a switch
		{
			EquipmentType.Top => "Tops", 
			EquipmentType.Bottom => "Bottoms", 
			EquipmentType.Shoes => "Shoes", 
			EquipmentType.Socks => "Socks", 
			EquipmentType.Racket => "Rackets", 
			EquipmentType.Grip => "Grips", 
			EquipmentType.String => "Strings", 
			_ => throw new NotImplementedException(), 
		};
	}

	public static Sprite fyv(EquipmentType a, string b)
	{
		return Resources.Load<Sprite>("Images/Equipments/" + fyu(a) + "/" + b);
	}
}
