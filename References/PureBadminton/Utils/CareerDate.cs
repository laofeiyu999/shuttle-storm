using System;
using System.Globalization;
using System.Runtime.CompilerServices;
using Newtonsoft.Json;
using OPS.Obfuscator.Attribute;

[Serializable]
[JsonConverter(typeof(oa))]
[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
public struct CareerDate
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int Year;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
	public int WeekNumber;

	public CareerDate(int year, int weekNumber)
	{
		Year = year;
		WeekNumber = weekNumber;
	}

	public CareerDate(string dateStr)
	{
		string[] array = dateStr.Split("-");
		Year = int.Parse(array[0]);
		WeekNumber = int.Parse(array[1]);
	}

	public DateTime fos(DayOfWeek a)
	{
		return ISOWeek.ToDateTime(Year, WeekNumber, a);
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override string ToString()
	{
		return $"{Year}-{WeekNumber.ToString().PadLeft(2, '0')}";
	}

	public int fot(CareerDate a)
	{
		int num = Year - a.Year;
		return WeekNumber + num * 53 - a.WeekNumber;
	}

	public CareerDate fou()
	{
		if (WeekNumber != 52)
		{
			return new CareerDate(Year, WeekNumber + 1);
		}
		return new CareerDate(Year + 1, 1);
	}

	public CareerDate fov(int a)
	{
		int num = WeekNumber + a;
		if (num <= 52)
		{
			return new CareerDate(Year, num);
		}
		return new CareerDate(Year + 1, num - 52);
	}

	[SpecialName]
	public static bool fow(CareerDate a, CareerDate b)
	{
		if (a.Year == b.Year)
		{
			return a.WeekNumber == b.WeekNumber;
		}
		return false;
	}

	[SpecialName]
	public static bool fox(CareerDate a, CareerDate b)
	{
		if (a.Year == b.Year)
		{
			return a.WeekNumber != b.WeekNumber;
		}
		return true;
	}
}
