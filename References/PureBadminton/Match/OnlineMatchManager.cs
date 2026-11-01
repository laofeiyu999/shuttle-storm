using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using FishNet;
using FishNet.Connection;
using FishNet.Managing;
using FishNet.Object;
using FishNet.Object.Synchronizing;
using FishNet.Serializing;
using FishNet.Serializing.Generated;
using FishNet.Transporting;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.SceneManagement;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class OnlineMatchManager : NetworkBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lk
	{
		public NetworkConnection lzy;

		internal bool esn(KeyValuePair<string, NetworkConnection> a)
		{
			return a.Value == lzy;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ll
	{
		public MatchSettings.PositionOnCourt lzz;

		internal bool eso(CharacterManager a)
		{
			return a.Player.Position == lzz;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class lm
	{
		public Task<bool> maa;

		internal bool esp()
		{
			return maa.IsCompleted;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ln
	{
		public KeyValuePair<MatchSettings.PositionOnCourt, float> mab;

		internal bool esq(CharacterManager a)
		{
			return a.Player.Position == mab.Key;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharacterNetworkSync _proxyPrefab;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public readonly SyncVar<bool> _initialized = new SyncVar<bool>();

	private OnlineMatchAuthenticator mam;

	private readonly Dictionary<string, NetworkConnection> man = new Dictionary<string, NetworkConnection>();

	private readonly Dictionary<MatchSettings.PositionOnCourt, CharacterNetworkSync> mao = new Dictionary<MatchSettings.PositionOnCourt, CharacterNetworkSync>();

	private bool maq;

	private const float mar = 10f;

	private const float mas = 5f;

	private const float mat = 5f;

	private float mau;

	private const float mav = 0.02f;

	private const float maw = 0.06f;

	private const float may = 0.15f;

	private const float maz = 2f;

	private readonly Dictionary<int, float> mba = new Dictionary<int, float>();

	private float mbb = -999f;

	private const float mbc = 0.05f;

	private const float mbd = 0.2f;

	private const float mbe = 0.4f;

	private readonly bah mbf = new bah();

	private float mbg = -999f;

	private const float mbi = 6f;

	private readonly Dictionary<int, float> mbj = new Dictionary<int, float>();

	private bool mbk;

	private bool mbl;

	private bool mbm;

	public bool pgj => _initialized.Value;

	public long? pgk
	{
		get
		{
			if (base.IsServerStarted)
			{
				float value;
				List<float> list = (from a in mba
					where mbj.TryGetValue(a.Key, out value) && Time.unscaledTime - value <= 6f
					select a.Value).ToList();
				if (list.Count <= 0)
				{
					return null;
				}
				return (long)Mathf.Round(list.Min() * 1000f);
			}
			if (!base.IsClientStarted)
			{
				return null;
			}
			return base.TimeManager.RoundTripTime;
		}
	}

	public event Action<string, float> mbh;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public virtual void Awake()
	{
		NetworkInitialize___Early();
		ewf();
		NetworkInitialize___Late();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		Debug.Log("OnlineMatchSetup Disabled");
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		NetworkManager networkManager = InstanceFinder.NetworkManager;
		if (networkManager != null)
		{
			networkManager.ClientManager.OnClientConnectionState -= eta;
		}
	}

	private void eta(ClientConnectionStateArgs a)
	{
		if (a.ConnectionState == LocalConnectionState.Stopped)
		{
			mbk = false;
		}
	}

	public CharacterNetworkSync etb(MatchSettings.PositionOnCourt a)
	{
		if (!mao.TryGetValue(a, out var value))
		{
			return null;
		}
		return value;
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnStartServer()
	{
		base.OnStartServer();
		mam = base.NetworkManager.GetComponent<OnlineMatchAuthenticator>();
		mam.lyq += etd;
		base.ServerManager.OnRemoteConnectionState += etc;
		foreach (NetworkConnection item in base.ServerManager.Clients.Values.ToList())
		{
			string text = mam.eqz(item);
			if (text != null)
			{
				etd(item, text);
			}
		}
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnStopServer()
	{
		base.OnStopServer();
		if (mam != null)
		{
			mam.lyq -= etd;
		}
		base.ServerManager.OnRemoteConnectionState -= etc;
	}

	private void etc(NetworkConnection a, RemoteConnectionStateArgs b)
	{
		if (b.ConnectionState != 0)
		{
			return;
		}
		string key = man.FirstOrDefault((KeyValuePair<string, NetworkConnection> a) => a.Value == a).Key;
		if (key != null)
		{
			man.Remove(key);
			mbf.igp(a.ClientId);
			if (!pgj)
			{
				Debug.LogWarning("[OnlineMatch] " + key + " disconnected before the start");
				OnlineStartTrace.isu("peer_lost");
				OnlineMatchExit.erj(a: true, "peer_disconnected");
			}
			else
			{
				Debug.Log("[OnlineMatch] " + key + " disconnected; seat freed for a reconnection");
			}
		}
	}

	private void etd(NetworkConnection a, string b)
	{
		man[b] = a;
		OnlineStartTrace.isv("admitted", man.Count);
		if (pgj)
		{
			foreach (MatchSettings.PositionOnCourt lzz in GameManager.Current.pdy.gcb(b))
			{
				CharacterNetworkSync characterNetworkSync = etb(lzz);
				if (characterNetworkSync != null)
				{
					characterNetworkSync.NetworkObject.GiveOwnership(a);
				}
				if (GameManager.Current.peb)
				{
					CharacterManager characterManager = GameManager.Current.Characters.Find((CharacterManager a) => a.Player.Position == lzz);
					if (characterManager != null)
					{
						characterManager.AllowedAction = CharacterManager.PossibleAction.None;
					}
				}
			}
			Debug.Log("[OnlineMatch] " + b + " reconnected; ownership handed back");
		}
		base.NetworkManager.SceneManager.AddConnectionToScene(a, UnityEngine.SceneManagement.SceneManager.GetActiveScene());
		MatchSettings matchSettings = GameManager.Current.pdy;
		if (!maq && man.ContainsKey(matchSettings.Online.msy) && matchSettings.plx.All(man.ContainsKey))
		{
			maq = true;
			StartCoroutine(ete());
		}
	}

	private IEnumerator ete()
	{
		yield return new WaitUntil(() => GameManager.Current != null && GameManager.Current.Characters.Count >= GameManager.Current.pdy.plv.Count);
		if (!etf())
		{
			yield break;
		}
		OnlineStartTrace.isu("proxies_spawned");
		MatchSettings.qn online = GameManager.Current.pdy.Online;
		if (!online.plo)
		{
			OnlineStartTrace.isu("match_ready_call");
			Task<bool> maa = bcg.inw(online.msw);
			yield return new WaitUntil(() => maa.IsCompleted);
			if (maa.Status != TaskStatus.RanToCompletion || !maa.Result)
			{
				OnlineStartTrace.isu("match_ready_failed");
				OnlineMatchExit.erj(a: true, "match_ready_failed");
				yield break;
			}
			OnlineStartTrace.isu("match_ready_ok");
		}
		_initialized.Value = true;
	}

	[Server]
	private bool etf()
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return default(bool);
		}
		MatchSettings matchSettings = GameManager.Current.pdy;
		foreach (CharacterManager character in GameManager.Current.Characters)
		{
			string text = matchSettings.gbz(character.Player);
			NetworkConnection value;
			if (text == matchSettings.Online.msy)
			{
				value = base.LocalConnection;
			}
			else if (!man.TryGetValue(text, out value))
			{
				Debug.LogWarning("[OnlineMatch] " + text + " disconnected before proxies could spawn");
				OnlineMatchExit.erj(a: true, "peer_gone_before_spawn");
				return false;
			}
			CharacterNetworkSync characterNetworkSync = UnityEngine.Object.Instantiate(_proxyPrefab);
			characterNetworkSync.pfo = character.Player.Position;
			Spawn(characterNetworkSync, value);
			mao[character.Player.Position] = characterNetworkSync;
		}
		return true;
	}

	public void etg()
	{
		GameManager.Current.StartCoroutine(eth());
	}

	private IEnumerator eth()
	{
		GameManager current = GameManager.Current;
		CharacterManager characterManager = current.Characters.Find((CharacterManager a) => a.pas);
		if (characterManager == null)
		{
			yield break;
		}
		float unscaledTime = Time.unscaledTime;
		bool flag = false;
		while (!current.peb && characterManager.lhi.lju == null)
		{
			if (MatchAbsenceWatcher.lxr?.lxt ?? false)
			{
				unscaledTime = Time.unscaledTime;
				if (flag && current.ServeCountdownPanel != null)
				{
					current.ServeCountdownPanel.gxs();
					flag = false;
				}
				yield return null;
				continue;
			}
			float num = Time.unscaledTime - unscaledTime;
			if (!flag && characterManager.pap && num >= 5f)
			{
				if (current.ServeCountdownPanel != null)
				{
					current.ServeCountdownPanel.gxr();
				}
				flag = true;
			}
			if (current.pdt && !characterManager.IsBot && num >= 10f && characterManager.lhi.lju == null)
			{
				if (MatchLog.peq)
				{
					MatchLog.edx(new kb
					{
						ltf = MatchLog.eec(characterManager)
					});
				}
				characterManager.lhi.dtj();
				break;
			}
			yield return null;
		}
		if (flag && current.ServeCountdownPanel != null)
		{
			current.ServeCountdownPanel.gxs();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (base.IsServerStarted)
		{
			ets();
			if (!(Time.time - mau < 5f))
			{
				eti();
			}
		}
	}

	[Server]
	public void eti()
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		mau = Time.time;
		List<CharacterManager> list = GameManager.Current?.Characters;
		if (list == null || list.Count == 0)
		{
			return;
		}
		Dictionary<MatchSettings.PositionOnCourt, float> dictionary = new Dictionary<MatchSettings.PositionOnCourt, float>(list.Count);
		foreach (CharacterManager item in list)
		{
			dictionary[item.Player.Position] = item.lhk.ozw;
		}
		etk(dictionary);
		if (MatchLog.peq)
		{
			MatchLog.edx(etj(dictionary, b: true));
		}
	}

	private static jl etj(Dictionary<MatchSettings.PositionOnCourt, float> a, bool b)
	{
		List<jl.SeatEnergy> list = new List<jl.SeatEnergy>(a.Count);
		foreach (KeyValuePair<MatchSettings.PositionOnCourt, float> item in a)
		{
			list.Add(jl.Seat((byte)item.Key, item.Value));
		}
		return new jl
		{
			lpy = b,
			lpz = list.ToArray()
		};
	}

	[ObserversRpc(ExcludeServer = true, BufferLast = true)]
	private void etk(Dictionary<MatchSettings.PositionOnCourt, float> a)
	{
		eup(a);
	}

	public float etl()
	{
		if (!base.IsServerStarted)
		{
			return 0f;
		}
		return Mathf.Clamp(etn() + 0.02f, 0.06f, 0.15f);
	}

	public float etm()
	{
		return Mathf.Clamp(etl() + etn() + 0.05f, 0.2f, 0.4f);
	}

	private float etn()
	{
		float num = 0f;
		foreach (float value in mba.Values)
		{
			if (value > num)
			{
				num = value;
			}
		}
		return num;
	}

	public void eto()
	{
		if (!base.IsServerStarted && base.IsClientStarted && !(Time.time - mbb < 2f))
		{
			mbb = Time.time;
			etp((uint)base.TimeManager.RoundTripTime);
			if (MatchLog.peq)
			{
				MatchLog.edx(jm.efg(MatchSettings.Current?.Online?.mta, base.TimeManager.RoundTripTime));
			}
		}
	}

	[ServerRpc(RequireOwnership = false)]
	private void etp(uint a, NetworkConnection b = null)
	{
		eus(a, b);
	}

	[Server]
	private void ets()
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
		}
		else
		{
			if (Time.unscaledTime - mbg < 2f)
			{
				return;
			}
			mbg = Time.unscaledTime;
			foreach (NetworkConnection value in man.Values)
			{
				if (!(value == null) && value.IsActive && !(value == base.LocalConnection))
				{
					ett(value, mbf.igm(value.ClientId, Time.unscaledTimeAsDouble));
				}
			}
		}
	}

	[TargetRpc]
	private void ett(NetworkConnection a, uint b)
	{
		euv(a, b);
	}

	[ServerRpc(RequireOwnership = false)]
	private void etu(uint a, NetworkConnection b = null)
	{
		euy(a, b);
	}

	[Server]
	public void etw(Vector3 a, Vector3 b)
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		uint localTick = base.TimeManager.LocalTick;
		etx(localTick, a, b);
		if (MatchLog.peq)
		{
			MatchLog.edx(ka.egh(MatchLog.edv(a), b));
		}
	}

	[ObserversRpc(ExcludeServer = true, BufferLast = true)]
	private void etx(uint a, Vector3 b, Vector3 c)
	{
		evb(a, b, c);
	}

	[Server]
	public void ety(RallyEndInfo a, ScoreCheck b)
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		etz(a, b);
		if (MatchLog.peq)
		{
			MatchLog.edx(jj.efc(a, b));
		}
	}

	[ObserversRpc(ExcludeServer = true, BufferLast = true)]
	private void etz(RallyEndInfo a, ScoreCheck b)
	{
		eve(a, b);
	}

	[Server]
	public void eua(int a, SetSummaryStats b)
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
		}
		else
		{
			eub(a, b);
		}
	}

	[ObserversRpc(ExcludeServer = true, BufferLast = true)]
	private void eub(int a, SetSummaryStats b)
	{
		evh(a, b);
	}

	[Server]
	public void euc()
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
		}
		else
		{
			eud();
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void eud()
	{
		evk();
	}

	public void eue()
	{
		if (!mbk)
		{
			mbk = true;
			euf();
			if (MatchLog.peq)
			{
				MatchLog.edx(jn.efj());
			}
		}
	}

	[ServerRpc(RequireOwnership = false)]
	private void euf(NetworkConnection a = null)
	{
		evn(a);
	}

	[TargetRpc]
	private void eug(NetworkConnection a, string[] b)
	{
		evq(a, b);
	}

	[TargetRpc]
	private void euh(NetworkConnection a, MatchSnapshot b)
	{
		evt(a, b);
	}

	[Server]
	public void eui(string a, bool b)
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
		}
		else
		{
			euj(a, b);
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void euj(string a, bool b)
	{
		evw(a, b);
	}

	public void euk()
	{
		if (base.IsServerStarted)
		{
			eul(MatchSettings.Current.Online.mta);
		}
		else if (base.IsClientStarted)
		{
			eum();
		}
	}

	[Server]
	public void eul(string a)
	{
		if (!GetIsNetworked() || !base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
		}
		else
		{
			eun(a);
		}
	}

	[ServerRpc(RequireOwnership = false)]
	private void eum(NetworkConnection a = null)
	{
		evz(a);
	}

	[ObserversRpc(ExcludeServer = true)]
	private void eun(string a)
	{
		ewc(a);
	}

	[CompilerGenerated]
	private bool euo(KeyValuePair<int, float> a)
	{
		if (mbj.TryGetValue(a.Key, out var value))
		{
			return Time.unscaledTime - value <= 6f;
		}
		return false;
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void NetworkInitialize___Early()
	{
		if (!mbl)
		{
			mbl = true;
			base.NetworkInitialize___Early();
			_initialized.InitializeEarly(this, 0u, isSyncObject: false);
			RegisterObserversRpc(0u, eur);
			RegisterServerRpc(1u, euu);
			RegisterTargetRpc(2u, eux);
			RegisterServerRpc(3u, eva);
			RegisterObserversRpc(4u, evd);
			RegisterObserversRpc(5u, evg);
			RegisterObserversRpc(6u, evj);
			RegisterObserversRpc(7u, evm);
			RegisterServerRpc(8u, evp);
			RegisterTargetRpc(9u, evs);
			RegisterTargetRpc(10u, evv);
			RegisterObserversRpc(11u, evy);
			RegisterServerRpc(12u, ewb);
			RegisterObserversRpc(13u, ewe);
		}
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void NetworkInitialize___Late()
	{
		if (!mbm)
		{
			mbm = true;
			base.NetworkInitialize___Late();
			_initialized.InitializeLate();
		}
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void NetworkInitializeIfDisabled()
	{
		NetworkInitialize___Early();
		NetworkInitialize___Late();
	}

	private void eup(Dictionary<MatchSettings.PositionOnCourt, float> a)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		GeneratedWriters___Internal.GWrite___System_002ECollections_002EGeneric_002EDictionary_00602_003CMatchSettings_002FPositionOnCourt_002CSystem_002ESingle_003EFishNet_002ESerializing_002EGenerated(pooledWriter, a);
		SendObserversRpc(0u, pooledWriter, channel, DataOrderType.Default, bufferLast: true, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void euq(Dictionary<MatchSettings.PositionOnCourt, float> a)
	{
		List<CharacterManager> list = GameManager.Current?.Characters;
		if (list == null)
		{
			return;
		}
		if (MatchLog.peq)
		{
			Dictionary<MatchSettings.PositionOnCourt, float> dictionary = new Dictionary<MatchSettings.PositionOnCourt, float>(list.Count);
			foreach (CharacterManager item in list)
			{
				if (item?.lhk != null)
				{
					dictionary[item.Player.Position] = item.lhk.ozw;
				}
			}
			MatchLog.edx(etj(dictionary, b: false));
		}
		foreach (KeyValuePair<MatchSettings.PositionOnCourt, float> mab in a)
		{
			CharacterManager characterManager = list.Find((CharacterManager a) => a.Player.Position == mab.Key);
			if (!(characterManager?.lhk == null))
			{
				float num = characterManager.lhk.ozw;
				float value = mab.Value;
				Debug.Log($"[RallyEnergy] {mab.Key}: client={num * 100f:0}%, server={value * 100f:0}%, diff={(value - num) * 100f:0}%");
				characterManager.lhk.ozw = value;
			}
		}
	}

	private void eur(PooledReader a, Channel b)
	{
		Dictionary<MatchSettings.PositionOnCourt, float> a2 = GeneratedReaders___Internal.GRead___System_002ECollections_002EGeneric_002EDictionary_00602_003CMatchSettings_002FPositionOnCourt_002CSystem_002ESingle_003EFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsClientInitialized)
		{
			euq(a2);
		}
	}

	private void eus(uint a, NetworkConnection b = null)
	{
		if (!base.IsClientInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because client is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteUInt32(a);
		SendServerRpc(1u, pooledWriter, channel, DataOrderType.Default);
		pooledWriter.Store();
	}

	private void eut(uint a, NetworkConnection b)
	{
		if (!(b == null))
		{
			mba[b.ClientId] = (float)a / 1000f;
			mbj[b.ClientId] = Time.unscaledTime;
			string text = ((mam != null) ? mam.eqz(b) : null);
			if (MatchLog.peq && !string.IsNullOrEmpty(text))
			{
				MatchLog.edx(jm.efg(text, a));
			}
		}
	}

	private void euu(PooledReader a, Channel b, NetworkConnection c)
	{
		uint a2 = a.ReadUInt32();
		if (base.IsServerInitialized)
		{
			eut(a2, c);
		}
	}

	private void euv(NetworkConnection a, uint b)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteUInt32(b);
		SendTargetRpc(2u, pooledWriter, channel, DataOrderType.Default, a, excludeServer: false);
		pooledWriter.Store();
	}

	private void euw(NetworkConnection a, uint b)
	{
		etu(b);
	}

	private void eux(PooledReader a, Channel b)
	{
		uint b2 = a.ReadUInt32();
		if (base.IsClientInitialized)
		{
			euw(base.LocalConnection, b2);
		}
	}

	private void euy(uint a, NetworkConnection b = null)
	{
		if (!base.IsClientInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because client is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteUInt32(a);
		SendServerRpc(3u, pooledWriter, channel, DataOrderType.Default);
		pooledWriter.Store();
	}

	private void euz(uint a, NetworkConnection b)
	{
		if (!(b == null) && !(mam == null) && mbf.ign(b.ClientId, a, Time.unscaledTimeAsDouble, out var d))
		{
			string text = mam.eqz(b);
			if (!string.IsNullOrEmpty(text))
			{
				this.mbh?.Invoke(text, d);
			}
		}
	}

	private void eva(PooledReader a, Channel b, NetworkConnection c)
	{
		uint a2 = a.ReadUInt32();
		if (base.IsServerInitialized)
		{
			euz(a2, c);
		}
	}

	private void evb(uint a, Vector3 b, Vector3 c)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteUInt32(a);
		pooledWriter.WriteVector3(b);
		pooledWriter.WriteVector3(c);
		SendObserversRpc(4u, pooledWriter, channel, DataOrderType.Default, bufferLast: true, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void evc(uint a, Vector3 b, Vector3 c)
	{
		ShuttleManager shuttleManager = GameManager.Current?.Shuttle;
		if (!(shuttleManager == null))
		{
			if (MatchLog.peq)
			{
				MatchLog.edx(ka.egh(MatchLog.edv(b), c));
			}
			float a2 = Time.time - (float)base.TimeManager.TimePassed(a);
			shuttleManager.eyn(a2, b, c, d: false);
		}
	}

	private void evd(PooledReader a, Channel b)
	{
		uint a2 = a.ReadUInt32();
		Vector3 b2 = a.ReadVector3();
		Vector3 c = a.ReadVector3();
		if (base.IsClientInitialized)
		{
			evc(a2, b2, c);
		}
	}

	private void eve(RallyEndInfo a, ScoreCheck b)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		GeneratedWriters___Internal.GWrite___RallyEndInfoFishNet_002ESerializing_002EGenerated(pooledWriter, a);
		GeneratedWriters___Internal.GWrite___ScoreCheckFishNet_002ESerializing_002EGenerated(pooledWriter, b);
		SendObserversRpc(5u, pooledWriter, channel, DataOrderType.Default, bufferLast: true, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void evf(RallyEndInfo a, ScoreCheck b)
	{
		if (MatchLog.peq)
		{
			MatchLog.edx(jj.efc(a, b));
		}
		if (GameManager.Current.StatsManager.luc == null || !rj.ggi(qu.mug, b))
		{
			eue();
			return;
		}
		GameManager.Current.StatsManager.eie(a);
		GameManager.Current.eao();
		if (!rj.ggj(qu.mug, b))
		{
			eue();
		}
	}

	private void evg(PooledReader a, Channel b)
	{
		RallyEndInfo a2 = GeneratedReaders___Internal.GRead___RallyEndInfoFishNet_002ESerializing_002EGenerateds(a);
		ScoreCheck b2 = GeneratedReaders___Internal.GRead___ScoreCheckFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsClientInitialized)
		{
			evf(a2, b2);
		}
	}

	private void evh(int a, SetSummaryStats b)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteInt32(a);
		GeneratedWriters___Internal.GWrite___SetSummaryStatsFishNet_002ESerializing_002EGenerated(pooledWriter, b);
		SendObserversRpc(6u, pooledWriter, channel, DataOrderType.Default, bufferLast: true, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void evi(int a, SetSummaryStats b)
	{
		List<re> mui = qu.mug.mui;
		if (a >= 0 && a < mui.Count)
		{
			mui[a].mut = b;
			mui[a].muu = b.Duration;
			GameManager.Current.ebe();
		}
	}

	private void evj(PooledReader a, Channel b)
	{
		int a2 = a.ReadInt32();
		SetSummaryStats b2 = GeneratedReaders___Internal.GRead___SetSummaryStatsFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsClientInitialized)
		{
			evi(a2, b2);
		}
	}

	private void evk()
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		SendObserversRpc(7u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void evl()
	{
		GameManager.Current.eat();
	}

	private void evm(PooledReader a, Channel b)
	{
		if (base.IsClientInitialized)
		{
			evl();
		}
	}

	private void evn(NetworkConnection a = null)
	{
		if (!base.IsClientInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because client is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		SendServerRpc(8u, pooledWriter, channel, DataOrderType.Default);
		pooledWriter.Store();
	}

	private void evo(NetworkConnection a)
	{
		if (!(a == null) && qu.mug != null)
		{
			euh(a, rj.ggk(qu.mug, GameManager.Current.lmy, GameManager.Current.lmx, GameManager.Current.lna, GameManager.Current.lnb));
			List<string> list = MatchAbsenceWatcher.lxr?.eqi() ?? new List<string>();
			eug(a, list.ToArray());
		}
	}

	private void evp(PooledReader a, Channel b, NetworkConnection c)
	{
		if (base.IsServerInitialized)
		{
			evo(c);
		}
	}

	private void evq(NetworkConnection a, string[] b)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		GeneratedWriters___Internal.GWrite___System_002EString_005B_005DFishNet_002ESerializing_002EGenerated(pooledWriter, b);
		SendTargetRpc(9u, pooledWriter, channel, DataOrderType.Default, a, excludeServer: false);
		pooledWriter.Store();
	}

	private void evr(NetworkConnection a, string[] b)
	{
		MatchAbsenceWatcher.lxr?.eqj(b);
	}

	private void evs(PooledReader a, Channel b)
	{
		string[] b2 = GeneratedReaders___Internal.GRead___System_002EString_005B_005DFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsClientInitialized)
		{
			evr(base.LocalConnection, b2);
		}
	}

	private void evt(NetworkConnection a, MatchSnapshot b)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		GeneratedWriters___Internal.GWrite___MatchSnapshotFishNet_002ESerializing_002EGenerated(pooledWriter, b);
		SendTargetRpc(10u, pooledWriter, channel, DataOrderType.Default, a, excludeServer: false);
		pooledWriter.Store();
	}

	private void evu(NetworkConnection a, MatchSnapshot b)
	{
		mbk = false;
		if (qu.mug != null && !(GameManager.Current == null))
		{
			rj.ggl(qu.mug, b);
			GameManager.Current.ebf(b);
			if (MatchLog.peq)
			{
				MatchLog.edx(jn.efk(rj.ggh(qu.mug)));
			}
			Debug.Log($"[OnlineMatchManager] Resynced match state from host ({qu.mug.mui.Count} set(s)).");
			OnlineMatchEndService.imm(qu.mug);
		}
	}

	private void evv(PooledReader a, Channel b)
	{
		MatchSnapshot b2 = GeneratedReaders___Internal.GRead___MatchSnapshotFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsClientInitialized)
		{
			evu(base.LocalConnection, b2);
		}
	}

	private void evw(string a, bool b)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteString(a);
		pooledWriter.WriteBoolean(b);
		SendObserversRpc(11u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void evx(string a, bool b)
	{
		MatchAbsenceWatcher.lxr?.eqg(a, b);
	}

	private void evy(PooledReader a, Channel b)
	{
		string a2 = a.ReadStringAllocated();
		bool b2 = a.ReadBoolean();
		if (base.IsClientInitialized)
		{
			evx(a2, b2);
		}
	}

	private void evz(NetworkConnection a = null)
	{
		if (!base.IsClientInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because client is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		SendServerRpc(12u, pooledWriter, channel, DataOrderType.Default);
		pooledWriter.Store();
	}

	private void ewa(NetworkConnection a)
	{
		if (!(a == null) && !(mam == null))
		{
			string text = mam.eqz(a);
			if (!string.IsNullOrEmpty(text))
			{
				eul(text);
				OnlineMatchForfeit.esb(text);
			}
		}
	}

	private void ewb(PooledReader a, Channel b, NetworkConnection c)
	{
		if (base.IsServerInitialized)
		{
			ewa(c);
		}
	}

	private void ewc(string a)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteString(a);
		SendObserversRpc(13u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void ewd(string a)
	{
		OnlineMatchForfeit.esb(a);
	}

	private void ewe(PooledReader a, Channel b)
	{
		string a2 = a.ReadStringAllocated();
		if (base.IsClientInitialized)
		{
			ewd(a2);
		}
	}

	public void ewf()
	{
		GameManager.Current.OnlineManager = this;
		NetworkManager networkManager = InstanceFinder.NetworkManager;
		if (networkManager != null)
		{
			networkManager.ClientManager.OnClientConnectionState += eta;
		}
	}
}
