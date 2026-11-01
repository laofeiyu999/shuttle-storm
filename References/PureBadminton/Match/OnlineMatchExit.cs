using FishNet;
using FishNet.Managing;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class OnlineMatchExit
{
	private static bool lyz;

	public static bool pfy => lyz;

	public static void erj(bool a, string b = null)
	{
		if (lyz)
		{
			return;
		}
		lyz = true;
		if (a)
		{
			OnlineStartTrace.ita(b ?? "unknown");
		}
		MatchSettings.qn online = MatchSettings.Current.Online;
		MatchLogDriver.eek();
		NetworkManager networkManager = InstanceFinder.NetworkManager;
		if (networkManager != null)
		{
			if (networkManager.IsClientStarted)
			{
				networkManager.ClientManager.StopConnection();
			}
			if (networkManager.IsServerStarted)
			{
				networkManager.ServerManager.StopConnection(sendDisconnectMessage: true);
			}
		}
		Time.timeScale = 1f;
		LoadingScreen.psj.hgd();
		if (online == null || online.plo)
		{
			if (a)
			{
				Debug.LogError("[OnlineMatch] the debug match could not start");
			}
			LoadingScreen.hfx("MainMenu");
			return;
		}
		bct.ipv();
		if (a)
		{
			OnlineMenuNotice.nzm = "MatchCancelled";
		}
		LoadingScreen.hfx("OnlineMenu");
	}

	public static void erk()
	{
		lyz = false;
		OnlineMatchForfeit.ese();
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		lyz = false;
	}
}
