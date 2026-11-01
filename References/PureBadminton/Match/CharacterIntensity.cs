using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterIntensity : CharacterComponent
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float MIN_ENERGY_TO_SWITCH_AGGRESIVE = 0.1f;

	private CharacterIntensityLevel lgr;

	private bool lgs;

	private bool lgt;

	private float lgw;

	private CharacterIntensityLevel lgx;

	public CharacterIntensityLevel paa
	{
		get
		{
			if (base.ozd.pdw || base.ozd.pdx)
			{
				return CharacterIntensityLevel.Default;
			}
			if (lgs)
			{
				return CharacterIntensityLevel.Aggressive;
			}
			if (lgt)
			{
				return CharacterIntensityLevel.Efficient;
			}
			return lgr;
		}
		set
		{
			if (value != lgr)
			{
				dkc(lgr);
				lgr = value;
				dkg();
				dke();
			}
		}
	}

	public bool pab
	{
		get
		{
			return lgs;
		}
		set
		{
			if (value != lgs)
			{
				dkc(paa);
				lgs = value;
				dkg();
				dke();
			}
		}
	}

	public bool pac
	{
		get
		{
			return lgt;
		}
		set
		{
			if (value != lgt)
			{
				dkc(paa);
				lgt = value;
				dkg();
				dke();
			}
		}
	}

	public bool pad => paa == CharacterIntensityLevel.Default;

	public bool pae => paa == CharacterIntensityLevel.Efficient;

	public bool paf => paa == CharacterIntensityLevel.Aggressive;

	public float pag
	{
		get
		{
			if (paa != CharacterIntensityLevel.Aggressive)
			{
				return 1f;
			}
			return 1.3f;
		}
	}

	public float pah => jd.edi(paa);

	public float pai => paa switch
	{
		CharacterIntensityLevel.Efficient => 0.7f, 
		CharacterIntensityLevel.Aggressive => 1.5f, 
		_ => 1f, 
	};

	public float lgu { get; private set; }

	public float lgv { get; private set; }

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		base.ozd.lnd += djy;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		base.ozd.lnd -= djy;
	}

	private void djy()
	{
		lgw = Time.time;
		lgv = 0f;
		lgu = 0f;
	}

	public void djz()
	{
		if (paa == CharacterIntensityLevel.Efficient)
		{
			paa = CharacterIntensityLevel.Default;
		}
		else if (base.ozc.lhk.ozw > 0.1f)
		{
			paa = CharacterIntensityLevel.Aggressive;
		}
	}

	public void dka()
	{
		paa = ((paa != CharacterIntensityLevel.Aggressive) ? CharacterIntensityLevel.Efficient : CharacterIntensityLevel.Default);
	}

	public void dkb(float a)
	{
		if (base.ozi)
		{
			if (a < 0.2f && !pae)
			{
				paa = CharacterIntensityLevel.Efficient;
			}
			else if (a < 0.5f && paf)
			{
				paa = CharacterIntensityLevel.Default;
			}
			else if (a > 0.6f && pae)
			{
				paa = CharacterIntensityLevel.Default;
			}
		}
	}

	public void dkc(CharacterIntensityLevel a)
	{
		if (a == CharacterIntensityLevel.Aggressive)
		{
			lgv += Time.time - lgw;
		}
		if (a == CharacterIntensityLevel.Efficient)
		{
			lgu += Time.time - lgw;
		}
		lgw = Time.time;
	}

	public void dkd()
	{
		dkc(paa);
	}

	private void dke()
	{
		CharacterIntensityLevel characterIntensityLevel = paa;
		if (characterIntensityLevel != lgx)
		{
			lgx = characterIntensityLevel;
			if (base.ozc.lhj != null && base.ozc.IsLocallyControlled)
			{
				base.ozc.lhj.emk(characterIntensityLevel);
			}
		}
	}

	public void dkf(CharacterIntensityLevel a)
	{
		lgx = a;
		paa = a;
	}

	public void dkg()
	{
		Gauge energyBar = base.ozc.lhk.EnergyBar;
		if (energyBar != null && energyBar.isActiveAndEnabled)
		{
			CharacterIntensityIcon component = energyBar.GetComponent<CharacterIntensityIcon>();
			if (paf)
			{
				component.hat();
			}
			else if (pae)
			{
				component.hau();
			}
			else
			{
				component.hav();
			}
		}
		if (!base.ozd.EnergyPanel.isActiveAndEnabled)
		{
			return;
		}
		CharacterIntensityIcon characterIntensityIcon = base.ozd.EnergyPanel.dvx(base.ozc);
		if (characterIntensityIcon != null)
		{
			if (paf)
			{
				characterIntensityIcon.hat();
			}
			else if (pae)
			{
				characterIntensityIcon.hau();
			}
			else
			{
				characterIntensityIcon.hav();
			}
		}
	}
}
