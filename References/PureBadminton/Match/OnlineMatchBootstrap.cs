using System.Linq;
using FishNet.Managing;
using FishNet.Transporting;
using FishNet.Transporting.FishyEOSPlugin;
using FishNet.Transporting.Multipass;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[DefaultExecutionOrder(-200)]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class OnlineMatchBootstrap : MonoBehaviour
{
	private const float lyu = 1f;

	private NetworkManager lyv;

	private Multipass lyw;

	private bag lyx;

	private bbl lyy;

	public static void ere(NetworkManager a)
	{
		a.GetComponent<Multipass>().SetClientTransport(0);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private async void Start()
	{
		lyv = GetComponent<NetworkManager>();
		lyw = lyv.GetComponent<Multipass>();
		MatchSettings.qn online = MatchSettings.Current.Online;
		lyx = new bag(online.mtg != 0);
		if (!(await OnlineEosService.ikx()))
		{
			Debug.LogError("[OnlineMatch] EOS login failed");
			OnlineStartTrace.isu("eos_login_failed");
			OnlineMatchExit.erj(a: true, "eos_login_failed");
		}
		else if (!(this == null))
		{
			OnlineStartTrace.isu("eos_login_ok");
			lyy = bbl.ile(online.plp);
			FishyEOS component = lyv.GetComponent<FishyEOS>();
			component.SocketName = online.plp;
			lyv.ServerManager.SetAuthenticator(lyv.GetComponent<OnlineMatchAuthenticator>());
			if (online.pln)
			{
				lyv.ServerManager.OnServerConnectionState += erg;
				OnlineStartTrace.isu("server_start");
				erf(online);
				lyv.ClientManager.StartConnection();
			}
			else
			{
				component.RemoteProductUserId = online.msz;
				InvokeRepeating("ConnectGuest", 0f, 1f);
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		lyy?.Dispose();
		if (!(lyv == null))
		{
			lyv.ServerManager.OnServerConnectionState -= erg;
		}
	}

	private void erf(MatchSettings.qn a)
	{
		int num = 0;
		int[] array = bcy.ito(a: false, a.mth, num);
		foreach (int num2 in array)
		{
			if (num2 == 1)
			{
				lyw.SetPort((ushort)num, num2);
				lyw.SetMaximumClients(MatchSettings.Current.plx.Count() + 2, num2);
				OnlineStartTrace.isv("udp_server_start", num);
			}
			lyw.StartConnection(server: true, num2);
		}
	}

	private void erg(ServerConnectionStateArgs a)
	{
		OnlineStartTrace.isw((a.TransportIndex == 1) ? "udp_server_state" : "server_state", a.ConnectionState.ToString());
	}

	private void erh(MatchSettings.qn a)
	{
		a.mti = true;
		lyw.SetClientTransport(1);
		lyw.SetClientAddress(a.mtf, 1);
		lyw.SetPort(a.mtg, 1);
		Debug.LogWarning($"[OnlineMatch] the EOS connection did not establish; falling back to direct UDP {a.mtf}:{a.mtg}");
		OnlineStartTrace.isv("udp_fallback", lyx.ntp);
		lyv.ClientManager.StartConnection();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void ConnectGuest()
	{
		if (lyv.IsClientStarted || OnlineMatchExit.pfy)
		{
			CancelInvoke("ConnectGuest");
			return;
		}
		LocalConnectionState connectionState = lyv.TransportManager.Transport.GetConnectionState(server: false);
		switch (lyx.igl(connectionState switch
		{
			LocalConnectionState.Starting => GuestTransportState.Starting, 
			LocalConnectionState.Stopped => GuestTransportState.Stopped, 
			_ => GuestTransportState.Other, 
		}, Time.unscaledTime))
		{
		case GuestConnectionStep.Start:
			OnlineStartTrace.isv("attempt", lyx.ntp);
			lyv.ClientManager.StartConnection();
			break;
		case GuestConnectionStep.FallbackToUdp:
			erh(MatchSettings.Current.Online);
			break;
		case GuestConnectionStep.Restart:
			Debug.LogWarning($"[OnlineMatch] connection attempt {lyx.ntp} did not complete in " + $"{8f:0} s; dialling the host again");
			OnlineStartTrace.isv("restart", lyx.ntp);
			lyv.ClientManager.StopConnection();
			break;
		}
	}
}
