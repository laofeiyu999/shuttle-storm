using System.Collections;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Rendering;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class FatigueEffectManager : MonoBehaviour
{
	private Coroutine lky;

	private Coroutine lkz;

	private CharacterEnergy lla;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float FATIGUE_MAX_ENERGY = 0.45f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float FATIGUE_MIN_ENERGY = 0.1f;

	private bool llb;

	private float pdc
	{
		get
		{
			if (!(lla != null))
			{
				return 0f;
			}
			return (0.45f - lla.ozw) / 0.35f;
		}
	}

	public void dws(CharacterEnergy a)
	{
		if (!base.gameObject.activeInHierarchy)
		{
			lla = a;
			llb = false;
			base.gameObject.SetActive(value: true);
			lkz = StartCoroutine(dwu());
			lky = StartCoroutine(dwv());
		}
	}

	public void dwt(bool a)
	{
		if (!base.gameObject.activeInHierarchy || llb)
		{
			return;
		}
		if (a)
		{
			if (lkz != null)
			{
				StopCoroutine(lkz);
				lkz = null;
			}
			if (lky != null)
			{
				StopCoroutine(lky);
				lky = null;
			}
			AudioSource[] components = base.transform.GetComponents<AudioSource>();
			for (int i = 0; i < components.Length; i++)
			{
				components[i].volume = 0f;
			}
			GetComponent<Volume>().weight = 0f;
			base.gameObject.SetActive(value: false);
		}
		else
		{
			llb = true;
			this.gvd(() => lkz == null && lky == null, delegate
			{
				llb = false;
				base.gameObject.SetActive(value: false);
			}, 1f);
		}
	}

	private IEnumerator dwu()
	{
		AudioSource[] components = base.transform.GetComponents<AudioSource>();
		int num = 0;
		while (!llb)
		{
			components[num].volume = pdc * 0.5f;
			if (!GameManager.Current.pdu)
			{
				components[num].Play();
			}
			float num2 = 100f + pdc * 70f;
			yield return new WaitForSecondsRealtime(1f / (num2 / 60f));
			num = ((num != components.Length - 1) ? (num + 1) : 0);
		}
		AudioSource[] array = components;
		for (int i = 0; i < array.Length; i++)
		{
			array[i].volume = 0f;
		}
		lkz = null;
	}

	private IEnumerator dwv()
	{
		Volume component = GetComponent<Volume>();
		while (!llb)
		{
			component.weight = pdc.gtg(component.weight - 0.1f, component.weight + 0.1f).gtg(0f, 1f);
			yield return new WaitForSecondsRealtime(0.1f);
		}
		while (component.weight > 0f)
		{
			component.weight = (component.weight - 0.1f).gtg(0f, 1f);
			yield return new WaitForSecondsRealtime(0.1f);
		}
		lky = null;
	}

	[CompilerGenerated]
	private bool dww()
	{
		if (lkz == null)
		{
			return lky == null;
		}
		return false;
	}

	[CompilerGenerated]
	private void dwx()
	{
		llb = false;
		base.gameObject.SetActive(value: false);
	}
}
