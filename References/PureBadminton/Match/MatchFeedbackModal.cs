using System;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchFeedbackModal : ModalManager
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private MatchFeedbackStars stars;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI questionText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI ratingText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI hintText;

	private Action<int?, bool> luj;

	private bool luk;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += eja;
		stars.lun += ejd;
		stars.luo += ejb;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= eja;
		stars.lun -= ejd;
		stars.luo -= ejb;
	}

	private void eja(InputAction.CallbackContext a)
	{
		if (base.pqb.interactable)
		{
			ejb();
		}
	}

	private void ejb()
	{
		if (!luk)
		{
			luk = true;
			AudioManager.fiu();
			Close();
			luj?.Invoke(stars.lum.nyu, stars.lum.nyv);
		}
	}

	private void ejc()
	{
		if (!luk)
		{
			luk = true;
			luj?.Invoke(null, stars.lum.nyv);
		}
	}

	private void ejd()
	{
		questionText.text = this.gut("Match", "MatchFeedbackQuestion");
		ratingText.text = (stars.lum.nyv ? this.gut("Match", $"MatchFeedbackRating{stars.lum.nyu}") : this.gut("Match", "MatchFeedbackChoose"));
		ratingText.fontStyle = ((!stars.lum.nyv) ? FontStyles.Italic : FontStyles.Normal);
		hintText.text = "<cmd=MenuValidate> " + this.gut("Global", "Validate") + "     <cmd=MenuBack> " + this.gut("Global", "Skip");
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static MatchFeedbackModal Open(Action<int?, bool> onAnswer)
	{
		MatchFeedbackModal component = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/MatchFeedbackModal")).GetComponent<MatchFeedbackModal>();
		component.AutoClose = true;
		component.CloseOnBack = true;
		component.DestroyOnClose = true;
		component.luj = onAnswer;
		component.ejd();
		component.Open(component.ejc);
		return component;
	}
}
