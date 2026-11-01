using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class VirtualKeyboard : AnimatedPanel
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void VirtualKeyboardChangedEvent(VirtualKeyboard obj, string value);

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void VirtualKeyboardValidatedEvent(VirtualKeyboard obj);

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class wg
	{
		public VirtualKeyboard nnq;

		public string nnr;

		internal void hnp()
		{
			nnq.hoc(nnr);
		}
	}

	private Dictionary<string, Button> nnx = new Dictionary<string, Button>();

	private bool nny = true;

	private string nnz;

	private static Button pue => Resources.Load<Button>("UI/KeyboardButton");

	public event VirtualKeyboardChangedEvent nnv;

	public event VirtualKeyboardValidatedEvent nnw;

	public static VirtualKeyboard hnz(string a)
	{
		GameObject gameObject = new GameObject("VirtualKeyboard", typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
		Canvas component = gameObject.GetComponent<Canvas>();
		component.renderMode = RenderMode.ScreenSpaceOverlay;
		component.sortingOrder = 200;
		CanvasScaler component2 = gameObject.GetComponent<CanvasScaler>();
		component2.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
		component2.referenceResolution = new Vector2(1920f, 1080f);
		GameObject gameObject2 = new GameObject("Panel", typeof(RectTransform), typeof(Image));
		gameObject2.transform.SetParent(gameObject.transform);
		RectTransform component3 = gameObject2.GetComponent<RectTransform>();
		component3.anchorMin = new Vector2(0.5f, 0f);
		component3.anchorMax = new Vector2(0.5f, 0f);
		component3.pivot = new Vector2(0.5f, 0f);
		component3.anchoredPosition = new Vector2(0f, 40f);
		component3.sizeDelta = new Vector2(840f, 340f);
		gameObject2.SetActive(value: false);
		VirtualKeyboard virtualKeyboard = gameObject2.AddComponent<VirtualKeyboard>();
		virtualKeyboard.nnz = a;
		gameObject2.GetComponent<Image>().color = new Color32(36, 36, 36, byte.MaxValue);
		GameObject gameObject3 = new GameObject("Rows", typeof(RectTransform), typeof(VerticalLayoutGroup));
		gameObject3.transform.SetParent(gameObject2.transform);
		VerticalLayoutGroup component4 = gameObject3.GetComponent<VerticalLayoutGroup>();
		component4.childAlignment = TextAnchor.MiddleCenter;
		component4.childForceExpandHeight = false;
		component4.childForceExpandWidth = false;
		component4.spacing = 10f;
		RectTransform component5 = gameObject3.GetComponent<RectTransform>();
		component5.anchorMin = new Vector2(0f, 0f);
		component5.anchorMax = new Vector2(1f, 1f);
		component5.offsetMin = Vector2.zero;
		component5.offsetMax = Vector2.zero;
		string[] array = new string[4] { "Q W E R T Y U I O P", "A S D F G H J K L -", "Z X C V B N M . BACK", "MAJ SPACE DONE" };
		foreach (string b in array)
		{
			virtualKeyboard.hoa(gameObject3.transform, b);
		}
		virtualKeyboard.maintainSelectedObject = false;
		return virtualKeyboard;
	}

	private void hoa(Transform a, string b)
	{
		GameObject gameObject = new GameObject("Row", typeof(RectTransform), typeof(HorizontalLayoutGroup));
		gameObject.transform.SetParent(a);
		HorizontalLayoutGroup component = gameObject.GetComponent<HorizontalLayoutGroup>();
		component.childAlignment = TextAnchor.MiddleCenter;
		component.spacing = 10f;
		component.childControlHeight = false;
		component.childControlWidth = false;
		component.childForceExpandWidth = false;
		component.childForceExpandHeight = false;
		gameObject.GetComponent<RectTransform>().sizeDelta = new Vector2(0f, 60f);
		string[] array = b.Split(' ');
		foreach (string b2 in array)
		{
			hob(gameObject.transform, b2);
		}
	}

	private void hob(Transform a, string b)
	{
		Button button = Object.Instantiate(pue, a);
		button.name = b;
		button.onClick.AddListener(delegate
		{
			hoc(b);
		});
		int num = 60;
		if (b == "SPACE")
		{
			num = 410;
		}
		if (b == "DONE" || b == "MAJ" || b == "BACK")
		{
			num = 130;
		}
		button.GetComponent<RectTransform>().sizeDelta = new Vector2(num, 60f);
		TextMeshProUGUI component = button.transform.GetChild(0).GetComponent<TextMeshProUGUI>();
		component.fontSize = ((b.Length > 1) ? 24 : 32);
		component.text = hod(b);
		nnx.Add(b, button);
	}

	private void hoc(string a)
	{
		switch (a)
		{
		case "MAJ":
			nny = !nny;
			{
				foreach (var (a2, button2) in nnx)
				{
					button2.transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = hod(a2);
				}
				return;
			}
		case "BACK":
			if (nnz.Length > 0)
			{
				nnz = nnz.Substring(0, nnz.Length - 1);
				this.nnv?.Invoke(this, nnz);
				if (nnz.Length == 0 && !nny)
				{
					hoc("MAJ");
				}
			}
			return;
		case "DONE":
			this.nnw?.Invoke(this);
			return;
		case "SPACE":
			nnz += " ";
			if (nny)
			{
				hoc("MAJ");
			}
			this.nnv?.Invoke(this, nnz);
			return;
		}
		if (a.Length == 1)
		{
			nnz += hod(a);
			if (nny)
			{
				hoc("MAJ");
			}
			this.nnv?.Invoke(this, nnz);
		}
	}

	private string hod(string a)
	{
		if (a == "SPACE")
		{
			return " ";
		}
		if (a.Length > 1)
		{
			return a;
		}
		if (!nny)
		{
			return a.ToLower();
		}
		return a.ToUpper();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Open()
	{
		SlideUpFadeIn();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void Close()
	{
		rt.gjm(hoe());
	}

	private IEnumerator hoe()
	{
		yield return gxq();
		Object.Destroy(base.transform.parent.gameObject);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		EventSystem.current.SetSelectedGameObject(nnx["Q"].gameObject);
	}
}
