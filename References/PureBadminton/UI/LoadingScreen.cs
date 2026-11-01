using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class LoadingScreen : AnimatedPanel
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnCloseLoadingScreen();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float MIN_WAITING_TIME = 1f;

	private static LoadingScreen njv;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI TitleText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI ContentText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image ShuttleImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI TipIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication CloseIndication;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool AutoClose;

	private float njx;

	private List<CanvasGroup> njy = new List<CanvasGroup>();

	private List<qm.HintType> njz;

	private int nka;

	private int nkc;

	private int nkd;

	private Coroutine nke;

	private static LoadingScreen psi => Resources.Load<LoadingScreen>("UI/LoadingScreen");

	public static LoadingScreen psj
	{
		get
		{
			if (njv == null)
			{
				njv = Object.Instantiate(psi);
				Object.DontDestroyOnLoad(njv);
			}
			return njv;
		}
	}

	public static bool psk => psj.pqc;

	public bool njw { get; private set; }

	public static event OnCloseLoadingScreen nkb;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		qi.pli.pkm.performed += hfv;
		qi.msf += hfu;
		TipIndication.gameObject.SetActive(value: false);
		CloseIndication.gameObject.SetActive(value: false);
		ShuttleImage.gameObject.SetActive(value: true);
		njz = qm.gau();
		hfw(0);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= hfv;
		qi.msf -= hfu;
	}

	private void hfu(MoveDirection a, InputAction.CallbackContext b)
	{
		if (njz != null && njz.Count >= 2)
		{
			if (a == MoveDirection.Left)
			{
				hfw((nka == 0) ? (njz.Count - 1) : (nka - 1));
			}
			if (a == MoveDirection.Right)
			{
				hfw((nka != njz.Count - 1) ? (nka + 1) : 0);
			}
		}
	}

	private void hfv(InputAction.CallbackContext a)
	{
		Close();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void Close()
	{
		if (base.pqc && !njw)
		{
			FadeOut();
			this.guz(delegate
			{
				this.gvn(njy);
				LoadingScreen.nkb?.Invoke();
			});
		}
	}

	private void hfw(int a)
	{
		nka = a;
		string[] array = this.gut("Hints", njz[nka].ToString()).Split("|");
		TitleText.text = array[0];
		ContentText.text = ((array.Length > 1) ? array[1] : "");
		TitleText.gameObject.SetActive(value: true);
		ContentText.gameObject.SetActive(value: true);
		TipIndication.gameObject.SetActive(value: true);
		qm.gav(njz[nka]);
	}

	public static void hfx(string a, IEnumerator b = null)
	{
		psj.hfy(a, b);
	}

	private void hfy(string a, IEnumerator b = null)
	{
		if (!njw)
		{
			njw = true;
			if (base.gameObject.activeInHierarchy)
			{
				StartCoroutine(hfz(a));
			}
			else
			{
				rt.gjm(hfz(a, b));
			}
		}
	}

	private IEnumerator hfz(string a, IEnumerator b = null)
	{
		if (!base.pqc)
		{
			yield return gxj();
		}
		njx = Time.unscaledTime;
		if (b != null)
		{
			yield return b;
		}
		SceneManager.LoadSceneAsync(a).completed += hga;
	}

	private void hga(AsyncOperation a)
	{
		nke = StartCoroutine(hge());
	}

	public void hgb(MonoBehaviour a, IEnumerator b)
	{
		nkc++;
		a.StartCoroutine(hgc(b, nkd));
	}

	private IEnumerator hgc(IEnumerator a, int b)
	{
		yield return a;
		if (b == nkd)
		{
			nkc--;
		}
	}

	public void hgd()
	{
		if (nke != null)
		{
			StopCoroutine(nke);
			nke = null;
			nkd++;
			nkc = 0;
			AutoClose = false;
			njw = false;
		}
	}

	private IEnumerator hge()
	{
		yield return new WaitUntil(() => nkc == 0);
		Time.timeScale = 1f;
		njy = this.gvm();
		if (Time.unscaledTime < njx + 1f)
		{
			yield return new WaitForSecondsRealtime(1f - (Time.unscaledTime - njx));
		}
		hgf();
	}

	private void hgf()
	{
		nke = null;
		njw = false;
		ShuttleImage.gameObject.SetActive(value: false);
		CloseIndication.gameObject.SetActive(value: true);
		if (AutoClose)
		{
			AutoClose = false;
			Close();
		}
	}

	[CompilerGenerated]
	private void hgg()
	{
		this.gvn(njy);
		LoadingScreen.nkb?.Invoke();
	}

	[CompilerGenerated]
	private bool hgh()
	{
		return nkc == 0;
	}
}
