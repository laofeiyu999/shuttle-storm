using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Localization;
using UnityEngine.UI;

[ExecuteInEditMode]
[RequireComponent(typeof(TextMeshProUGUI))]
[RequireComponent(typeof(TextMeshProWithButtonIndication))]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ButtonIndication : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool AutoSize;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public InputActionReference ActionReference;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public string CustomIconName;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LocalizedString LocalizedString;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public string Text;

	private TextMeshProUGUI ngc;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		ngc = GetComponent<TextMeshProUGUI>();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		LocalizedString.StringChanged += gxz;
		ngc.OnPreRenderText += gxy;
		gya();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		LocalizedString.StringChanged -= gxz;
		ngc.OnPreRenderText -= gxy;
	}

	private void gxy(TMP_TextInfo a)
	{
		if (AutoSize)
		{
			this.guz(delegate
			{
				Vector2 preferredValues = ngc.GetPreferredValues();
				GetComponent<RectTransform>().gul(preferredValues.x);
				LayoutRebuilder.MarkLayoutForRebuild(base.transform as RectTransform);
			});
		}
	}

	private void gxz(string a)
	{
		if (ngc != null)
		{
			string text = "";
			if (!string.IsNullOrWhiteSpace(CustomIconName))
			{
				text = "<size=120%><sprite name=\"" + CustomIconName + "\"></size>  ";
			}
			else if (!string.IsNullOrWhiteSpace(ActionReference?.name))
			{
				text = "<size=120%><cmd=" + ActionReference.name + "></size>  ";
			}
			ngc.text = text + a;
		}
	}

	private void gya()
	{
		if (ngc != null)
		{
			if (LocalizedString.IsEmpty)
			{
				gxz(Text);
			}
			else
			{
				LocalizedString.RefreshString();
			}
		}
	}

	[CompilerGenerated]
	private void gyb()
	{
		Vector2 preferredValues = ngc.GetPreferredValues();
		GetComponent<RectTransform>().gul(preferredValues.x);
		LayoutRebuilder.MarkLayoutForRebuild(base.transform as RectTransform);
	}
}
