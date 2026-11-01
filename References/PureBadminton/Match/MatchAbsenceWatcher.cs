using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using FishNet;
using FishNet.Connection;
using FishNet.Managing;
using FishNet.Transporting;
using FishNet.Transporting.FishyEOSPlugin;
using FishNet.Transporting.Multipass;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchAbsenceWatcher : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ku
	{
		public MatchSettings lwq;

		public string lwr;

		internal hq<string, bool, bool> eom(MatchSettings.PlayerSettings a)
		{
			return new hq<string, bool, bool>(lwq.gbz(a), MatchSettings.gcl(a.Position), lwr != null && a.OnlinePlayerId == lwr);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kv
	{
		public Task<bool> lws;

		internal bool eon()
		{
			return lws.IsCompleted;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kw
	{
		public string lwt;

		public MatchAbsenceWatcher lwu;

		internal bool eoo(AbsenceSeat a)
		{
			if (a.PlayerId != lwt)
			{
				return lwu.lxs.iez(a.PlayerId);
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kx
	{
		public Task<bool> lwv;

		internal bool eop()
		{
			return lwv.IsCompleted;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ky
	{
		public Task<zr> lww;

		internal bool eoq()
		{
			return lww.IsCompleted;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kz
	{
		public Task<bool> lwx;

		internal bool eor()
		{
			return lwx.IsCompleted;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float MinimumInterruptionSeconds = 3f;

	private const float lya = 0.5f;

	private readonly bak lyb = new bak(3f);

	private OnlineEosLinkMonitor lyc;

	private Transport lyd;

	private Coroutine lye;

	private float lyf = 1f;

	private bool lyg;

	private List<AbsenceSeat> lyh;

	private AbsenceThresholds lyi;

	private bool lyj;

	private float lyk;

	private OnlineMatchAuthenticator lym;

	private readonly Dictionary<NetworkConnection, string> lyn = new Dictionary<NetworkConnection, string>();

	private int lyo;

	private int? lyp;

	public static MatchAbsenceWatcher lxr { get; private set; }

	public yp lxs { get; } = new yp();


	public bool lxt { get; private set; }

	public string lxu { get; private set; }

	public float lxv { get; private set; } = -1f;


	public bool lxw { get; private set; }

	public bool lxy { get; private set; }

	public float lxz { get; private set; }

	public bool lyl { get; private set; }

	private float pfw => Time.unscaledTime - lyk;

	private static bool pfx => epy(qu.mug);

	public event Action lxx;

	public static bool epy(qu a)
	{
		return a?.plz ?? false;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		lxr = this;
		lyk = Time.unscaledTime;
		MatchSettings current = MatchSettings.Current;
		lyi = current.Online.mtd;
		lyh = eqa(current);
	}

	public static List<AbsenceSeat> eqa(MatchSettings a)
	{
		string lwr = a.Online?.msy;
		return (from a in a.plv
			orderby (int)a.Position
			select new hq<string, bool, bool>(a.gbz(a), MatchSettings.gcl(a.Position), lwr != null && a.OnlinePlayerId == lwr) into a
			where !string.IsNullOrEmpty(a.oyk)
			group a by a.oyk into a
			select a.FirstOrDefault((hq<string, bool, bool> a) => a.oym) ?? a.First()).Select(delegate(hq<string, bool, bool> a)
		{
			AbsenceSeat result = default(AbsenceSeat);
			result.PlayerId = a.oyk;
			result.TeamA = a.oyl;
			return result;
		}).ToList();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		if (lxr == this)
		{
			lxr = null;
		}
		lyc?.Dispose();
		if (lyd != null)
		{
			lyd.OnClientReceivedData -= eqn;
			lyd.OnServerReceivedData -= eqo;
		}
		if (lym != null)
		{
			lym.lyq -= eqb;
		}
		NetworkManager networkManager = InstanceFinder.NetworkManager;
		if (!(networkManager == null))
		{
			networkManager.ServerManager.OnRemoteConnectionState -= eqc;
			networkManager.ClientManager.OnClientConnectionState -= eqk;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		NetworkManager networkManager = InstanceFinder.NetworkManager;
		if (networkManager == null)
		{
			Debug.LogWarning("[MatchAbsenceWatcher] no NetworkManager found; absence detection is disabled.");
			return;
		}
		lyc = OnlineEosLinkMonitor.ikq();
		if (lyc != null)
		{
			lyc.nwu += eqm;
		}
		lyd = networkManager.TransportManager.Transport;
		if (!MatchSettings.Current.Online.pln)
		{
			networkManager.ClientManager.OnClientConnectionState += eqk;
			lyd.OnClientReceivedData += eqn;
			return;
		}
		lyd.OnServerReceivedData += eqo;
		lym = networkManager.GetComponent<OnlineMatchAuthenticator>();
		if (lym != null)
		{
			lym.lyq += eqb;
		}
		networkManager.ServerManager.OnRemoteConnectionState += eqc;
		if (!(lym != null))
		{
			return;
		}
		foreach (NetworkConnection item in networkManager.ServerManager.Clients.Values.ToList())
		{
			if (!lyn.ContainsKey(item))
			{
				string text = lym.eqz(item);
				if (text != null)
				{
					lyn[item] = text;
				}
			}
		}
	}

	private void eqb(NetworkConnection a, string b)
	{
		lyn[a] = b;
		if (lxs.iez(b))
		{
			eqf(b);
		}
	}

	private void eqc(NetworkConnection a, RemoteConnectionStateArgs b)
	{
		if (b.ConnectionState != 0 || !lyn.TryGetValue(a, out var value))
		{
			return;
		}
		lyn.Remove(a);
		if (!pfx && !lyl)
		{
			lyb.ihd(value);
			if (!lxs.iez(value))
			{
				eqd(value, pfw);
			}
		}
	}

	private void eqd(string a, float b)
	{
		if (!(a == MatchSettings.Current.Online.mta))
		{
			lxw = false;
			int a2 = ++lyo;
			lxs.iev(a, b, AbsenceProbe.NotProbed);
			GameManager.Current.OnlineManager?.eui(a, b: true);
			Refresh();
			StartCoroutine(eqe(a2, a));
		}
	}

	private IEnumerator eqe(int a, string b)
	{
		Task<bool> lws = bbf.ike(MatchSettings.Current.Online.mte);
		yield return new WaitUntil(() => lws.IsCompleted);
		if (a == lyo)
		{
			if (lws.Status == TaskStatus.RanToCompletion && lws.Result)
			{
				lxs.iey(b, AbsenceProbe.RealtimeUp);
				yield break;
			}
			lxw = true;
			lxs.iey(b, AbsenceProbe.RealtimeDown);
			lxs.iex(AbsenceEventKind.SelfOffline, MatchSettings.Current.Online.mta, pfw, AbsenceProbe.RealtimeDown);
		}
	}

	private void eqf(string a)
	{
		lxs.iew(a, pfw);
		GameManager.Current.OnlineManager?.eui(a, b: false);
		if (lxw)
		{
			lxw = false;
			GameManager.Current.eap();
		}
		Refresh();
	}

	public void eqg(string a, bool b)
	{
		if (!pfx && !lyl)
		{
			if (b)
			{
				lxs.iev(a, pfw, AbsenceProbe.NotProbed);
			}
			else
			{
				lxs.iew(a, pfw);
			}
			Refresh();
		}
	}

	public void eqh(string a)
	{
		lyl = true;
		lyj = true;
		lxt = false;
		lxu = null;
		lxv = -1f;
		lyp = null;
		this.lxx?.Invoke();
	}

	public List<string> eqi()
	{
		string lwt = MatchSettings.Current.Online.msy;
		return (from a in lyh
			where a.PlayerId != lwt && lxs.iez(a.PlayerId)
			select a.PlayerId).ToList();
	}

	public void eqj(IEnumerable<string> a)
	{
		if (pfx || lyl)
		{
			return;
		}
		HashSet<string> hashSet = ((a != null) ? new HashSet<string>(a) : new HashSet<string>());
		string msy = MatchSettings.Current.Online.msy;
		string mta = MatchSettings.Current.Online.mta;
		foreach (AbsenceSeat item in lyh)
		{
			if (!(item.PlayerId == msy) && !(item.PlayerId == mta))
			{
				bool flag = hashSet.Contains(item.PlayerId);
				if (flag && !lxs.iez(item.PlayerId))
				{
					lxs.iev(item.PlayerId, pfw, AbsenceProbe.NotProbed);
				}
				else if (!flag && lxs.iez(item.PlayerId))
				{
					lxs.iew(item.PlayerId, pfw);
				}
			}
		}
		Refresh();
	}

	private void eqk(ClientConnectionStateArgs a)
	{
		if (pfx || lyl)
		{
			return;
		}
		string msy = MatchSettings.Current.Online.msy;
		if (a.ConnectionState == LocalConnectionState.Stopped)
		{
			lyg = false;
			lyb.ihd(msy);
			if (!lxy)
			{
				eql(pfw);
			}
			if (lye == null)
			{
				lye = StartCoroutine(eqt());
			}
		}
		else if (a.ConnectionState == LocalConnectionState.Started && lxy)
		{
			lyg = true;
		}
	}

	private void eql(float a)
	{
		lxy = true;
		lxz = Time.unscaledTime;
		lyf = 1f;
		string msy = MatchSettings.Current.Online.msy;
		lxs.iev(msy, a, AbsenceProbe.NotProbed);
		lxs.iex(AbsenceEventKind.SelfOffline, MatchSettings.Current.Online.mta, a, AbsenceProbe.NotProbed);
		Refresh();
	}

	private void eqm(string a)
	{
		if (!lyj && !pfx)
		{
			string text = eqr(a);
			if (text != null)
			{
				Debug.Log("[Absence] link to " + text + " interrupted");
				lyb.igz(text, pfw);
			}
		}
	}

	private void eqn(ClientReceivedDataArgs a)
	{
		eqp(MatchSettings.Current.Online.msy);
	}

	private void eqo(ServerReceivedDataArgs a)
	{
		NetworkManager networkManager = InstanceFinder.NetworkManager;
		if (!(networkManager == null) && networkManager.ServerManager.Clients.TryGetValue(a.ConnectionId, out var value) && lyn.TryGetValue(value, out var value2))
		{
			eqp(value2);
		}
	}

	private void eqp(string a)
	{
		if (!lyb.iha(a, out var b) || pfw - b < 0.5f || !lyb.ihc(a) || lyj)
		{
			return;
		}
		Debug.Log($"[Absence] link to {a} restored after {pfw - b:F1}s");
		if (MatchSettings.Current.Online.pln)
		{
			if (lxs.iez(a))
			{
				eqf(a);
			}
		}
		else if (lxy)
		{
			lyg = true;
		}
	}

	private void eqq(string a, float b)
	{
		Debug.Log($"[Absence] link to {a} still interrupted after {3f}s: recording the absence");
		if (MatchSettings.Current.Online.pln)
		{
			if (!lxs.iez(a))
			{
				eqd(a, b);
			}
		}
		else if (!lxy)
		{
			eql(b);
		}
	}

	private string eqr(string a)
	{
		if (string.IsNullOrEmpty(a))
		{
			return null;
		}
		MatchSettings.qn online = MatchSettings.Current.Online;
		if (!online.pln)
		{
			if (!string.Equals(a, online.msz, StringComparison.OrdinalIgnoreCase))
			{
				return null;
			}
			return online.msy;
		}
		foreach (KeyValuePair<NetworkConnection, string> item in lyn)
		{
			if (string.Equals(item.Key.GetAddress(), a, StringComparison.OrdinalIgnoreCase))
			{
				return item.Value;
			}
		}
		return null;
	}

	private void eqs()
	{
		OnlineMatchManager onlineMatchManager = GameManager.Current?.OnlineManager;
		if (!(onlineMatchManager == null) && onlineMatchManager.IsSpawned && qu.mug != null && qu.mug.mui.Count != 0)
		{
			lyg = false;
			if (lxy)
			{
				string msy = MatchSettings.Current.Online.msy;
				lxy = false;
				lxs.iew(msy, pfw);
				lxs.iex(AbsenceEventKind.SelfOnline, MatchSettings.Current.Online.mta, pfw, AbsenceProbe.NotProbed);
				Refresh();
				onlineMatchManager.eue();
			}
		}
	}

	private IEnumerator eqt()
	{
		MatchSettings.qn online = MatchSettings.Current.Online;
		int num = 0;
		while (lxy && !lyj && !OnlineMatchExit.pfy)
		{
			yield return new WaitForSecondsRealtime(lyf);
			lyf = Mathf.Min(lyf * 2f, 5f);
			if (!lxy || lyj || OnlineMatchExit.pfy)
			{
				break;
			}
			NetworkManager networkManager = InstanceFinder.NetworkManager;
			if (networkManager.TransportManager.Transport.GetConnectionState(server: false) != LocalConnectionState.Stopped)
			{
				continue;
			}
			if (!online.plo)
			{
				Task<zr> lww = bcg.inv(online.msw);
				yield return new WaitUntil(() => lww.IsCompleted);
				if (OnlineMatchExit.pfy)
				{
					lye = null;
					yield break;
				}
				zr zr2 = ((lww.Status == TaskStatus.RanToCompletion) ? lww.Result : null);
				if (zr2 == null)
				{
					Debug.LogWarning("[MatchAbsenceWatcher] match-session failed during reconnection; retrying with the last known host address.");
				}
				else
				{
					if (equ(zr2.status))
					{
						OnlineMenuNotice.nzm = baq.iih(zr2.status, zr2.forfeit_player_id, MatchSettings.Current?.Online?.mta);
						OnlineMatchExit.erj(a: false);
						lye = null;
						yield break;
					}
					online.msz = zr2.host_eos_product_user_id;
					bca.inl(online, zr2.udp_fallback);
				}
			}
			Multipass component = networkManager.GetComponent<Multipass>();
			if (bcy.itq(online.mti, num, online.mtg != 0))
			{
				online.mti = true;
				component.SetClientTransport(1);
				component.SetClientAddress(online.mtf, 1);
				component.SetPort(online.mtg, 1);
				Debug.Log($"[MatchAbsenceWatcher] reconnecting over direct UDP {online.mtf}:{online.mtg}");
				networkManager.ClientManager.StartConnection();
				continue;
			}
			Task<bool> lwv = OnlineEosService.ikx();
			yield return new WaitUntil(() => lwv.IsCompleted);
			if (OnlineMatchExit.pfy)
			{
				lye = null;
				yield break;
			}
			if (lwv.Status != TaskStatus.RanToCompletion || !lwv.Result)
			{
				Debug.LogWarning("[MatchAbsenceWatcher] EOS re-login failed during reconnection; will retry.");
				continue;
			}
			FishyEOS component2 = networkManager.GetComponent<FishyEOS>();
			component2.SocketName = online.plp;
			component2.RemoteProductUserId = online.msz;
			component.SetClientTransport(0);
			num++;
			networkManager.ClientManager.StartConnection();
		}
		lye = null;
	}

	private static bool equ(string a)
	{
		switch (a)
		{
		default:
			return a == "void";
		case "completed":
		case "pending_review":
		case "abandoned":
			return true;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (lyj)
		{
			return;
		}
		if (pfx)
		{
			Refresh();
			return;
		}
		foreach (bak.Confirmation item in lyb.ihb(pfw))
		{
			eqq(item.Key, item.Since);
		}
		if (lyg)
		{
			eqs();
		}
		Refresh();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Refresh()
	{
		if (lyl)
		{
			return;
		}
		bool flag = pfx;
		if ((GameManager.Current?.pdv ?? false) || flag)
		{
			bool num = lxt || lxu != null || lyp.HasValue || (flag && lxy);
			if (flag && lxy)
			{
				lxy = false;
				lyg = false;
				if (lye != null)
				{
					StopCoroutine(lye);
				}
				lye = null;
			}
			lxt = false;
			lxu = null;
			lxv = -1f;
			lyp = null;
			if (num)
			{
				this.lxx?.Invoke();
			}
			return;
		}
		bool flag2 = yq.iff(lxs, lyh);
		string text = (flag2 ? yq.ifg(lxs, lyh) : null);
		float? num2 = eqw();
		int? num3 = (num2.HasValue ? new int?(Mathf.FloorToInt(num2.Value)) : null);
		bool num4 = flag2 != lxt || text != lxu || num3 != lyp;
		lxt = flag2;
		lxu = text;
		lxv = num2 ?? (-1f);
		lyp = num3;
		if (num4)
		{
			this.lxx?.Invoke();
		}
		if (!lyj)
		{
			AbsenceVerdict a = yq.ifh(lxs, lyh, lyi, pfw);
			if (a.EndsMatch)
			{
				lyj = true;
				StartCoroutine(eqv(a));
			}
		}
	}

	private IEnumerator eqv(AbsenceVerdict a)
	{
		MatchSettings.qn online = MatchSettings.Current.Online;
		lxs.iex(AbsenceEventKind.ClaimSent, a.AccusedPlayerId, pfw, AbsenceProbe.NotProbed);
		Debug.Log("[Absence] ending the match: " + yq.ifj(a.Reason) + " against " + a.AccusedPlayerId);
		if (!online.plo)
		{
			Task<bool> lwx = bax.ijm(online.msw, a.AccusedPlayerId, a.Reason, lxs.pvc);
			yield return new WaitUntil(() => lwx.IsCompleted);
		}
		if (!OnlineMatchExit.pfy)
		{
			OnlineMenuNotice.nzm = "MatchEndedOnDisconnection";
			OnlineMatchExit.erj(a: false);
		}
	}

	private float? eqw()
	{
		float? result = null;
		foreach (AbsenceSeat item in lyh)
		{
			if (lxs.iez(item.PlayerId))
			{
				float num = lyi.BudgetSeconds - lxs.ifb(item.PlayerId, pfw);
				float num2 = (yq.ifk(lxs, lyh, item.TeamA) ? Mathf.Min(lyi.GraceSeconds - (pfw - lxs.ifa(item.PlayerId)), num) : num);
				if (!result.HasValue || num2 < result.Value)
				{
					result = num2;
				}
			}
		}
		return result;
	}
}
