using System;
using OPS.Obfuscator.Attribute;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class bfv
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	private struct FunctionResult
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public double val;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public double err;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public int iters;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public bool success;
	}

	private static double oqc = 2.220446049250313E-16;

	private static double oqd = 1.0 / Math.E;

	private static FunctionResult jvx(double a, double b, int c)
	{
		double num = b;
		int i;
		FunctionResult result;
		for (i = 0; i < c; i++)
		{
			double num2 = Math.Exp(num);
			double num3 = num + 1.0;
			double num4 = num * num2 - a;
			num4 = ((!(num > 0.0)) ? (num4 / (num2 * num3 - 0.5 * (num3 + 1.0) * num4 / num3)) : (num4 / num3 / num2));
			num -= num4;
			double num5 = oqc * Math.Max(Math.Abs(num), 1.0 / (Math.Abs(num3) * num2));
			if (Math.Abs(num4) < num5)
			{
				result = default(FunctionResult);
				result.val = num;
				result.err = 2.0 * num5;
				result.iters = i;
				result.success = true;
				return result;
			}
		}
		result = default(FunctionResult);
		result.val = num;
		result.err = Math.Abs(num);
		result.iters = i;
		result.success = false;
		return result;
	}

	private static double jvy(double a)
	{
		float[] array = new float[12]
		{
			-1f, 2.331644f, -1.8121879f, 1.9366311f, -2.3535511f, 3.066859f, -4.1753354f, 5.8580236f, -8.401032f, 12.250753f,
			-18.100697f, 27.029045f
		};
		double num = (double)array[8] + a * ((double)array[9] + a * ((double)array[10] + a * (double)array[11]));
		double num2 = (double)array[5] + a * ((double)array[6] + a * ((double)array[7] + a * num));
		double num3 = (double)array[1] + a * ((double)array[2] + a * ((double)array[3] + a * ((double)array[4] + a * num2)));
		return (double)array[0] + a * num3;
	}

	private static FunctionResult jvz(double a)
	{
		double num = 1.0 / Math.E;
		double num2 = a + num;
		FunctionResult result = default(FunctionResult);
		if (a == 0.0)
		{
			result.val = 0.0;
			result.err = 0.0;
			result.success = true;
			return result;
		}
		if (num2 < 0.0)
		{
			result.val = -1.0;
			result.err = Math.Sqrt(0.0 - num2);
			result.success = false;
			return result;
		}
		if (num2 == 0.0)
		{
			result.val = -1.0;
			result.err = oqc;
			result.success = true;
			return result;
		}
		if (num2 < 0.001)
		{
			double a2 = Math.Sqrt(num2);
			result.val = jvy(a2);
			result.err = 2.0 * oqc * Math.Abs(result.val);
			result.success = true;
			return result;
		}
		int c = 100;
		double num4;
		if (a < 1.0)
		{
			double num3 = Math.Sqrt(Math.E * 2.0 * num2);
			num4 = -1.0 + num3 * (1.0 + num3 * (-0.3333333432674408 + num3 * 11.0 / 72.0));
		}
		else
		{
			num4 = Math.Log(a);
			if (a > 3.0)
			{
				num4 -= Math.Log(num4);
			}
		}
		return jvx(a, num4, c);
	}

	private static FunctionResult jwa(double a)
	{
		FunctionResult result = default(FunctionResult);
		if (a > 0.0)
		{
			return jvz(a);
		}
		if (a == 0.0)
		{
			result.val = 0.0;
			result.err = 0.0;
			result.success = true;
			return result;
		}
		int c = 32;
		double num = 1.0 / Math.E;
		double num2 = a + num;
		if (num2 < 0.0)
		{
			result.val = -1.0;
			result.err = Math.Sqrt(0.0 - num2);
			result.success = false;
			return result;
		}
		double num3;
		if (a < -1E-06)
		{
			num3 = jvy(0.0 - Math.Sqrt(num2));
			if (num2 < 0.003)
			{
				result.val = num3;
				result.err = 5.0 * oqc * Math.Abs(num3);
				result.success = true;
				return result;
			}
		}
		else
		{
			double num4 = Math.Log(0.0 - a);
			double num5 = Math.Log(0.0 - num4);
			num3 = num4 - num5 + num5 / num4;
		}
		return jvx(a, num3, c);
	}

	public static double jwb(double a)
	{
		return jvz(a).val;
	}

	public static double jwc(double a)
	{
		return jwa(a).val;
	}
}
