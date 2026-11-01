using FishNet.Managing;
using FishNet.Transporting;
using FishNet.Transporting.Multipass;
using Newtonsoft.Json.Linq;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class OnlineMatchLifecycle : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float START_TIMEOUT_SECONDS = 25f;

	private const bool lzu = false;

	private NetworkManager lzv;

	private float lzw;

	private bool lzx;

	private static float pgd => 25f;

	private bool pge
	{
		get
		{
			bool num = lzx;
			GameManager current = GameManager.Current;
			bool num2 = num | ((object)current != null && current.OnlineManager?.pgj == true);
			bool result = num2;
			lzx = num2;
			return result;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		OnlineMatchExit.erk();
		lzv = GetComponent<NetworkManager>();
		lzw = Time.unscaledTime;
		MatchSettings.qn online = MatchSettings.Current.Online;
		OnlineStartTrace.ist(online.msw, OnlineStartTraceService.itk(online));
		OnlineStartTrace.isw("role", online.pln ? "host" : "guest");
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		bct.oaw += esi;
		lzv.ClientManager.OnClientConnectionState += esj;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		bct.oaw -= esi;
		if (lzv != null)
		{
			lzv.ClientManager.OnClientConnectionState -= esj;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (pge)
		{
			OnlineStartTrace.isz();
			base.enabled = false;
		}
		else if (Time.unscaledTime - lzw > pgd)
		{
			Debug.LogWarning("[OnlineMatch] peers not connected in time");
			esh();
			OnlineMatchExit.erj(a: true, "timeout");
		}
	}

	private void esh()
	{
		Transport transport = lzv.TransportManager.Transport;
		OnlineStartTrace.isw("exit_client_transport", transport.GetConnectionState(server: false).ToString());
		if (MatchSettings.Current.Online.pln && transport is Multipass multipass)
		{
			OnlineStartTrace.isw("exit_server_transport", multipass.GetConnectionState(server: true, 0).ToString());
		}
	}

	private void esi(string a, JObject b)
	{
		string msw = MatchSettings.Current.Online.msw;
		if (OnlineMaintenance.ime(a, b, msw))
		{
			OnlineMenuNotice.inz(OnlineMaintenance.ilz(b?["until"]));
			OnlineMatchExit.erj(a: false);
		}
		else if (a == "match_ended" && (string?)b?["match_id"] == msw && (string?)b?["reason"] == "irregularity")
		{
			OnlineMenuNotice.iny(baq.iig((string?)b?["outcome"], (string?)b?["forfeit_player_id"], MatchSettings.Current.Online.mta));
			if (!MatchAbsenceWatcher.epy(qu.mug))
			{
				OnlineMatchExit.erj(a: false);
			}
		}
		else if (a == "match_abandoned" && (string?)b?["match_id"] == msw && !MatchAbsenceWatcher.epy(qu.mug))
		{
			string text = (string?)b?["accused_player_id"];
			string text2 = (string?)b?["reason"];
			if (text2 == "forfeit" && text == MatchSettings.Current.Online.mta)
			{
				OnlineMatchExit.erj(a: false);
				return;
			}
			(string, object[]) tuple = baq.iie(text2, OnlineMatchForfeit.esd(text));
			OnlineMenuNotice.iny(tuple.Item1, tuple.Item2);
			OnlineMatchExit.erj(a: false);
		}
		else if (!pge && a == "match_cancelled" && (string?)b?["match_id"] == msw)
		{
			esh();
			OnlineMatchExit.erj(a: true, "match_cancelled");
		}
	}

	private void esj(ClientConnectionStateArgs a)
	{
		OnlineStartTrace.isw("client_state", a.ConnectionState.ToString());
		if (a.ConnectionState == LocalConnectionState.Stopped && !MatchSettings.Current.Online.pln && pge)
		{
			Debug.Log("[OnlineMatch] the host is gone; MatchAbsenceWatcher takes over");
		}
	}
}
