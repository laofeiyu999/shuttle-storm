using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class FlyingText : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TMP_Text text;

	private Vector3 nil;

	private Vector2 nim;

	private Camera nin;

	private RectTransform nio;

	private Coroutine nip;

	public void hcs(string a, Color b, Camera c, Vector3 d, Vector2 e)
	{
		nin = c;
		nil = d;
		nim = e;
		if (!base.gameObject.activeSelf)
		{
			base.gameObject.SetActive(value: true);
		}
		text.text = a;
		text.color = b;
		if (nio == null)
		{
			nio = GetComponent<RectTransform>();
		}
		Update();
		text.GetComponent<Animator>().Play("FlyingTextDisappear");
		if (nip != null)
		{
			StopCoroutine(nip);
		}
		nip = StartCoroutine(this.guw(1f, delegate
		{
			base.gameObject.SetActive(value: false);
		}));
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Start()
	{
		nio = GetComponent<RectTransform>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Update()
	{
		_ = nil;
		Vector3 vector = nin.WorldToScreenPoint(nil);
		nio.position = new Vector3(vector.x + nim.x, vector.y + nim.y, 0f);
	}

	[CompilerGenerated]
	private void hct()
	{
		base.gameObject.SetActive(value: false);
	}
}
