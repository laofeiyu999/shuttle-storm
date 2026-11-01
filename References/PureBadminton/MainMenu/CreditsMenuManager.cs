using System.Text.RegularExpressions;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.Localization.Settings;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CreditsMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI Content;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextAsset TextAsset;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		jfx();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		LocalizationSettings.SelectedLocaleChanged += jfw;
		Content.GetComponent<RectTransform>().anchoredPosition = Vector2.zero;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		LocalizationSettings.SelectedLocaleChanged -= jfw;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (qi.pli.pkq.IsPressed())
		{
			Content.GetComponent<RectTransform>().anchoredPosition -= Vector2.up * Time.deltaTime * 200f;
		}
		else if (qi.pli.pkr.IsPressed())
		{
			Content.GetComponent<RectTransform>().anchoredPosition -= Vector2.down * Time.deltaTime * 200f;
		}
	}

	private void jfw(Locale a)
	{
		jfx();
	}

	private void jfx()
	{
		string text = TextAsset.text;
		foreach (Match item in Regex.Matches(text, "{{(.+)\\.(.+)}}", RegexOptions.IgnoreCase))
		{
			text = text.Replace(item.Value, this.gut(item.Groups[1].Value, item.Groups[2].Value));
		}
		Content.text = text;
	}
}
