using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class EnergyPanel : AnimatedPanel
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class ih
	{
		public Gauge lkd;

		public CharacterIntensityIcon lke;

		public ih(Gauge a, CharacterIntensityIcon b)
		{
			lkd = a;
			lke = b;
		}
	}

	private Dictionary<CharacterManager, ih> lkf = new Dictionary<CharacterManager, ih>();

	public static GameObject pct => Resources.Load<GameObject>("UI/PlayerEnergyGauge");

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Initialize(List<CharacterManager> characters)
	{
		base.transform.guj();
		lkf.Clear();
		foreach (CharacterManager character in characters)
		{
			if (rk.pnd || character.pap)
			{
				GameObject gameObject = Object.Instantiate(pct, base.transform);
				gameObject.transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = character.Player.CharacterInfo.lastName.ToUpper();
				Gauge component = gameObject.transform.GetChild(1).GetChild(1).GetComponent<Gauge>();
				component.Initialize();
				component.Animate = true;
				component.pro = true;
				component.hdu(character.pbb);
				lkf.Add(character, new ih(component, gameObject.GetComponent<CharacterIntensityIcon>()));
				dvw(character, character.GetComponent<CharacterEnergy>().ozw);
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		foreach (KeyValuePair<CharacterManager, ih> item in lkf)
		{
			if (item.Key != null)
			{
				item.Value.lkd.prm = item.Key.lhk.ozw;
			}
		}
	}

	public void dvw(CharacterManager a, float b)
	{
		ih valueOrDefault = lkf.GetValueOrDefault(a);
		if (valueOrDefault != null)
		{
			valueOrDefault.lkd.prm = b;
		}
	}

	public CharacterIntensityIcon dvx(CharacterManager a)
	{
		return lkf.GetValueOrDefault(a)?.lke;
	}
}
