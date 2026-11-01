using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharactersPreviewScene : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vc
	{
		public (CharactersPreviewScenePosition, CharacterInfo, CharacterIdlePose)[] nht;

		public Func<KeyValuePair<CharactersPreviewScenePosition, Character3DPreview>, bool> nhu;

		internal bool hbe(KeyValuePair<CharactersPreviewScenePosition, Character3DPreview> a)
		{
			vd CS_0024_003C_003E8__locals0 = new vd
			{
				nhv = a
			};
			return !nht.Any(((CharactersPreviewScenePosition, CharacterInfo, CharacterIdlePose) a) => a.Item1 == CS_0024_003C_003E8__locals0.nhv.Key);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vd
	{
		public KeyValuePair<CharactersPreviewScenePosition, Character3DPreview> nhv;

		internal bool hbf((CharactersPreviewScenePosition, CharacterInfo, CharacterIdlePose) a)
		{
			return a.Item1 == nhv.Key;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject Camera;

	private Vector3 nhw;

	private Vector3? nhx;

	private Vector3? nhy;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Character3DPreview CenterCharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Character3DPreview LeftCharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Character3DPreview LeftPairACharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Character3DPreview LeftPairBCharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Character3DPreview RightCharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Character3DPreview RightPairACharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Character3DPreview RightPairBCharacter;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject LeftLight;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject CenterLight;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject RightLight;

	private Dictionary<CharactersPreviewScenePosition, Character3DPreview> nhz;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Awake()
	{
		nhw = Camera.transform.position;
		nhz = new Dictionary<CharactersPreviewScenePosition, Character3DPreview>
		{
			{
				CharactersPreviewScenePosition.Center,
				CenterCharacter
			},
			{
				CharactersPreviewScenePosition.Left,
				LeftCharacter
			},
			{
				CharactersPreviewScenePosition.LeftPairA,
				LeftPairACharacter
			},
			{
				CharactersPreviewScenePosition.LeftPairB,
				LeftPairBCharacter
			},
			{
				CharactersPreviewScenePosition.Right,
				RightCharacter
			},
			{
				CharactersPreviewScenePosition.RightPairA,
				RightPairACharacter
			},
			{
				CharactersPreviewScenePosition.RightPairB,
				RightPairBCharacter
			}
		};
		foreach (Character3DPreview value in nhz.Values)
		{
			value.ngs = Camera;
		}
	}

	public void hbg(CharactersPreviewScenePosition a, CharacterInfo b, CharacterIdlePose c)
	{
		hbh((a, b, c));
	}

	public void hbh(params (CharactersPreviewScenePosition, CharacterInfo, CharacterIdlePose)[] items)
	{
		foreach (KeyValuePair<CharactersPreviewScenePosition, Character3DPreview> item in nhz.Where((KeyValuePair<CharactersPreviewScenePosition, Character3DPreview> a) => !items.Any(((CharactersPreviewScenePosition, CharacterInfo, CharacterIdlePose) a) => a.Item1 == a.Key)))
		{
			item.Deconstruct(out var _, out var value);
			value.gameObject.SetActive(value: false);
		}
		(CharactersPreviewScenePosition, CharacterInfo, CharacterIdlePose)[] array = items;
		for (int i = 0; i < array.Length; i++)
		{
			(CharactersPreviewScenePosition, CharacterInfo, CharacterIdlePose) tuple = array[i];
			Character3DPreview character3DPreview = nhz[tuple.Item1];
			character3DPreview.gameObject.SetActive(value: true);
			character3DPreview.gyp(tuple.Item2, tuple.Item3);
		}
		LeftLight.SetActive(LeftCharacter.gameObject.activeInHierarchy || LeftPairACharacter.gameObject.activeInHierarchy || LeftPairBCharacter.gameObject.activeInHierarchy);
		RightLight.SetActive(RightCharacter.gameObject.activeInHierarchy || RightPairACharacter.gameObject.activeInHierarchy || RightPairBCharacter.gameObject.activeInHierarchy);
		CenterLight.SetActive(CenterCharacter.gameObject.activeInHierarchy);
	}

	public void hbi()
	{
		foreach (Character3DPreview value in nhz.Values)
		{
			value.gameObject.SetActive(value: false);
		}
		LeftLight.SetActive(value: false);
		RightLight.SetActive(value: false);
		CenterLight.SetActive(value: false);
	}

	public void hbj(Vector3? a = null)
	{
		Vector3 vector = a ?? nhw;
		if (!((Camera.transform.position - vector).magnitude < 0.2f))
		{
			nhx = Camera.transform.position;
			nhy = vector;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (nhy.HasValue && nhx.HasValue)
		{
			float num = 0.3f;
			float num2 = (nhy.Value - nhx.Value).magnitude * Time.deltaTime / num;
			float magnitude = (Camera.transform.position - nhy.Value).magnitude;
			if (num2 > magnitude)
			{
				Camera.transform.position = nhy.Value;
				nhy = (nhx = null);
			}
			else
			{
				Camera.transform.position += (nhy.Value - Camera.transform.position).normalized * num2;
			}
		}
	}
}
