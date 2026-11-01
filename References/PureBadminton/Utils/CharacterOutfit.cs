using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CharacterOutfit
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ou
	{
		public bool moh;

		internal bool fta(pz.ps a)
		{
			return a.Id == (moh ? "Short_White" : "Short_Black");
		}
	}

	[JsonProperty("top")]
	[JsonConverter(typeof(pz.pw))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public pz.pr Top;

	[JsonProperty("bottom")]
	[JsonConverter(typeof(pz.pw))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public pz.ps Bottom;

	[JsonProperty("socksColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Color? SocksColor;

	[JsonProperty("shoes")]
	[JsonConverter(typeof(pz.pw))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public pz.pt Shoes;

	[JsonProperty("racket")]
	[JsonConverter(typeof(pz.pw))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public pz.pu Racket;

	[JsonProperty("gripColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Color? GripColor;

	[JsonProperty("stringColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Color? StringColor;

	[JsonProperty("headbandColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Color? HeadbandColor;

	[JsonProperty("wristbandColor")]
	[JsonConverter(typeof(pz.px))]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public Color? WristbandColor;

	private static readonly List<Color> moi = new List<string>
	{
		"#000000", "#ffffff", "#dedede", "#958a7f", "#373635", "#525456", "#5e5e5e", "#939495", "#eae2dc", "#ababab",
		"#747163", "#f6edda", "#fdeb71", "#fdf882", "#f4a323", "#fff98a", "#20419a", "#1f2331", "#046489", "#9ce6f1",
		"#27c1ca", "#0ca2bd", "#374650", "#8aadc5", "#171c32", "#c7dce7", "#353f4b", "#ff7700", "#ef510d", "#02642e",
		"#767965", "#437f2d", "#c3f17a", "#645f3f", "#44812e", "#6fcf91", "#00b064", "#b1ebc5", "#b51717", "#821d2b",
		"#3f1924", "#63243f", "#ef4848", "#48052c", "#60371f", "#281a12", "#ffc2ca", "#f34976", "#fb6863", "#ffeae7",
		"#dd7db6", "#5e3a8c", "#271b22", "#55387a", "#8063d5", "#34101b", "#f3eed7"
	}.Select((string a) => qh.fzu(a).Value).ToList();

	private static readonly List<Color> moj = new List<Color>
	{
		Color.white,
		Color.black
	};

	public static CharacterOutfit ftb(string a)
	{
		CharacterOutfit characterOutfit = ((a == null) ? null : Countries.fxc(a)?.Outfit);
		return new CharacterOutfit
		{
			Top = (characterOutfit?.Top ?? pz.plc.FirstOrDefault((pz.pr a) => a.Id == "White")),
			Bottom = (characterOutfit?.Bottom ?? pz.pld.FirstOrDefault((pz.ps a) => a.Id == "Short_White")),
			Shoes = pz.ple.FirstOrDefault((pz.pt a) => a.Id == "1_White"),
			Racket = pz.plf.FirstOrDefault((pz.pu a) => a.Id == "White"),
			SocksColor = Color.white,
			GripColor = Color.white,
			StringColor = Color.white
		};
	}

	public CharacterOutfit ftc()
	{
		return new CharacterOutfit
		{
			Top = ((Top == null) ? null : new pz.pr
			{
				Id = Top.Id,
				Type = Top.Type,
				Texture = Top.Texture,
				Colors = Top.Colors,
				TextInWhite = Top.TextInWhite,
				Brand = Top.Brand
			}),
			Bottom = ((Bottom == null) ? null : new pz.ps
			{
				Id = Bottom.Id,
				Type = Bottom.Type,
				Texture = Bottom.Texture,
				Colors = Bottom.Colors,
				Brand = Bottom.Brand
			}),
			SocksColor = SocksColor,
			Shoes = ((Shoes == null) ? null : new pz.pt
			{
				Id = Shoes.Id,
				ModelId = Shoes.ModelId,
				Texture = Shoes.Texture
			}),
			Racket = ((Racket == null) ? null : new pz.pu
			{
				Id = Racket.Id,
				Texture = Racket.Texture,
				Colors = Racket.Colors
			}),
			GripColor = GripColor,
			StringColor = StringColor,
			HeadbandColor = HeadbandColor,
			WristbandColor = WristbandColor
		};
	}

	public static CharacterOutfit ftd(Country a)
	{
		pz.TopType c = (a.name.Length % 4) switch
		{
			0 => pz.TopType.TankTop, 
			1 => pz.TopType.Polo, 
			_ => pz.TopType.TShirt, 
		};
		List<string> list = a.primaryColors.Concat(a.secondaryColors).ToList();
		int num = list.IndexOf("#000000");
		int num2 = list.IndexOf("#FFFFFF");
		bool d = a.name[1] < 'n';
		if (num >= 0)
		{
			d = num2 >= 0 && num2 < num;
		}
		else if (num2 >= 0)
		{
			d = true;
		}
		return fte(a.primaryColors.FirstOrDefault(), list.Skip(1).FirstOrDefault(), c, d);
	}

	public static CharacterOutfit fte(string a, string b, pz.TopType c, bool d)
	{
		Color? color = qh.fzu(a);
		Color? color2 = qh.fzu(b);
		if (!color.HasValue)
		{
			color = new Color32(156, 156, 156, byte.MaxValue);
			color2 = new Color32(94, 94, 94, byte.MaxValue);
		}
		else if (!color2.HasValue)
		{
			color2 = qh.fzv(color.Value, 40);
		}
		return new CharacterOutfit
		{
			Top = new pz.pr
			{
				Texture = "Custom_2_Colors_Sleeves_End_Collar",
				Type = c,
				Colors = new List<Color> { color.Value, color2.Value },
				Brand = "1"
			},
			Bottom = pz.pld.First((pz.ps a) => a.Id == (d ? "Short_White" : "Short_Black"))
		};
	}
}
