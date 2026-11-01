using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.UI;

namespace Assets.Scripts.Utils;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class ug
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class tz<a>
	{
		public System.Random ndm;

		internal int gsk(a a)
		{
			return ndm.Next();
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ua
	{
		public MonoBehaviour ndn;

		internal bool gsl(Canvas a)
		{
			if (a == ndn.GetComponentInParent<Canvas>())
			{
				return false;
			}
			CanvasGroup component = null;
			if (!a.TryGetComponent<CanvasGroup>(out component))
			{
				return true;
			}
			return component.interactable;
		}
	}

	public static float gtg(this float a, float b, float c)
	{
		return Mathf.Min(c, Mathf.Max(b, a));
	}

	public static int gth(this int a, int b, int c)
	{
		return Math.Min(c, Math.Max(b, a));
	}

	public static string gti(this string a, int b)
	{
		if (string.IsNullOrEmpty(a))
		{
			return a;
		}
		return a.Substring(0, Math.Min(a.Length, b));
	}

	public static int gtj(this DateTime a)
	{
		DateTime today = DateTime.Today;
		int num = DateTime.Today.Year - a.Year;
		if (a.Date > today.AddYears(-num))
		{
			num--;
		}
		return num;
	}

	public static a gtk<a>(this IEnumerable<a> a)
	{
		return a.ToArray()[UnityEngine.Random.Range(0, a.Count())];
	}

	public static void gtl<b>(this Dictionary<b, int> a, b b, int c)
	{
		a[b] = (a.TryGetValue(b, out var value) ? (value + c) : c);
	}

	public static c gtm<c>(this Dictionary<c, int> a)
	{
		int num = 0;
		foreach (KeyValuePair<c, int> item in a)
		{
			num += item.Value;
		}
		return a.gto(UnityEngine.Random.Range(0, num));
	}

	public static d gtn<d>(this IEnumerable<d> a, int b, int c = 100)
	{
		int num = 0;
		int num2 = c / a.Count();
		foreach (d item in a)
		{
			num += num2;
			if (b < num)
			{
				return item;
			}
		}
		return a.Last();
	}

	public static e gto<e>(this Dictionary<e, int> a, int b)
	{
		int num = 0;
		foreach (KeyValuePair<e, int> item in a)
		{
			item.Deconstruct(out var key, out var value);
			e result = key;
			int num2 = value;
			num += num2;
			if (b < num)
			{
				return result;
			}
		}
		return a.Last().Key;
	}

	public static IEnumerable<f> gtp<f>(this IEnumerable<f> a, int b)
	{
		return a.gtq().Take(b);
	}

	public static IEnumerable<g> gtq<g>(this IEnumerable<g> a)
	{
		return a.gtr(new System.Random());
	}

	public static IEnumerable<h> gtr<h>(this IEnumerable<h> a, System.Random b)
	{
		return a.OrderBy((h a) => b.Next());
	}

	public static void gts(this Transform a, float b)
	{
		a.position = new Vector3(b, a.position.y, a.position.z);
	}

	public static void gtt(this Transform a, float b)
	{
		a.position = new Vector3(a.position.x, b, a.position.z);
	}

	public static void gtu(this Transform a, float b)
	{
		a.position = new Vector3(a.position.x, a.position.y, b);
	}

	public static void gtv(this Transform a, float b, float c)
	{
		a.position = new Vector3(b, a.position.y, c);
	}

	public static void gtw(this Transform a, Vector2 b)
	{
		a.position = new Vector3(b.x, a.position.y, b.y);
	}

	public static void gtx(this Transform a, float b)
	{
		a.localPosition = new Vector3(b, a.localPosition.y, a.localPosition.z);
	}

	public static void gty(this Transform a, float b)
	{
		a.localPosition = new Vector3(a.localPosition.x, b, a.localPosition.z);
	}

	public static void gtz(this Transform a, float b)
	{
		a.localPosition = new Vector3(a.localPosition.x, a.localPosition.y, b);
	}

	public static void gua(this Transform a, float b)
	{
		a.eulerAngles = new Vector3(b, a.eulerAngles.y, a.eulerAngles.z);
	}

	public static void gub(this Transform a, float b)
	{
		a.eulerAngles = new Vector3(a.eulerAngles.x, b, a.eulerAngles.z);
	}

	public static void guc(this Transform a, float b)
	{
		a.eulerAngles = new Vector3(a.eulerAngles.x, a.eulerAngles.y, b);
	}

	public static void gud(this Transform a, float b)
	{
		a.localEulerAngles = new Vector3(b, a.localEulerAngles.y, a.localEulerAngles.z);
	}

	public static void gue(this Transform a, float b)
	{
		a.localEulerAngles = new Vector3(a.localEulerAngles.x, b, a.localEulerAngles.z);
	}

	public static void guf(this Transform a, float b)
	{
		a.localEulerAngles = new Vector3(a.localEulerAngles.x, a.localEulerAngles.y, b);
	}

	public static Vector2 gug(this Vector2 a, float b)
	{
		if (b == 0f)
		{
			return a;
		}
		float f = b * (MathF.PI / 180f);
		float x = a.x * Mathf.Cos(f) - a.y * Mathf.Sin(f);
		float y = a.x * Mathf.Sin(f) + a.y * Mathf.Cos(f);
		return new Vector2(x, y);
	}

	public static float guh(this CanvasScaler a)
	{
		float num = 2f;
		float a2 = Mathf.Log((float)Screen.width / a.referenceResolution.x, num);
		float b = Mathf.Log((float)Screen.height / a.referenceResolution.y, num);
		float p = Mathf.Lerp(a2, b, a.matchWidthOrHeight);
		return Mathf.Pow(num, p);
	}

	public static bool gui(this GameObject a)
	{
		if (a == null)
		{
			return (object)a != null;
		}
		return false;
	}

	public static void guj(this Transform a)
	{
		foreach (Transform item in a)
		{
			UnityEngine.Object.Destroy(item.gameObject);
		}
	}

	public static void guk(this RectTransform a, float b = 0f, float c = 0f)
	{
		a.anchorMin = Vector2.zero;
		a.anchorMax = Vector2.one;
		a.offsetMin = new Vector2(b, c);
		a.offsetMax = new Vector2(0f - b, 0f - c);
	}

	public static void gul(this RectTransform a, float b)
	{
		a.sizeDelta = new Vector2(b, a.sizeDelta.y);
	}

	public static void gum(this RectTransform a, float b)
	{
		a.sizeDelta = new Vector2(a.sizeDelta.x, b);
	}

	public static void gun(this RectTransform a, float b)
	{
		a.offsetMin = new Vector2(b, a.offsetMin.y);
	}

	public static void guo(this RectTransform a, float b)
	{
		a.offsetMax = new Vector2(0f - b, a.offsetMax.y);
	}

	public static void gup(this RectTransform a, float b)
	{
		a.offsetMax = new Vector2(a.offsetMax.x, 0f - b);
	}

	public static void guq(this RectTransform a, float b)
	{
		a.offsetMin = new Vector2(a.offsetMin.x, b);
	}

	public static void gur(this TextMeshProUGUI a, LocalizedString b)
	{
		LocalizedTextMeshPro component = a.GetComponent<LocalizedTextMeshPro>();
		if (component != null)
		{
			component.plk = b;
			return;
		}
		a.gameObject.SetActive(value: false);
		component = a.gameObject.AddComponent<LocalizedTextMeshPro>();
		component.plk = b;
		a.gameObject.SetActive(value: true);
	}

	public static bool gus(this MonoBehaviour a)
	{
		return a.GetComponentsInParent<CanvasGroup>().All((CanvasGroup a) => a.interactable);
	}

	public static string gut(this MonoBehaviour a, string b, string c, params object[] arguments)
	{
		return tt.gra(b, c, arguments);
	}

	public static YieldInstruction guu(this MonoBehaviour a, float b)
	{
		return new WaitForSeconds(b * ((Time.timeScale > 0f) ? Time.timeScale : MatchSettings.Current.plt));
	}

	public static Coroutine guv(this MonoBehaviour a, float b, Action c)
	{
		return a.StartCoroutine(a.guw(b, c));
	}

	public static IEnumerator guw(this MonoBehaviour a, float b, Action c)
	{
		yield return new WaitForSecondsRealtime(b);
		c();
	}

	public static Coroutine gux(this MonoBehaviour a, float b, Action c)
	{
		return a.StartCoroutine(a.guy(b, c));
	}

	public static IEnumerator guy(this MonoBehaviour a, float b, Action c)
	{
		yield return new WaitForSeconds(b);
		c();
	}

	public static Coroutine guz(this MonoBehaviour a, Action b)
	{
		return a.StartCoroutine(a.gva(b));
	}

	public static IEnumerator gva(this MonoBehaviour a, Action b)
	{
		yield return new WaitForEndOfFrame();
		b();
	}

	public static Coroutine gvb(this MonoBehaviour a, Action b)
	{
		return a.StartCoroutine(a.gvc(b));
	}

	public static IEnumerator gvc(this MonoBehaviour a, Action b)
	{
		yield return new WaitForFixedUpdate();
		b();
	}

	public static Coroutine gvd(this MonoBehaviour a, Func<bool> b, Action c, float? d = null)
	{
		return a.StartCoroutine(a.gve(b, c, d));
	}

	public static IEnumerator gve(this MonoBehaviour a, Func<bool> b, Action c, float? d = null)
	{
		if (d.HasValue)
		{
			yield return new WaitUntil(b, TimeSpan.FromSeconds(d.Value), delegate
			{
			});
		}
		else
		{
			yield return new WaitUntil(b);
		}
		c();
	}

	public static void gvf(this GameObject a, int b)
	{
		a.layer = b;
		foreach (Transform item in a.transform)
		{
			item.gameObject.gvf(b);
		}
	}

	public static int gvg(this int a, int b)
	{
		return a | (1 << b);
	}

	public static int gvh(this int a, int b)
	{
		return a & ~(1 << b);
	}

	public static void gvi(this Camera a, int b)
	{
		a.cullingMask |= 1 << b;
	}

	public static void gvj(this Camera a, int b)
	{
		a.cullingMask &= ~(1 << b);
	}

	public static void gvk(this Camera a, int[] b)
	{
		foreach (int b2 in b)
		{
			a.gvi(b2);
		}
	}

	public static void gvl(this Camera a, int[] b)
	{
		foreach (int b2 in b)
		{
			a.gvj(b2);
		}
	}

	public static List<CanvasGroup> gvm(this MonoBehaviour a)
	{
		return UnityEngine.Object.FindObjectsByType<Canvas>(FindObjectsSortMode.None).Where(delegate(Canvas a)
		{
			if (a == a.GetComponentInParent<Canvas>())
			{
				return false;
			}
			CanvasGroup component2 = null;
			return !a.TryGetComponent<CanvasGroup>(out component2) || component2.interactable;
		}).Select(delegate(Canvas a)
		{
			CanvasGroup component = null;
			if (!a.TryGetComponent<CanvasGroup>(out component))
			{
				component = a.gameObject.AddComponent<CanvasGroup>();
			}
			component.interactable = false;
			return component;
		})
			.ToList();
	}

	public static void gvn(this MonoBehaviour a, List<CanvasGroup> b)
	{
		b.Where((CanvasGroup a) => a != null && !a.gameObject.gui() && a.gameObject.scene.IsValid()).ToList().ForEach(delegate(CanvasGroup a)
		{
			a.interactable = true;
		});
	}
}
