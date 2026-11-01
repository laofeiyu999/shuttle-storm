using System.Collections;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class Gauge : MonoBehaviour
{
	private bool niv;

	[SerializeField]
	[Range(0f, 1f)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private float value;

	private float niw;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float ANIMATION_TIME = 1.5f;

	private Coroutine nix;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool Animate;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private bool dynamicColor;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Color color;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Color backgroundColor;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private float stripeDensity;

	public float prm
	{
		get
		{
			return value;
		}
		set
		{
			if (this.value != value)
			{
				if (nix == null && base.isActiveAndEnabled && Animate && value < this.value)
				{
					prn = this.value;
					nix = StartCoroutine(hds());
				}
				this.value = value;
				hdm();
			}
		}
	}

	private float prn
	{
		get
		{
			return niw;
		}
		set
		{
			if (niw != value)
			{
				niw = value;
				hdn();
			}
		}
	}

	public bool pro
	{
		get
		{
			return dynamicColor;
		}
		set
		{
			dynamicColor = value;
			if (dynamicColor)
			{
				hdr();
			}
		}
	}

	public Color prp
	{
		get
		{
			return color;
		}
		set
		{
			color = value;
			hdo();
		}
	}

	public Color prq
	{
		get
		{
			return backgroundColor;
		}
		set
		{
			backgroundColor = value;
			hdp();
		}
	}

	public float prr
	{
		get
		{
			return stripeDensity;
		}
		set
		{
			stripeDensity = value;
			hdq();
		}
	}

	private Material prs => base.transform.GetChild(0).GetComponent<RawImage>().material;

	private Material prt => base.transform.GetChild(1).GetComponent<RawImage>().material;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Initialize()
	{
		if (!niv)
		{
			base.transform.GetChild(0).GetComponent<RawImage>().material = Object.Instantiate(base.transform.GetChild(0).GetComponent<RawImage>().material);
			base.transform.GetChild(1).GetComponent<RawImage>().material = Object.Instantiate(base.transform.GetChild(1).GetComponent<RawImage>().material);
			niv = true;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		Initialize();
		niw = (Animate ? value : 0f);
		hdn();
		hdm();
		hdo();
		hdp();
		hdq();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void OnEnable()
	{
		niw = (Animate ? value : 0f);
		hdn();
		hdm();
		this.guz(delegate
		{
			RectTransform component = GetComponent<RectTransform>();
			base.transform.GetChild(0).GetComponent<RawImage>().material.SetFloat("_PixelAspect", component.rect.width / component.rect.height);
			base.transform.GetChild(1).GetComponent<RawImage>().material.SetFloat("_PixelAspect", component.rect.width / component.rect.height);
		});
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void OnDisable()
	{
		hdt();
	}

	private void hdm()
	{
		if (!niv)
		{
			Initialize();
		}
		prt.SetFloat("_FillAmount", value);
		if (pro)
		{
			hdr();
		}
	}

	private void hdn()
	{
		if (!niv)
		{
			Initialize();
		}
		prs.SetFloat("_FillAmount", niw);
	}

	private void hdo()
	{
		if (!niv)
		{
			Initialize();
		}
		base.transform.GetChild(1).GetComponent<RawImage>().material.SetColor("_BaseColor", color);
	}

	private void hdp()
	{
		GetComponent<Image>().color = backgroundColor;
	}

	private void hdq()
	{
		if (!niv)
		{
			Initialize();
		}
		prt.SetFloat("_StripeDensity", stripeDensity);
	}

	private void hdr()
	{
		prp = ((value > 0.4f) ? Color.Lerp(Color.yellow, qh.mrr, (value - 0.4f) / 0.2f) : Color.Lerp(Color.red, Color.yellow, (value - 0.1f) / 0.3f));
	}

	private IEnumerator hds()
	{
		yield return new WaitForSeconds(1.5f);
		if (value < niw)
		{
			float time = Time.time;
			float a = niw;
			while (Time.time < time + 0.2f)
			{
				yield return new WaitForEndOfFrame();
				if (value > niw)
				{
					break;
				}
				prn = Mathf.Lerp(a, value, (Time.time - time) / 0.2f);
			}
			prn = value;
		}
		nix = null;
	}

	private void hdt()
	{
		if (nix != null)
		{
			StopCoroutine(nix);
			nix = null;
		}
		prn = value;
	}

	public void hdu(CharacterStats a)
	{
		prr = (CharacterStats.ftj(a.stamina) - 0.4f).gtg(0.1f, 0.6f);
	}

	[CompilerGenerated]
	private void hdv()
	{
		RectTransform component = GetComponent<RectTransform>();
		base.transform.GetChild(0).GetComponent<RawImage>().material.SetFloat("_PixelAspect", component.rect.width / component.rect.height);
		base.transform.GetChild(1).GetComponent<RawImage>().material.SetFloat("_PixelAspect", component.rect.width / component.rect.height);
	}
}
