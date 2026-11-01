using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class qh
{
	public static readonly Color mrj = new Color32(42, 157, 143, byte.MaxValue);

	public static readonly Color mrk = new Color32(38, 70, 83, byte.MaxValue);

	public static readonly Color mrl = new Color32(byte.MaxValue, 115, 0, byte.MaxValue);

	public static readonly Color mrm = new Color32(233, 196, 106, byte.MaxValue);

	public static readonly Color mrn = new Color32(231, 111, 81, byte.MaxValue);

	public static readonly Color mro = new Color32(byte.MaxValue, 238, 206, byte.MaxValue);

	public static readonly Color mrp = new Color32(0, 116, byte.MaxValue, byte.MaxValue);

	public static readonly Color mrq = new Color32(40, 40, 40, byte.MaxValue);

	public static readonly Color mrr = new Color32(32, 204, 32, byte.MaxValue);

	public static readonly Color mrs = new Color32(214, 200, 227, byte.MaxValue);

	public static readonly Color mrt = new Color32(208, 0, 0, byte.MaxValue);

	public static readonly Color mru = new Color32(0, 0, 0, byte.MaxValue);

	public static readonly Color mrv = new Color32(67, 97, 238, byte.MaxValue);

	public static readonly Color mrw = new Color32(165, 190, 0, byte.MaxValue);

	public static readonly Color mrx = new Color32(byte.MaxValue, 107, 53, byte.MaxValue);

	public static readonly Color mry = new Color32(byte.MaxValue, 195, 0, byte.MaxValue);

	public static readonly Color mrz = new Color32(170, 170, 170, byte.MaxValue);

	public static readonly Color msa = new Color32(byte.MaxValue, 204, 0, byte.MaxValue);

	public static readonly Color msb = new Color32(204, 204, 204, byte.MaxValue);

	public static readonly Color msc = new Color32(217, 130, 85, byte.MaxValue);

	public static Color fzq(TournamentSeries a)
	{
		return a switch
		{
			TournamentSeries.WorldTournaments => mrt, 
			TournamentSeries.Super1000 => mru, 
			TournamentSeries.Super750 => mrv, 
			TournamentSeries.Super500 => mrw, 
			TournamentSeries.Super300 => mrx, 
			TournamentSeries.Super100 => mry, 
			TournamentSeries.InternationalChallenge => mrz, 
			_ => Color.black, 
		};
	}

	public static Color fzr(MedalType a)
	{
		return a switch
		{
			MedalType.Gold => msa, 
			MedalType.Silver => msb, 
			MedalType.Bronze => msc, 
			_ => throw new NotImplementedException(), 
		};
	}

	public static Color fzs(Color a)
	{
		if (!fzt(a))
		{
			return Color.black;
		}
		return Color.white;
	}

	public static bool fzt(Color a)
	{
		if (!((double)a.r * 76.245 + (double)a.g * 149.685 + (double)a.b * 29.07 > 186.0))
		{
			return true;
		}
		return false;
	}

	public static Color? fzu(string a)
	{
		Color? result = null;
		if (a != null)
		{
			if (a.StartsWith("#"))
			{
				Color color = Color.white;
				if (!ColorUtility.TryParseHtmlString(a, out color))
				{
					throw new Exception("Invalid color " + a);
				}
				return color;
			}
			result = (Color)typeof(Color).GetProperty(a).GetValue(null, null);
		}
		return result;
	}

	public static Color fzv(Color a, byte b = 40)
	{
		return new Color32((byte)(a.r + (float)(int)b), (byte)(a.g + (float)(int)b), (byte)(a.b + (float)(int)b), (byte)a.a);
	}
}
