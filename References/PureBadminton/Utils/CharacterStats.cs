using System;
using System.Globalization;
using Assets.Scripts.Utils;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class CharacterStats
{
	[JsonProperty("defense")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float defense;

	[JsonProperty("power")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float power;

	[JsonProperty("precision")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float precision;

	[JsonProperty("speed")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float speed;

	[JsonProperty("stamina")]
	[NotObfuscatedCause("Because of compatibility component: JSON - Compatibility : Has a JsonPropertyAttribute Attribute.")]
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public float stamina;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public const float STAT_MAX_VALUE = 100f;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public const float STAT_MIN_VALUE = 50f;

	public float pjo => (defense + power + precision + speed + stamina) / 5f;

	public static CharacterStats pjp => new CharacterStats
	{
		defense = 50f,
		power = 50f,
		precision = 50f,
		speed = 50f,
		stamina = 50f
	};

	public static CharacterStats pjq => new CharacterStats
	{
		defense = 100f,
		power = 100f,
		precision = 100f,
		speed = 100f,
		stamina = 100f
	};

	public static float ftj(float a)
	{
		return (a - 50f) / 50f;
	}

	public static Sprite ftk(CharacterStatsType a)
	{
		return Resources.Load<Sprite>($"Images/StatsIcon/{a}");
	}

	public CharacterStats()
	{
	}

	public CharacterStats(string statsStr)
	{
		string[] array = statsStr.Split(",");
		defense = float.Parse(array[0], CultureInfo.InvariantCulture);
		power = float.Parse(array[1], CultureInfo.InvariantCulture);
		precision = float.Parse(array[2], CultureInfo.InvariantCulture);
		speed = float.Parse(array[3], CultureInfo.InvariantCulture);
		stamina = float.Parse(array[4], CultureInfo.InvariantCulture);
	}

	public CharacterStats ftl()
	{
		return new CharacterStats
		{
			defense = defense,
			power = power,
			precision = precision,
			speed = speed,
			stamina = stamina
		};
	}

	public CharacterStats ftm(float a)
	{
		return new CharacterStats
		{
			defense = (defense + a).gtg(0f, 100f),
			power = (power + a).gtg(0f, 100f),
			precision = (precision + a).gtg(0f, 100f),
			speed = (speed + a).gtg(0f, 100f),
			stamina = (stamina + a).gtg(0f, 100f)
		};
	}

	public float ftn(CharacterStatsType a)
	{
		return a switch
		{
			CharacterStatsType.Defense => defense, 
			CharacterStatsType.Power => power, 
			CharacterStatsType.Precision => precision, 
			CharacterStatsType.Speed => speed, 
			CharacterStatsType.Stamina => stamina, 
			_ => throw new NotImplementedException(), 
		};
	}

	public void fto(CharacterStatsType a, float b)
	{
		switch (a)
		{
		case CharacterStatsType.Defense:
			defense += b;
			break;
		case CharacterStatsType.Power:
			power += b;
			break;
		case CharacterStatsType.Precision:
			precision += b;
			break;
		case CharacterStatsType.Speed:
			speed += b;
			break;
		case CharacterStatsType.Stamina:
			stamina += b;
			break;
		default:
			throw new NotImplementedException();
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override string ToString()
	{
		Func<float, string> func = (float a) => Math.Round(a, 4).ToString(CultureInfo.InvariantCulture);
		return func(defense) + "," + func(power) + "," + func(precision) + "," + func(speed) + "," + func(stamina);
	}

	public string ftp()
	{
		return $"{Mathf.Floor(defense)},{Mathf.Floor(power)},{Mathf.Floor(precision)},{Mathf.Floor(speed)},{Mathf.Floor(stamina)}";
	}
}
