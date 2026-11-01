using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class AnimatedPanel : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float ANIMATION_DURATION = 0.25f;

	private CanvasGroup nfu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	protected bool defaultVisible;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	protected bool maintainSelectedObject = true;

	protected GameObject nfv;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	protected GameObject defaultSelectedObject;

	private Coroutine nfw;

	private Coroutine nfx;

	private Vector2? nfy;

	protected CanvasGroup pqb
	{
		get
		{
			if (nfu == null)
			{
				Initialize();
			}
			return nfu;
		}
	}

	public bool pqc
	{
		get
		{
			if (base.gameObject.activeInHierarchy)
			{
				return pqb.interactable;
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected virtual void Awake()
	{
		Initialize();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected virtual void OnEnable()
	{
		GameObject gameObject = ((nfv != null && nfv.activeInHierarchy) ? nfv : defaultSelectedObject);
		if (gameObject != null)
		{
			if (ModalManager.Current != null && ModalManager.Current != this)
			{
				ModalManager.Current.hhs(gameObject);
			}
			else
			{
				EventSystem.current.SetSelectedGameObject(gameObject);
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected virtual void OnDisable()
	{
		if (nfw != null)
		{
			StopCoroutine(nfw);
			gxw();
			nfw = null;
			gxr();
		}
		if (nfx != null)
		{
			StopCoroutine(nfx);
			gxw();
			nfx = null;
			pqb.interactable = false;
			pqb.alpha = 0f;
			base.gameObject.SetActive(value: false);
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Initialize()
	{
		nfu = GetComponent<CanvasGroup>();
		if (nfu == null)
		{
			nfu = base.gameObject.AddComponent<CanvasGroup>();
			nfu.alpha = (defaultVisible ? 1 : 0);
			nfu.interactable = defaultVisible;
		}
	}

	protected virtual void cyr()
	{
		if (maintainSelectedObject)
		{
			nfv = EventSystem.current.currentSelectedGameObject;
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void FadeIn()
	{
		gxi(gxj(), b: true);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void FadeOut()
	{
		gxi(gxk(), b: false);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void SlideRightFadeIn()
	{
		gxi(gxl(), b: true);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void SlideRightFadeOut()
	{
		gxi(gxm(), b: false);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void SlideLeftFadeIn()
	{
		gxi(gxn(), b: true);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void SlideLeftFadeOut()
	{
		gxi(gxo(), b: false);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void SlideUpFadeIn()
	{
		gxi(gxp(), b: true);
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void SlideDownFadeOut()
	{
		gxi(gxq(), b: false);
	}

	private void gxi(IEnumerator a, bool b)
	{
		if (nfw != null || nfx != null)
		{
			if ((nfw != null && b) || (nfx != null && !b))
			{
				return;
			}
			if (nfw != null && !b)
			{
				StopCoroutine(nfw);
				gxw();
				nfw = null;
				gxs();
			}
			if (nfx != null && b)
			{
				StopCoroutine(nfx);
				gxw();
				nfx = null;
				if (base.gameObject.activeInHierarchy)
				{
					base.gameObject.SetActive(value: false);
				}
				gxr();
			}
		}
		else
		{
			Coroutine coroutine = null;
			coroutine = ((!base.gameObject.activeInHierarchy) ? rt.gjm(a) : StartCoroutine(a));
			if (b)
			{
				nfw = coroutine;
			}
			else
			{
				nfx = coroutine;
			}
		}
	}

	public IEnumerator gxj()
	{
		yield return gxt("FadeIn");
	}

	public IEnumerator gxk()
	{
		yield return gxu("FadeOut");
	}

	public IEnumerator gxl()
	{
		yield return gxt("SlideRightFadeIn");
	}

	public IEnumerator gxm()
	{
		yield return gxu("SlideRightFadeOut");
	}

	public IEnumerator gxn()
	{
		yield return gxt("SlideLeftFadeIn");
	}

	public IEnumerator gxo()
	{
		yield return gxu("SlideLeftFadeOut");
	}

	public IEnumerator gxp()
	{
		yield return gxt("SlideUpFadeIn");
	}

	public IEnumerator gxq()
	{
		yield return gxu("SlideDownFadeOut");
	}

	public void gxr()
	{
		base.gameObject.SetActive(value: true);
		pqb.alpha = 1f;
		pqb.interactable = true;
	}

	public void gxs()
	{
		cyr();
		pqb.interactable = false;
		pqb.alpha = 0f;
		base.gameObject.SetActive(value: false);
	}

	private IEnumerator gxt(string a)
	{
		yield return new WaitForEndOfFrame();
		base.gameObject.SetActive(value: true);
		yield return gxv(a);
		nfw = null;
	}

	private IEnumerator gxu(string a)
	{
		cyr();
		yield return new WaitForEndOfFrame();
		yield return gxv(a);
		nfx = null;
		if (this != null && base.gameObject.scene.IsValid())
		{
			base.gameObject.SetActive(value: false);
		}
	}

	private IEnumerator gxv(string a)
	{
		RectTransform component = GetComponent<RectTransform>();
		Vector2 anchoredPosition = component.anchoredPosition;
		nfy = anchoredPosition;
		float unscaledTime = Time.unscaledTime;
		switch (a)
		{
		case "FadeIn":
			pqb.interactable = true;
			pqb.alpha = 0f;
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(0f, 1f, (Time.unscaledTime - unscaledTime) / 0.25f);
				yield return new WaitForEndOfFrame();
			}
			pqb.alpha = 1f;
			break;
		case "FadeOut":
			pqb.interactable = false;
			pqb.alpha = 1f;
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(1f, 0f, (Time.unscaledTime - unscaledTime) / 0.25f);
				yield return new WaitForEndOfFrame();
			}
			pqb.alpha = 0f;
			break;
		case "SlideRightFadeIn":
			pqb.interactable = true;
			pqb.alpha = 0f;
			component.anchoredPosition = anchoredPosition + new Vector2(50f, 0f);
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(0f, 1f, (Time.unscaledTime - unscaledTime) / 0.25f);
				component.anchoredPosition = anchoredPosition + new Vector2(Mathf.Lerp(50f, 0f, (Time.unscaledTime - unscaledTime) / 0.25f), 0f);
				yield return new WaitForEndOfFrame();
			}
			component.anchoredPosition = anchoredPosition;
			pqb.alpha = 1f;
			break;
		case "SlideRightFadeOut":
			pqb.interactable = false;
			pqb.alpha = 1f;
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(1f, 0f, (Time.unscaledTime - unscaledTime) / 0.25f);
				component.anchoredPosition = anchoredPosition + new Vector2(Mathf.Lerp(0f, 50f, (Time.unscaledTime - unscaledTime) / 0.25f), 0f);
				yield return new WaitForEndOfFrame();
			}
			component.anchoredPosition = anchoredPosition;
			pqb.alpha = 0f;
			break;
		case "SlideLeftFadeIn":
			pqb.interactable = true;
			pqb.alpha = 0f;
			component.anchoredPosition = anchoredPosition + new Vector2(-50f, 0f);
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(0f, 1f, (Time.unscaledTime - unscaledTime) / 0.25f);
				component.anchoredPosition = anchoredPosition + new Vector2(Mathf.Lerp(-50f, 0f, (Time.unscaledTime - unscaledTime) / 0.25f), 0f);
				yield return new WaitForEndOfFrame();
			}
			component.anchoredPosition = anchoredPosition;
			pqb.alpha = 1f;
			break;
		case "SlideLeftFadeOut":
			pqb.interactable = false;
			pqb.alpha = 1f;
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(1f, 0f, (Time.unscaledTime - unscaledTime) / 0.25f);
				component.anchoredPosition = anchoredPosition + new Vector2(Mathf.Lerp(0f, -50f, (Time.unscaledTime - unscaledTime) / 0.25f), 0f);
				yield return new WaitForEndOfFrame();
			}
			component.anchoredPosition = anchoredPosition;
			pqb.alpha = 0f;
			break;
		case "SlideUpFadeIn":
			pqb.interactable = true;
			pqb.alpha = 0f;
			component.anchoredPosition = anchoredPosition + new Vector2(0f, -50f);
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(0f, 1f, (Time.unscaledTime - unscaledTime) / 0.25f);
				component.anchoredPosition = anchoredPosition + new Vector2(0f, Mathf.Lerp(-50f, 0f, (Time.unscaledTime - unscaledTime) / 0.25f));
				yield return new WaitForEndOfFrame();
			}
			component.anchoredPosition = anchoredPosition;
			pqb.alpha = 1f;
			break;
		case "SlideDownFadeOut":
			pqb.interactable = false;
			pqb.alpha = 1f;
			while (Time.unscaledTime <= unscaledTime + 0.25f)
			{
				pqb.alpha = Mathf.Lerp(1f, 0f, (Time.unscaledTime - unscaledTime) / 0.25f);
				component.anchoredPosition = anchoredPosition + new Vector2(0f, Mathf.Lerp(0f, -50f, (Time.unscaledTime - unscaledTime) / 0.25f));
				yield return new WaitForEndOfFrame();
			}
			component.anchoredPosition = anchoredPosition;
			pqb.alpha = 0f;
			break;
		}
		nfy = null;
		yield return new WaitForSecondsRealtime(0.1f);
	}

	private void gxw()
	{
		if (nfy.HasValue)
		{
			GetComponent<RectTransform>().anchoredPosition = nfy.Value;
			nfy = null;
		}
	}
}
