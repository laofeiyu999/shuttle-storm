using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class hr
{
	public static int dds(rk.DifficultyLevel a)
	{
		return a switch
		{
			rk.DifficultyLevel.Beginner => -30, 
			rk.DifficultyLevel.Amateur => -20, 
			rk.DifficultyLevel.Intermediate => -10, 
			rk.DifficultyLevel.Legend => 20, 
			_ => 0, 
		};
	}

	public static float ddt(rk.DifficultyLevel a)
	{
		if (a <= rk.DifficultyLevel.Amateur)
		{
			return 0.16f;
		}
		if (a <= rk.DifficultyLevel.Intermediate)
		{
			return 0.12f;
		}
		if (a == rk.DifficultyLevel.Professional)
		{
			return 0.08f;
		}
		return 0f;
	}

	public static float ddu(rk.DifficultyLevel a)
	{
		if (a <= rk.DifficultyLevel.Amateur)
		{
			return RandomHelper.gjc() * 0.2f;
		}
		return a switch
		{
			rk.DifficultyLevel.Intermediate => RandomHelper.gjc() * 0.15f, 
			rk.DifficultyLevel.Professional => RandomHelper.giy(0.1f), 
			rk.DifficultyLevel.Elite => RandomHelper.giy(0.05f), 
			_ => 0f, 
		};
	}

	public static List<string> ddv(rk.DifficultyLevel a)
	{
		List<string> list = new List<string>();
		if (a <= rk.DifficultyLevel.Professional)
		{
			list.Add("Kill");
		}
		if (a <= rk.DifficultyLevel.Intermediate)
		{
			list.AddRange(new string[2] { "Dive", "Rush" });
		}
		if (a <= rk.DifficultyLevel.Amateur)
		{
			list.AddRange(new string[4] { "JumpSmash", "RightChinaJump", "LeftChinaJump", "RightSmallChinaJump" });
		}
		if (a == rk.DifficultyLevel.Beginner)
		{
			list.AddRange(new string[5] { "LongBackhandDefense-High", "LongBackhandDefense-VeryHigh", "LongForehandDefense-High", "LongForehandDefense-VeryHigh", "LongForehandDefenseFar" });
		}
		return list;
	}

	public static float ddw(rk.DifficultyLevel a)
	{
		if (a <= rk.DifficultyLevel.Intermediate)
		{
			return 0.3f;
		}
		if (a == rk.DifficultyLevel.Professional)
		{
			return 0.5f;
		}
		return 1f;
	}

	public static bool ddx(rk.DifficultyLevel a)
	{
		return a <= rk.DifficultyLevel.Intermediate;
	}

	public static float ddy(rk.DifficultyLevel a)
	{
		if (a == rk.DifficultyLevel.Beginner)
		{
			return RandomHelper.giz(0.8f, 1f);
		}
		if (a == rk.DifficultyLevel.Amateur)
		{
			return RandomHelper.giz(0.6f, 1f);
		}
		if (a == rk.DifficultyLevel.Intermediate)
		{
			return RandomHelper.giz(0f, 0.6f);
		}
		if (a >= rk.DifficultyLevel.Professional)
		{
			return RandomHelper.giz(0f, 0.3f);
		}
		return 0f;
	}

	public static bool ddz(rk.DifficultyLevel a)
	{
		return a <= rk.DifficultyLevel.Intermediate;
	}

	public static float dea(rk.DifficultyLevel a, bool b)
	{
		if (b)
		{
			return a switch
			{
				rk.DifficultyLevel.Beginner => RandomHelper.giz(0f, 0.4f), 
				rk.DifficultyLevel.Amateur => RandomHelper.giz(0f, 0.3f), 
				rk.DifficultyLevel.Intermediate => RandomHelper.giz(0f, 0.2f), 
				_ => 0f, 
			};
		}
		return a switch
		{
			rk.DifficultyLevel.Beginner => RandomHelper.gjc().gtg(0.6f, 1f), 
			rk.DifficultyLevel.Amateur => RandomHelper.gjc().gtg(0.4f, 1f), 
			rk.DifficultyLevel.Intermediate => RandomHelper.giy().gtg(0.2f, 1f), 
			rk.DifficultyLevel.Professional => RandomHelper.giy().gtg(0f, 0.8f), 
			rk.DifficultyLevel.Elite => RandomHelper.gjb().gtg(0f, 0.6f), 
			rk.DifficultyLevel.Legend => RandomHelper.gjb().gtg(0f, 0.2f), 
			_ => 0f, 
		};
	}

	public static float deb(rk.DifficultyLevel a)
	{
		return a switch
		{
			rk.DifficultyLevel.Legend => 0.01f, 
			rk.DifficultyLevel.Elite => 0.02f, 
			rk.DifficultyLevel.Professional => 0.04f, 
			rk.DifficultyLevel.Intermediate => 0.06f, 
			rk.DifficultyLevel.Amateur => 0.08f, 
			rk.DifficultyLevel.Beginner => 0.1f, 
			_ => 0.01f, 
		};
	}

	public static float dec(ShotType a, rk.DifficultyLevel b)
	{
		float a2;
		float a3;
		float b2;
		float b3;
		switch (a)
		{
		case ShotType.Drop:
		case ShotType.Midcourt:
		{
			float num = 0.9f;
			float num2 = 0.7f;
			float num3 = 0.73f;
			a2 = 0.7f;
			a3 = num;
			b2 = num2;
			b3 = num3;
			break;
		}
		case ShotType.Clear:
		{
			float num3 = 0.7f;
			float num2 = 0.67f;
			float num = 0.7f;
			a2 = 0.55f;
			a3 = num3;
			b2 = num2;
			b3 = num;
			break;
		}
		case ShotType.Smash:
		{
			float num = 0.8f;
			float num2 = 0.68f;
			float num3 = 0.72f;
			a2 = 0.6f;
			a3 = num;
			b2 = num2;
			b3 = num3;
			break;
		}
		default:
			return 0.7f;
		}
		float t = (float)b / 5f;
		return RandomHelper.giz(Mathf.Lerp(a2, b2, t), Mathf.Lerp(a3, b3, t));
	}

	public static float ded(rk.DifficultyLevel a)
	{
		return a switch
		{
			rk.DifficultyLevel.Beginner => 1f, 
			rk.DifficultyLevel.Amateur => 0.8f, 
			rk.DifficultyLevel.Intermediate => 0.6f, 
			rk.DifficultyLevel.Professional => 0.2f, 
			_ => 0f, 
		};
	}
}
