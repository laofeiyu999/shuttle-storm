using System;
using System.Threading.Tasks;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class nz
{
	private static bool mmo;

	private static float mmp;

	public static bool mmn { get; private set; }

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Save()
	{
		fop();
	}

	public static async Task fop()
	{
		if (mmn)
		{
			mmo = true;
		}
		else
		{
			await foq();
		}
	}

	private static async Task foq()
	{
		mmo = false;
		mmn = true;
		mmp = Time.time;
		await Task.Run(delegate
		{
			try
			{
				Debug.Log("Saving career...");
				qa.Save(Career.Current);
				Debug.Log("Saving career complete");
			}
			catch (Exception exception)
			{
				Debug.LogError("Failed to save career.");
				Debug.LogException(exception);
			}
		});
		if (mmo)
		{
			await foq();
		}
		else
		{
			mmn = false;
		}
	}

	public static WaitUntil @for(bool a)
	{
		if (a)
		{
			return new WaitUntil(() => !mmn, TimeSpan.FromSeconds(10.0), delegate
			{
			});
		}
		return new WaitUntil(() => !mmn);
	}
}
