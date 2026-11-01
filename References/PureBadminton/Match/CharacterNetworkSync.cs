using System.Runtime.CompilerServices;
using FishNet.Connection;
using FishNet.Managing;
using FishNet.Object;
using FishNet.Object.Synchronizing;
using FishNet.Serializing;
using FishNet.Serializing.Generated;
using FishNet.Transporting;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[RequireComponent(typeof(NetworkObject))]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterNetworkSync : NetworkBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public readonly SyncVar<MatchSettings.PositionOnCourt> _characterPosition = new SyncVar<MatchSettings.PositionOnCourt>();

	private CharacterManager lwa;

	private const float lwb = 0.05f;

	private const float lwc = 1.6f;

	private const float lwd = 2f;

	private float lwe;

	private int? lwf;

	private float lwg;

	private Vector2 lwh;

	private uint lwi;

	private Vector3? lwj;

	private uint lwk;

	private const float lwl = 0.5f;

	private const float lwm = 0.1f;

	private const float lwn = 0.25f;

	private bool lwo;

	private bool lwp;

	public MatchSettings.PositionOnCourt pfo
	{
		get
		{
			return _characterPosition.Value;
		}
		set
		{
			_characterPosition.Value = value;
		}
	}

	private byte pfp => MatchLog.eec(lwa);

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnStartClient()
	{
		base.OnStartClient();
		lwa = GameManager.Current.Characters.Find((CharacterManager a) => a.Player.Position == pfo);
		lwa.lhj = this;
		lwa.IsLocallyControlled = base.IsOwner;
		lwa.lhe.lgi = !base.IsOwner;
		if (base.IsServerStarted && !base.IsOwner)
		{
			lwa.lhe.lgi = true;
		}
		lwa.dnd();
		GameManager.Current.EnergyPanel.Initialize(GameManager.Current.Characters);
		if (base.IsOwner)
		{
			GameManager.Current.Cameras.dex();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (lwa == null)
		{
			return;
		}
		bool flag = lwa.lhg.lih.HasValue || lwa.lhi.lju != null;
		if (lwa.lhe.lgi)
		{
			if (flag || lwa.Game.lmu)
			{
				lwj = lwa.lhd.position;
				if (!flag && lwa.lhf.oys)
				{
					lwa.lhf.dfv();
				}
			}
			else
			{
				elz();
			}
		}
		else if (base.IsOwner && !base.IsServerStarted)
		{
			bool flag2 = lwa.lhi.lju != null && lwa.lhi.lju.ljk.HasValue;
			if (flag)
			{
				if (!flag2)
				{
					uint localTick = base.TimeManager.LocalTick;
					int num = (int)(lwa.lhi.nextShotType.HasValue ? lwa.lhi.nextShotType.Value : ((ShotType)(-1)));
					emb(lwa.lhe.lgg, lwa.lhe.lgh, num, lwa.lhi.nextShotPower, localTick);
					if (MatchLog.peq)
					{
						MatchLog.edy(js.efr(a: false, pfp, 1, localTick, lwa.lhe.lgg, lwa.lhe.lgh, num, lwa.lhi.nextShotPower, Vector2.zero));
					}
				}
			}
			else
			{
				ClientMovementState a = ely();
				ema(a);
				if (MatchLog.peq)
				{
					MatchLog.edy(js.efr(a: false, pfp, 0, a.Tick, a.MoveStick, Vector2.zero, a.ShotType, a.ShotPower, a.ShotDirection));
					if (kf.egw(a.Tick))
					{
						MatchLog.edx(jt.efu(a: false, pfp, a.Tick, MatchLog.edv(a.Position), a.Angle));
					}
				}
			}
		}
		else if (base.IsServerStarted && base.IsOwner)
		{
			if (MatchLog.peq && !lwa.IsBot)
			{
				MatchLog.edy(js.efr(a: false, pfp, 2, base.TimeManager.LocalTick, lwa.lhe.lgg, lwa.lhe.lgh, (int)(lwa.lhi.nextShotType.HasValue ? lwa.lhi.nextShotType.Value : ((ShotType)(-1))), lwa.lhi.nextShotPower, lwa.lhi.nextShotDirection ?? Vector2.zero));
			}
			if (!flag && (lwa.Game.peb || !lwa.lhf.oyt))
			{
				emc(lwa.lhf.oyu, lwa.lhf.oyw, lwa.lhh.liq.GetValueOrDefault(), lwa.transform.position);
			}
		}
		if (!base.IsServerStarted)
		{
			return;
		}
		emr();
		if (lwa.lhi.lju != null && !lwa.lhi.lju.ljk.HasValue && lwa.Game.OnlineManager != null && lwa.lhi.lju.lje - Time.time <= lwa.Game.OnlineManager.etm() && Time.time - lwe >= 0.05f)
		{
			int num2 = (int)(lwa.lhi.nextShotType.HasValue ? lwa.lhi.nextShotType.Value : ((ShotType)(-1)));
			float nextShotPower = lwa.lhi.nextShotPower;
			Vector2 vector = lwa.lhi.nextShotDirection ?? lwa.lhe.diu();
			if (num2 != (lwf ?? int.MinValue) || !Mathf.Approximately(nextShotPower, lwg) || (vector - lwh).sqrMagnitude > 1E-06f)
			{
				emj(num2, nextShotPower, vector);
				if (MatchLog.peq)
				{
					MatchLog.edx(jx.egb(pfp, num2, nextShotPower, vector));
				}
				lwf = num2;
				lwg = nextShotPower;
				lwh = vector;
				lwe = Time.time;
			}
		}
		else if (lwa.lhi.lju == null && lwf.HasValue)
		{
			lwf = null;
			lwg = 0f;
			lwh = Vector2.zero;
		}
	}

	private ClientMovementState ely()
	{
		ClientMovementState result = default(ClientMovementState);
		result.Tick = base.TimeManager.LocalTick;
		result.Position = lwa.transform.position;
		result.Angle = lwa.lhh.liq.GetValueOrDefault();
		result.AnimationName = lwa.lhf.oyu;
		result.NormalizedTime = lwa.lhf.oyw;
		result.InPose = lwa.lhf.oyt;
		result.MoveStick = lwa.lhe.lgg;
		result.ShotType = (int)(lwa.lhi.nextShotType.HasValue ? lwa.lhi.nextShotType.Value : ((ShotType)(-1)));
		result.ShotPower = lwa.lhi.nextShotPower;
		result.ShotDirection = lwa.lhi.nextShotDirection ?? Vector2.zero;
		return result;
	}

	private void elz()
	{
		if (!lwj.HasValue)
		{
			return;
		}
		Vector3 position = lwa.lhd.position;
		Vector3 value = lwj.Value;
		value.y = position.y;
		Vector3 vector = value - position;
		float magnitude = vector.magnitude;
		if (!(magnitude < 0.0001f))
		{
			if (magnitude > 2f)
			{
				lwa.lhd.MovePosition(value);
				return;
			}
			float num = lwa.lhg.pbg * 1.6f * Time.fixedDeltaTime;
			Vector3 position2 = ((magnitude <= num) ? value : (position + vector.normalized * num));
			lwa.lhd.MovePosition(position2);
		}
	}

	[ServerRpc]
	private void ema(ClientMovementState a, Channel b = Channel.Unreliable)
	{
		emv(a, b);
	}

	[ServerRpc]
	private void emb(Vector2 a, Vector2 b, int c, float d, uint e, Channel f = Channel.Unreliable)
	{
		emy(a, b, c, d, e, f);
	}

	[ObserversRpc(ExcludeServer = true, ExcludeOwner = true)]
	private void emc(string a, float b, float c, Vector3 d, Channel e = Channel.Unreliable)
	{
		enb(a, b, c, d, e);
	}

	public void emd(Vector3 a, float? b = null)
	{
		if (base.IsServerStarted)
		{
			if (b.HasValue)
			{
				eme(a, b: true, base.TimeManager.LocalTick, b.Value - Time.time);
			}
			else
			{
				eme(a, b: false, 0u, 0f);
			}
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void eme(Vector3 a, bool b, uint c, float d)
	{
		ene(a, b, c, d);
	}

	public void emf()
	{
		if (base.IsServerStarted)
		{
			emg();
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void emg()
	{
		enh();
	}

	public void emh(lr a)
	{
		if (base.IsServerStarted)
		{
			uint localTick = base.TimeManager.LocalTick;
			float num = a.lje - Time.time;
			emi(localTick, num, a.ljf, a.mbq, a.liz.oqg, a.mbs);
			if (MatchLog.peq)
			{
				MatchLog.edx(jw.efz(pfp, MatchLog.eeb(num), MatchLog.edv(a.ljf), a.liz.oqg, a.mbs, f: false));
			}
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void emi(uint a, float b, Vector3 c, Vector3 d, string e, bool f)
	{
		enk(a, b, c, d, e, f);
	}

	[ObserversRpc(ExcludeServer = true)]
	private void emj(int a, float b, Vector2 c)
	{
		enn(a, b, c);
	}

	public void emk(CharacterIntensityLevel a)
	{
		if (MatchLog.peq)
		{
			MatchLog.edx(new jk
			{
				lpw = pfp,
				lpx = (byte)a
			});
		}
		if (base.IsServerStarted)
		{
			emm(a);
		}
		else if (base.IsOwner)
		{
			eml(a);
		}
	}

	[ServerRpc]
	private void eml(CharacterIntensityLevel a)
	{
		enq(a);
	}

	[ObserversRpc(ExcludeServer = true, BufferLast = true)]
	private void emm(CharacterIntensityLevel a)
	{
		ent(a);
	}

	public void emn()
	{
		if (base.IsServerStarted)
		{
			uint localTick = base.TimeManager.LocalTick;
			float num = lwa.lhi.lju.lje - Time.time;
			emo(localTick, num);
			if (MatchLog.peq)
			{
				CharacterShotManager.ib ib = lwa.lhi.lju;
				MatchLog.edx(jw.efz(pfp, MatchLog.eeb(num), MatchLog.edv(ib.ljf), ib.liz?.oqg, e: false, f: true));
			}
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void emo(uint a, float b)
	{
		enw(a, b);
	}

	public void emp(CancelShotReason a)
	{
		if (base.IsServerStarted)
		{
			emq((byte)a);
			if (MatchLog.peq)
			{
				MatchLog.edx(new jz
				{
					lsx = pfp,
					lsy = a
				});
			}
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void emq(byte a)
	{
		enz(a);
	}

	private void emr()
	{
		CharacterShotManager.ib ib = lwa.lhi.lju;
		if (ib != null && !ib.ljk.HasValue)
		{
			OnlineMatchManager onlineManager = lwa.Game.OnlineManager;
			if (!(onlineManager == null) && !(ib.lje - Time.time > onlineManager.etl()))
			{
				lwa.lhi.dtn();
			}
		}
	}

	public void ems(float a, Vector3 b, Vector3 c, ShotType d)
	{
		if (base.IsServerStarted)
		{
			uint localTick = base.TimeManager.LocalTick;
			float num = a - Time.time;
			emt(localTick, num, b, c, (int)d);
			if (MatchLog.peq)
			{
				MatchLog.edx(jy.ege(pfp, MatchLog.eeb(num), MatchLog.edv(b), c, d, lwa.lhi.lkb));
			}
		}
	}

	[ObserversRpc(ExcludeServer = true)]
	private void emt(uint a, float b, Vector3 c, Vector3 d, int e)
	{
		eoc(a, b, c, d, e);
	}

	[CompilerGenerated]
	private bool emu(CharacterManager a)
	{
		return a.Player.Position == pfo;
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void NetworkInitialize___Early()
	{
		if (!lwo)
		{
			lwo = true;
			base.NetworkInitialize___Early();
			_characterPosition.InitializeEarly(this, 0u, isSyncObject: false);
			RegisterServerRpc(0u, emx);
			RegisterServerRpc(1u, ena);
			RegisterObserversRpc(2u, end);
			RegisterObserversRpc(3u, eng);
			RegisterObserversRpc(4u, enj);
			RegisterObserversRpc(5u, enm);
			RegisterObserversRpc(6u, enp);
			RegisterServerRpc(7u, ens);
			RegisterObserversRpc(8u, env);
			RegisterObserversRpc(9u, eny);
			RegisterObserversRpc(10u, eob);
			RegisterObserversRpc(11u, eoe);
		}
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void NetworkInitialize___Late()
	{
		if (!lwp)
		{
			lwp = true;
			base.NetworkInitialize___Late();
			_characterPosition.InitializeLate();
		}
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void NetworkInitializeIfDisabled()
	{
		NetworkInitialize___Early();
		NetworkInitialize___Late();
	}

	private void emv(ClientMovementState a, Channel b = Channel.Unreliable)
	{
		if (!base.IsClientInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because client is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		if (!base.IsOwner)
		{
			NetworkManager networkManager2 = base.NetworkManager;
			networkManager2.LogWarning("Cannot complete action because you are not the owner of this object. .");
			return;
		}
		Channel channel = b;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		GeneratedWriters___Internal.GWrite___ClientMovementStateFishNet_002ESerializing_002EGenerated(pooledWriter, a);
		SendServerRpc(0u, pooledWriter, channel, DataOrderType.Default);
		pooledWriter.Store();
	}

	private void emw(ClientMovementState a, Channel b)
	{
		if (lwa == null)
		{
			return;
		}
		if (MatchLog.peq)
		{
			MatchLog.edy(js.efr(a: true, pfp, 0, a.Tick, a.MoveStick, Vector2.zero, a.ShotType, a.ShotPower, a.ShotDirection));
			if (kf.egw(a.Tick))
			{
				MatchLog.edx(jt.efu(a: true, pfp, a.Tick, MatchLog.edv(a.Position), a.Angle));
			}
		}
		if (lwj.HasValue && a.Tick <= lwi)
		{
			return;
		}
		if (lwa.lhg.lih.HasValue || lwa.lhi.lju != null || lwa.Game.lmu)
		{
			lwj = lwa.lhd.position;
			lwi = a.Tick;
			CharacterShotManager.ib ib = lwa.lhi.lju;
			if (ib != null && !ib.ljk.HasValue && a.ShotType >= 0 && a.Tick > lwk)
			{
				lwa.lhe.lgj = a.MoveStick;
				lwa.lhi.nextShotType = (ShotType)a.ShotType;
				lwa.lhi.dsv(a.ShotPower);
			}
			return;
		}
		lwa.lhe.lgj = a.MoveStick;
		lwa.lhi.nextShotType = ((a.ShotType >= 0) ? new ShotType?((ShotType)a.ShotType) : null);
		lwa.lhi.dsv(a.ShotPower);
		lwa.lhi.nextShotDirection = ((a.ShotDirection == Vector2.zero) ? null : new Vector2?(a.ShotDirection));
		CharacterAnimationDriver.AnimationKind b2 = (string.IsNullOrEmpty(a.AnimationName) ? CharacterAnimationDriver.AnimationKind.Idle : CharacterAnimationDriver.AnimationKind.Move);
		lwa.lhf.dgh(a.AnimationName, b2, a.NormalizedTime, null, CharacterAnimationDriver.AnimationKind.Idle, 0f, 0f, 0f);
		lwa.lhh.dpm(a.Angle, Time.fixedDeltaTime * 2f);
		if (lwj.HasValue)
		{
			float b3 = (float)base.TimeManager.TickDelta * (float)(a.Tick - lwi) + Time.fixedDeltaTime;
			float num = jd.edk(lwa.lhg.pbg, b3);
			Vector3 vector = a.Position - lwj.Value;
			vector.y = 0f;
			if (vector.magnitude > num)
			{
				Vector3 vector2 = lwj.Value + vector.normalized * num;
				if (MatchLog.peq)
				{
					MatchLog.edx(ju.efw(pfp, MatchLog.edv(a.Position), MatchLog.edv(vector2)));
				}
				lwj = vector2;
			}
			else
			{
				lwj = a.Position;
			}
		}
		else
		{
			lwj = a.Position;
		}
		lwi = a.Tick;
		if (lwa.Game.peb || !a.InPose)
		{
			emc(a.AnimationName, a.NormalizedTime, a.Angle, lwj.Value);
		}
	}

	private void emx(PooledReader a, Channel b, NetworkConnection c)
	{
		ClientMovementState a2 = GeneratedReaders___Internal.GRead___ClientMovementStateFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsServerInitialized && OwnerMatches(c))
		{
			emw(a2, b);
		}
	}

	private void emy(Vector2 a, Vector2 b, int c, float d, uint e, Channel f = Channel.Unreliable)
	{
		if (!base.IsClientInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because client is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		if (!base.IsOwner)
		{
			NetworkManager networkManager2 = base.NetworkManager;
			networkManager2.LogWarning("Cannot complete action because you are not the owner of this object. .");
			return;
		}
		Channel channel = f;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteVector2(a);
		pooledWriter.WriteVector2(b);
		pooledWriter.WriteInt32(c);
		pooledWriter.WriteSingle(d);
		pooledWriter.WriteUInt32(e);
		SendServerRpc(1u, pooledWriter, channel, DataOrderType.Default);
		pooledWriter.Store();
	}

	private void emz(Vector2 a, Vector2 b, int c, float d, uint e, Channel f)
	{
		if (!(lwa == null))
		{
			if (MatchLog.peq)
			{
				MatchLog.edy(js.efr(a: true, pfp, 1, e, a, b, c, d, Vector2.zero));
			}
			if (e > lwk)
			{
				lwk = e;
			}
			lwa.lhe.lgj = a;
			lwa.lhe.lgk = b;
			if (lwa.lhi.lju == null || c >= 0)
			{
				lwa.lhi.nextShotType = ((c >= 0) ? new ShotType?((ShotType)c) : null);
				lwa.lhi.dsv(d);
			}
		}
	}

	private void ena(PooledReader a, Channel b, NetworkConnection c)
	{
		Vector2 a2 = a.ReadVector2();
		Vector2 b2 = a.ReadVector2();
		int c2 = a.ReadInt32();
		float d = a.ReadSingle();
		uint e = a.ReadUInt32();
		if (base.IsServerInitialized && OwnerMatches(c))
		{
			emz(a2, b2, c2, d, e, b);
		}
	}

	private void enb(string a, float b, float c, Vector3 d, Channel e = Channel.Unreliable)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = e;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteString(a);
		pooledWriter.WriteSingle(b);
		pooledWriter.WriteSingle(c);
		pooledWriter.WriteVector3(d);
		SendObserversRpc(2u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: true);
		pooledWriter.Store();
	}

	private void enc(string a, float b, float c, Vector3 d, Channel e)
	{
		if (!(lwa == null) && lwa.lhe.lgi && !lwa.lhg.lih.HasValue && lwa.lhi.lju == null && !lwa.Game.lmu)
		{
			CharacterAnimationDriver.AnimationKind b2 = (string.IsNullOrEmpty(a) ? CharacterAnimationDriver.AnimationKind.Idle : CharacterAnimationDriver.AnimationKind.Move);
			lwa.lhf.dgh(a, b2, b, null, CharacterAnimationDriver.AnimationKind.Idle, 0f, 0f, 0f);
			lwa.lhh.dpm(c, Time.fixedDeltaTime * 2f);
			lwj = d;
		}
	}

	private void end(PooledReader a, Channel b)
	{
		string a2 = a.ReadStringAllocated();
		float b2 = a.ReadSingle();
		float c = a.ReadSingle();
		Vector3 d = a.ReadVector3();
		if (base.IsClientInitialized)
		{
			enc(a2, b2, c, d, b);
		}
	}

	private void ene(Vector3 a, bool b, uint c, float d)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteVector3(a);
		pooledWriter.WriteBoolean(b);
		pooledWriter.WriteUInt32(c);
		pooledWriter.WriteSingle(d);
		SendObserversRpc(3u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void enf(Vector3 a, bool b, uint c, float d)
	{
		if (!(lwa == null) && lwa.lhe.lgi)
		{
			if (b)
			{
				float num = (float)base.TimeManager.TimePassed(c);
				lwa.lhg.dov(a, Time.time + (d - num));
			}
			else
			{
				lwa.lhg.dov(a);
			}
		}
	}

	private void eng(PooledReader a, Channel b)
	{
		Vector3 a2 = a.ReadVector3();
		bool b2 = a.ReadBoolean();
		uint c = a.ReadUInt32();
		float d = a.ReadSingle();
		if (base.IsClientInitialized)
		{
			enf(a2, b2, c, d);
		}
	}

	private void enh()
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		SendObserversRpc(4u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void eni()
	{
		if (!(lwa == null) && lwa.lhe.lgi)
		{
			lwa.lhg.dow();
		}
	}

	private void enj(PooledReader a, Channel b)
	{
		if (base.IsClientInitialized)
		{
			eni();
		}
	}

	private void enk(uint a, float b, Vector3 c, Vector3 d, string e, bool f)
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
		pooledWriter.WriteSingle(b);
		pooledWriter.WriteVector3(c);
		pooledWriter.WriteVector3(d);
		pooledWriter.WriteString(e);
		pooledWriter.WriteBoolean(f);
		SendObserversRpc(5u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void enl(uint a, float b, Vector3 c, Vector3 d, string e, bool f)
	{
		if (lwa == null)
		{
			return;
		}
		bga.bfw bfw = lwa.lhm.dqk(e);
		if (bfw == null)
		{
			Debug.LogWarning("[CharacterNetworkSync] BroadcastPotentialShotRpc: unknown animation '" + e + "'");
			return;
		}
		float num = (float)base.TimeManager.TimePassed(a);
		float num2 = b - num;
		if (!(num2 < 0f))
		{
			if (MatchLog.peq)
			{
				MatchLog.edx(jw.efz(pfp, MatchLog.eeb(num2), MatchLog.edv(c), e, f, f: false));
			}
			lr a2 = new lr
			{
				liz = bfw,
				lje = Time.time + num2,
				ljf = c,
				mbq = d,
				mbs = f
			};
			lwa.dnf(a2);
		}
	}

	private void enm(PooledReader a, Channel b)
	{
		uint a2 = a.ReadUInt32();
		float b2 = a.ReadSingle();
		Vector3 c = a.ReadVector3();
		Vector3 d = a.ReadVector3();
		string e = a.ReadStringAllocated();
		bool f = a.ReadBoolean();
		if (base.IsClientInitialized)
		{
			enl(a2, b2, c, d, e, f);
		}
	}

	private void enn(int a, float b, Vector2 c)
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
		pooledWriter.WriteSingle(b);
		pooledWriter.WriteVector2(c);
		SendObserversRpc(6u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void eno(int a, float b, Vector2 c)
	{
		if (!(lwa == null) && lwa.lhe.lgi)
		{
			if (MatchLog.peq)
			{
				MatchLog.edx(jx.egb(pfp, a, b, c));
			}
			lwa.lhi.nextShotType = ((a >= 0) ? new ShotType?((ShotType)a) : null);
			lwa.lhi.nextShotPower = b;
			lwa.lhi.nextShotDirection = ((c == Vector2.zero) ? null : new Vector2?(c));
		}
	}

	private void enp(PooledReader a, Channel b)
	{
		int a2 = a.ReadInt32();
		float b2 = a.ReadSingle();
		Vector2 c = a.ReadVector2();
		if (base.IsClientInitialized)
		{
			eno(a2, b2, c);
		}
	}

	private void enq(CharacterIntensityLevel a)
	{
		if (!base.IsClientInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because client is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		if (!base.IsOwner)
		{
			NetworkManager networkManager2 = base.NetworkManager;
			networkManager2.LogWarning("Cannot complete action because you are not the owner of this object. .");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		GeneratedWriters___Internal.GWrite___CharacterIntensityLevelFishNet_002ESerializing_002EGenerated(pooledWriter, a);
		SendServerRpc(7u, pooledWriter, channel, DataOrderType.Default);
		pooledWriter.Store();
	}

	private void enr(CharacterIntensityLevel a)
	{
		if (!(lwa == null))
		{
			if (MatchLog.peq)
			{
				MatchLog.edx(new jk
				{
					lpw = pfp,
					lpx = (byte)a
				});
			}
			lwa.lhl.dkf(a);
			emm(a);
		}
	}

	private void ens(PooledReader a, Channel b, NetworkConnection c)
	{
		CharacterIntensityLevel a2 = GeneratedReaders___Internal.GRead___CharacterIntensityLevelFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsServerInitialized && OwnerMatches(c))
		{
			enr(a2);
		}
	}

	private void ent(CharacterIntensityLevel a)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		GeneratedWriters___Internal.GWrite___CharacterIntensityLevelFishNet_002ESerializing_002EGenerated(pooledWriter, a);
		SendObserversRpc(8u, pooledWriter, channel, DataOrderType.Default, bufferLast: true, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void enu(CharacterIntensityLevel a)
	{
		if (!(lwa == null) && lwa.lhe.lgi)
		{
			if (MatchLog.peq)
			{
				MatchLog.edx(new jk
				{
					lpw = pfp,
					lpx = (byte)a
				});
			}
			lwa.lhl.dkf(a);
		}
	}

	private void env(PooledReader a, Channel b)
	{
		CharacterIntensityLevel a2 = GeneratedReaders___Internal.GRead___CharacterIntensityLevelFishNet_002ESerializing_002EGenerateds(a);
		if (base.IsClientInitialized)
		{
			enu(a2);
		}
	}

	private void enw(uint a, float b)
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
		pooledWriter.WriteSingle(b);
		SendObserversRpc(9u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void enx(uint a, float b)
	{
		if (lwa == null)
		{
			return;
		}
		float num = (float)base.TimeManager.TimePassed(a);
		float num2 = b - num;
		if (!(num2 < 0f))
		{
			lwa.lhi.dtj(Time.time + num2);
			CharacterShotManager.ib ib = lwa.lhi.lju;
			if (MatchLog.peq && ib != null)
			{
				MatchLog.edx(jw.efz(pfp, MatchLog.eeb(num2), MatchLog.edv(ib.ljf), ib.liz?.oqg, e: false, f: true));
			}
		}
	}

	private void eny(PooledReader a, Channel b)
	{
		uint a2 = a.ReadUInt32();
		float b2 = a.ReadSingle();
		if (base.IsClientInitialized)
		{
			enx(a2, b2);
		}
	}

	private void enz(byte a)
	{
		if (!base.IsServerInitialized)
		{
			NetworkManager networkManager = base.NetworkManager;
			networkManager.LogWarning("Cannot complete action because server is not active. This may also occur if the object is not yet initialized, has deinitialized, or if it does not contain a NetworkObject component.");
			return;
		}
		Channel channel = Channel.Reliable;
		PooledWriter pooledWriter = WriterPool.Retrieve();
		pooledWriter.WriteUInt8Unpacked(a);
		SendObserversRpc(10u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void eoa(byte a)
	{
		if (!(lwa == null))
		{
			if (MatchLog.peq)
			{
				MatchLog.edx(new jz
				{
					lsx = pfp,
					lsy = (CancelShotReason)a
				});
			}
			lwa.lhi.dtg(a: true);
		}
	}

	private void eob(PooledReader a, Channel b)
	{
		byte a2 = a.ReadUInt8Unpacked();
		if (base.IsClientInitialized)
		{
			eoa(a2);
		}
	}

	private void eoc(uint a, float b, Vector3 c, Vector3 d, int e)
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
		pooledWriter.WriteSingle(b);
		pooledWriter.WriteVector3(c);
		pooledWriter.WriteVector3(d);
		pooledWriter.WriteInt32(e);
		SendObserversRpc(11u, pooledWriter, channel, DataOrderType.Default, bufferLast: false, excludeServer: true, excludeOwner: false);
		pooledWriter.Store();
	}

	private void eod(uint a, float b, Vector3 c, Vector3 d, int e)
	{
		if (lwa == null)
		{
			return;
		}
		float num = (float)base.TimeManager.TimePassed(a);
		float num2 = Time.time + (b - num);
		if (MatchLog.peq)
		{
			MatchLog.edx(jy.egd(pfp, MatchLog.eeb(num2 - Time.time), MatchLog.edv(c), d, (ShotType)e));
		}
		CharacterShotManager.ib ib = lwa.lhi.lju;
		if (ib != null && !ib.pbl && Mathf.Abs(ib.lje - num2) <= 0.25f)
		{
			ib.ljk = new CharacterShotManager.AuthoritativeShot(num2, c, d, (ShotType)e);
			lwa.lhi.nextShotType = (ShotType)e;
		}
		else
		{
			if (Time.time - num2 > 0.5f)
			{
				return;
			}
			ShuttleManager shuttleManager = GameManager.Current?.Shuttle;
			if (!(shuttleManager == null))
			{
				me me2 = shuttleManager.pgu;
				if (me2 == null || !(me2.mdy - num2 > 0.1f))
				{
					shuttleManager.eyn(num2, c, d, lwa.pbc);
				}
			}
		}
	}

	private void eoe(PooledReader a, Channel b)
	{
		uint a2 = a.ReadUInt32();
		float b2 = a.ReadSingle();
		Vector3 c = a.ReadVector3();
		Vector3 d = a.ReadVector3();
		int e = a.ReadInt32();
		if (base.IsClientInitialized)
		{
			eod(a2, b2, c, d, e);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public virtual void Awake()
	{
		NetworkInitialize___Early();
		NetworkInitialize___Late();
	}
}
