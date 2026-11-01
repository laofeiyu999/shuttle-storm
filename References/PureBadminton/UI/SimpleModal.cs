using System;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class SimpleModal : ModalManager
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class vp
	{
		public float? nla;

		public float? nlb;

		public TextAlignmentOptions? nlc;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI MessageText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button LeftButton;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI LeftButtonText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button RightButton;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI RightButtonText;

	private Action nld;

	private Action nle;

	private static bool nlg;

	public bool nlf { get; private set; }

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Open(Action onClickLeft, Action onClickRight, Action onClose = null)
	{
		Open(onClose);
		nld = onClickLeft;
		nle = onClickRight;
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void ClickLeft()
	{
		nlf = true;
		if (AutoClose)
		{
			Close();
		}
		if (nld != null)
		{
			nld();
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void ClickRight()
	{
		nlf = true;
		if (AutoClose)
		{
			Close();
		}
		if (nle != null)
		{
			nle();
		}
	}

	public static void hhw()
	{
		nlg = true;
	}

	public static void hhx(string a, Action b)
	{
		bool num = nlg;
		nlg = false;
		hic(a, b);
		nlg = num;
	}

	public static SimpleModal hhy(string a, string b, Action c, string d, Action e, bool f = false, Action g = null, vp h = null, string i = "Modal")
	{
		if (nlg)
		{
			Debug.Log("[SimpleModal] refused while another message holds the screen: " + a);
			return null;
		}
		SimpleModal component = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/" + i)).GetComponent<SimpleModal>();
		component.AutoClose = true;
		component.CloseOnBack = f;
		component.DestroyOnClose = true;
		component.MessageText.text = a;
		component.LeftButtonText.text = b;
		Transform child = component.transform.GetChild(0);
		if (h != null && h.nla.HasValue)
		{
			child.GetComponent<RectTransform>().gul(h.nla.Value);
		}
		if (h != null && h.nlb.HasValue)
		{
			child.GetComponent<RectTransform>().gum(h.nlb.Value);
		}
		if (h != null && h.nlc.HasValue)
		{
			component.MessageText.GetComponent<TextMeshProUGUI>().alignment = h.nlc.Value;
		}
		if (d == null)
		{
			component.RightButton.gameObject.SetActive(value: false);
			component.defaultSelectedObject = component.LeftButton.gameObject;
		}
		else
		{
			component.RightButtonText.text = d;
		}
		component.Open(c, e, g);
		return component;
	}

	public static void hhz(string a, string b, Action c, bool d = false, Action e = null, vp f = null)
	{
		hhy(a, b, c, null, null, d, e, f);
	}

	public static SimpleModal hia(string a, Action b, Action c, bool d = false, Action e = null, vp f = null)
	{
		return hhy(a, tt.gra("Global", "No"), c, tt.gra("Global", "Yes"), b, d, e, f);
	}

	public static void hib(string a, Action b, bool c = true, Action d = null, vp e = null)
	{
		hhy(a, tt.gra("Global", "Cancel"), delegate
		{
			AudioManager.PlayMenuChange();
		}, tt.gra("Global", "Ok").ToUpper(), b, c, d, e);
	}

	public static void hic(string a, Action b = null, bool c = true, vp d = null)
	{
		hhz(a, tt.gra("Global", "Ok").ToUpper(), null, c, b, d);
	}

	private static void hid(Scene a, LoadSceneMode b)
	{
		nlg = false;
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Has RuntimeInitializeOnLoadMethodAttribute.")]
	private static void ResetStaticStateOnLoad()
	{
		nlg = false;
		SceneManager.sceneLoaded -= hid;
		SceneManager.sceneLoaded += hid;
	}
}
