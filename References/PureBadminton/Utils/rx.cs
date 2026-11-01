using System;
using System.Text;
using System.Threading.Tasks;
using OPS.Obfuscator.Attribute;
using Steamworks;
using Steamworks.Data;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class rx : ru
{
	private const string myn = "purebadminton";

	private const double myo = 5.0;

	private bool myp;

	private AuthTicket myq;

	public rx()
	{
		try
		{
			SteamClient.Init(pp.plb.Value);
			myp = true;
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
		}
	}

	public void gjn(AchievementType a)
	{
		if (myp)
		{
			new Achievement(a.ToString()).Trigger();
		}
	}

	public bool gjo(AchievementType a)
	{
		if (!myp)
		{
			return false;
		}
		return new Achievement(a.ToString()).State;
	}

	public async Task<rw> gjp()
	{
		if (!myp)
		{
			return null;
		}
		if (myq != null)
		{
			myq.Cancel();
			myq = null;
		}
		AuthTicket authTicket = await SteamUser.GetAuthTicketForWebApiAsync("purebadminton", 5.0);
		if (authTicket == null || authTicket.Data == null || authTicket.Data.Length == 0)
		{
			return null;
		}
		myq = authTicket;
		return new rw
		{
			myj = "steam",
			myk = gjq(authTicket.Data),
			myl = SteamClient.SteamId.ToString(),
			mym = SteamClient.Name
		};
	}

	private static string gjq(byte[] a)
	{
		StringBuilder stringBuilder = new StringBuilder(a.Length * 2);
		foreach (byte b in a)
		{
			stringBuilder.Append(b.ToString("X2"));
		}
		return stringBuilder.ToString();
	}
}
