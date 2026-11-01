using System;
using System.Collections;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ProgressionPanel : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject speedContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject powerContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject precisionContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject defenseContainer;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject staminaContainer;

	private AudioSource lep;

	private AudioSource leq;

	private AudioClip ler;

	private AudioClip les;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		lep = base.gameObject.AddComponent<AudioSource>();
		leq = base.gameObject.AddComponent<AudioSource>();
		ler = Resources.Load<AudioClip>("Sounds/countdown-single");
		les = Resources.Load<AudioClip>("Sounds/success-3");
	}

	public void dbi(CharacterStats a, CharacterStats b)
	{
		dbk(speedContainer, a.speed, b.speed);
		dbk(powerContainer, a.power, b.power);
		dbk(precisionContainer, a.precision, b.precision);
		dbk(defenseContainer, a.defense, b.defense);
		dbk(staminaContainer, a.stamina, b.stamina);
		if (!(a.ToString() == b.ToString()))
		{
			StartCoroutine(dbj(a, b));
		}
	}

	private IEnumerator dbj(CharacterStats a, CharacterStats b)
	{
		yield return new WaitForSeconds(1f);
		for (int i = 0; i < 20; i++)
		{
			lep.PlayOneShot(ler);
			dbk(speedContainer, a.speed, b.speed, (float)i / 20f, (float)(i - 1) / 20f);
			dbk(powerContainer, a.power, b.power, (float)i / 20f, (float)(i - 1) / 20f);
			dbk(precisionContainer, a.precision, b.precision, (float)i / 20f, (float)(i - 1) / 20f);
			dbk(defenseContainer, a.defense, b.defense, (float)i / 20f, (float)(i - 1) / 20f);
			dbk(staminaContainer, a.stamina, b.stamina, (float)i / 20f, (float)(i - 1) / 20f);
			yield return new WaitForSeconds(0.1f);
		}
	}

	private void dbk(GameObject a, float b, float c, float d = 0f, float e = 0f)
	{
		float num = Mathf.Lerp(b, c, d);
		if (e >= 0f && Math.Floor(Mathf.Lerp(b, c, e)) < Math.Floor(num))
		{
			leq.PlayOneShot(les);
		}
		a.transform.GetChild(1).GetComponent<TextMeshProUGUI>().text = Mathf.Floor(num).ToString();
		a.transform.GetChild(2).GetChild(0).GetComponent<TextMeshProUGUI>()
			.text = $"+{Mathf.Floor(num) - Mathf.Floor(b)}";
		a.transform.GetChild(2).gameObject.SetActive(Mathf.Floor(num) > Mathf.Floor(b));
		a.transform.GetChild(3).GetComponent<Gauge>().prm = num % 1f;
	}
}
