using System;
using System.Collections;
using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ModalManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static ModalManager Current;

	private static readonly List<ModalManager> nkt = new List<ModalManager>();

	private GameObject nku;

	private List<CanvasGroup> nkv = new List<CanvasGroup>();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool CloseOnBack;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool AutoClose = true;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool DestroyOnClose;

	protected Action nkw;

	private Coroutine nkx;

	protected float nky;

	private bool nkz;

	public static bool hho<a>() where a : ModalManager
	{
		nkt.RemoveAll((ModalManager a) => a == null);
		return nkt.Exists((ModalManager a) => a is a);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		if (nku == null)
		{
			nku = EventSystem.current.currentSelectedGameObject;
		}
		base.OnEnable();
		qi.pli.pkn.performed += hhp;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkn.performed -= hhp;
	}

	private void hhp(InputAction.CallbackContext a)
	{
		if (CloseOnBack)
		{
			Close();
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	protected void Open(Action onClose = null)
	{
		nkv = this.gvm();
		Current = this;
		if (!nkt.Contains(this))
		{
			nkt.Add(this);
		}
		rt.gjm(hhq());
		nkw = onClose;
	}

	private IEnumerator hhq()
	{
		if (nky > 0f)
		{
			base.pqb.alpha = 0f;
			yield return new WaitForSecondsRealtime(nky);
			if (this == null || nkx != null)
			{
				yield break;
			}
		}
		nkz = true;
		yield return gxj();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void Close()
	{
		if (nkx == null)
		{
			nkx = rt.gjm(hhr());
		}
	}

	protected IEnumerator hhr()
	{
		Current = null;
		if (nkw != null)
		{
			nkw();
		}
		this.gvn(nkv);
		nkv.Clear();
		yield return new WaitForEndOfFrame();
		try
		{
			if (Current != null)
			{
				Current.nku = nku;
			}
			else if (nku?.scene.IsValid() ?? false)
			{
				EventSystem.current.SetSelectedGameObject(nku);
			}
		}
		catch (Exception ex)
		{
			Debug.LogError("Error when closing modal: " + ex.Message);
		}
		if (nkz)
		{
			yield return gxk();
		}
		else if (this != null)
		{
			base.gameObject.SetActive(value: false);
		}
		nkt.Remove(this);
		if (this != null && DestroyOnClose)
		{
			UnityEngine.Object.Destroy(base.gameObject);
		}
		nkx = null;
	}

	public void hhs(GameObject a)
	{
		nku = a;
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		nkt.Clear();
	}
}
