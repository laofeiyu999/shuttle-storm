using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterEnergy : CharacterComponent
{
	private float lgo;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Gauge EnergyBar;

	private float lgp = 1f;

	private float? lgq;

	public static Gauge ozu => Resources.Load<Gauge>("UI/SmallEnergyGauge");

	public float ozv
	{
		get
		{
			return lgo;
		}
		set
		{
			lgo = value.gtg(0f, 1f);
		}
	}

	public float ozw
	{
		get
		{
			return lgp;
		}
		set
		{
			float num = lgp;
			lgp = value.gtg(0f, 1f);
			if (base.ozd.pdw || base.ozd.pdx)
			{
				lgp = 1f;
			}
			if (num == lgp)
			{
				return;
			}
			if (base.ozd.EnergyPanel.isActiveAndEnabled)
			{
				base.ozd.EnergyPanel.dvw(base.ozc, lgp);
			}
			if (EnergyBar != null && EnergyBar.isActiveAndEnabled)
			{
				EnergyBar.prm = lgp;
			}
			if (MatchSettings.Current.ply && base.ozj && rk.pne)
			{
				if (lgp < 0.45f)
				{
					GameManager.Current.FatigueEffect.dws(this);
				}
				else
				{
					GameManager.Current.FatigueEffect.dwt(GameManager.Current.lmu);
				}
			}
			if (lgp < 0.1f && base.ozc.lhl.paf)
			{
				base.ozc.lhl.dka();
			}
			if (base.ozd.pdt && base.ozi)
			{
				base.ozc.lhl.dkb(lgp);
			}
			else if (lgp < 0.05f && !base.ozc.lhl.pae)
			{
				base.ozc.lhl.paa = CharacterIntensityLevel.Efficient;
			}
		}
	}

	public float ozx => jd.edg(ozw);

	private float ozy => base.ozc.Player.CharacterInfo.stats.stamina;

	private int ozz => base.ozc.Player.CharacterInfo.height;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		ozv = base.ozc.Player.Energy;
		djh();
		EnergyBar = Object.Instantiate(ozu);
		EnergyBar.transform.SetParent(base.ozd.PowerGaugesCanvas.transform, worldPositionStays: false);
		EnergyBar.gameObject.SetActive(base.ozj);
		EnergyBar.prm = lgp;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		base.ozc.lhr += djf;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		base.ozc.lhr -= djf;
	}

	private void djf(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		float num = pn.fxu(c.oqt, b, ozy, ozz) * base.ozc.lhl.pai;
		if (lgq > 0f)
		{
			num += lgq.Value;
		}
		lgq = null;
		ozw -= num;
		ozv -= num * pn.fyb(ozy, base.ozd.pdy.plu, Tournament.Current != null);
	}

	public void djg()
	{
		if (base.ozd.OnlineManager == null || base.ozd.pdt)
		{
			djh();
		}
	}

	private void djh()
	{
		ozw = pn.fxx(ozv, ozw);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Update()
	{
		if (!GameManager.Current.peb)
		{
			return;
		}
		float num = 0f;
		CharacterShotManager.ib ib = base.ozc.lhi.lju;
		if (ib != null && ib.pbk)
		{
			if (!lgq.HasValue)
			{
				lgq = pn.fxt(ib.liz.oqt, ib.lji, ozy, ozz) * base.ozc.lhl.pai;
			}
			if (lgq > 0f)
			{
				num = lgq.Value * (Time.deltaTime / (ib.lje - Time.time)).gtg(0f, 1f);
				lgq -= num;
			}
		}
		else if (base.ozc.lhg.pbh)
		{
			num += pn.fxw(Time.deltaTime, ozy, ozz) * base.ozc.lhl.pai * (base.ozi ? 1.1f : 1f);
		}
		if (num > 0f)
		{
			ozv -= num * pn.fyb(ozy, base.ozd.pdy.plu, Tournament.Current != null);
		}
		if (base.ozc.lhl.pae)
		{
			num -= pn.fxv(Time.deltaTime, ozy, ozw, ozv);
		}
		ozw -= num;
	}
}
