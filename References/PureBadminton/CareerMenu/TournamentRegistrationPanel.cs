using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.Localization.SmartFormat.PersistentVariables;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentRegistrationPanel : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro title;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image stadiumImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Button singlesButton;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Button doublesButton;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Button mixedButton;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AnimatedPanel continueButtonContainer;

	private bool lex;

	private bool ley;

	private bool lez;

	private bool lfa;

	private bool lfb;

	private bool lfc;

	private bool lfd;

	private CareerPair lfe;

	private CareerPair lff;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		title.plk = new LocalizedString("List_TournamentType", careerMenu.ldi.Id);
		stadiumImage.sprite = careerMenu.ldi.gpr();
		singlesButton.transform.Find("Title").GetComponent<LocalizedTextMeshPro>().plk = new LocalizedString("List_TournamentCategory", Career.Current.piu.ToString());
		doublesButton.transform.Find("Title").GetComponent<LocalizedTextMeshPro>().plk = new LocalizedString("List_TournamentCategory", Career.Current.piv.ToString());
		lfd = false;
		lfe = null;
		lff = null;
		lex = Career.Current.MainCharacter.Rank <= careerMenu.ldi.poo;
		ley = Career.Current.piw?.Rank <= careerMenu.ldi.poo;
		lez = Career.Current.pix?.Rank <= careerMenu.ldi.poo;
		if (careerMenu.ldi.pop > 0)
		{
			lfa = Career.Current.MainCharacter.Rank <= careerMenu.ldi.pop;
			lfb = Career.Current.piw?.Rank <= careerMenu.ldi.pop;
			lfc = Career.Current.pix?.Rank <= careerMenu.ldi.pop;
		}
		else
		{
			lfa = (lfb = (lfc = false));
		}
		dck();
	}

	private void dck()
	{
		dcl(singlesButton, lfd, lex, lfa, null, lex ? null : this.gut("CareerMenu_TournamentRegistration", "InsufficientRanking"));
		dcl(doublesButton, lfe != null, ley, lfb, lfe, ley ? null : this.gut("CareerMenu_TournamentRegistration", (Career.Current.piw == null) ? "NoPartner" : "InsufficientRanking"));
		dcl(mixedButton, lff != null, lez, lfc, lff, lez ? null : this.gut("CareerMenu_TournamentRegistration", (Career.Current.pix == null) ? "NoPartner" : "InsufficientRanking"));
		if (lfd || lfe != null || lff != null)
		{
			if (!continueButtonContainer.pqc)
			{
				continueButtonContainer.FadeIn();
			}
		}
		else if (continueButtonContainer.pqc)
		{
			continueButtonContainer.FadeOut();
		}
	}

	private void dcl(Button a, bool b, bool c, bool d, CareerPair e, string f = null)
	{
		string text = "Closed";
		string value = null;
		if (e != null)
		{
			text = "RegisteredWith";
			value = e.fpg(Career.Current.MainCharacter.CharacterId).CharacterInfo.pjm;
		}
		else if (b)
		{
			text = "Registered";
		}
		else if (c)
		{
			text = "Open";
		}
		else if (d)
		{
			text = "OpenQualifications";
		}
		else if (f != null)
		{
			text = "ClosedWithReason";
			value = f;
		}
		Color color = qh.mrn;
		if (b)
		{
			color = qh.mrk;
		}
		else if (c || d)
		{
			color = qh.mrj;
		}
		Transform obj = a.transform.Find("Subtitle");
		obj.GetComponent<LocalizedTextMeshPro>().plk = new LocalizedString("CareerMenu_TournamentRegistration", text) { 
		{
			"0",
			new StringVariable
			{
				Value = value
			}
		} };
		obj.GetComponent<TextMeshProUGUI>().color = color;
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void RegisterSingles()
	{
		if (lex || lfa)
		{
			AudioManager.fiu();
			lfd = !lfd;
		}
		else
		{
			AudioManager.fiw();
		}
		dck();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void RegisterDoubles()
	{
		if (ley || lfb)
		{
			AudioManager.fiu();
			if (lfe == null)
			{
				ChoosePartnerModal.Open(careerMenu.ldi, Career.Current.piv, delegate(CareerPair a)
				{
					lfe = a;
					dck();
				});
			}
			else
			{
				lfe = null;
				dck();
			}
		}
		else
		{
			AudioManager.fiw();
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void RegisterMixed()
	{
		if (lez || lfc)
		{
			AudioManager.fiu();
			if (lff == null)
			{
				ChoosePartnerModal.Open(careerMenu.ldi, TournamentCategory.MixedDoubles, delegate(CareerPair a)
				{
					lff = a;
					dck();
				});
			}
			else
			{
				lff = null;
				dck();
			}
		}
		else
		{
			AudioManager.fiw();
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void Continue()
	{
		Dictionary<TournamentCategory, CareerPair> dictionary = new Dictionary<TournamentCategory, CareerPair>();
		if (lfd)
		{
			dictionary.Add(Career.Current.piu, null);
		}
		if (lfe != null)
		{
			dictionary.Add(Career.Current.piv, lfe);
		}
		if (lff != null)
		{
			dictionary.Add(TournamentCategory.MixedDoubles, lff);
		}
		if (dictionary.Count > 0)
		{
			careerMenu.cyf(dictionary);
		}
	}

	[CompilerGenerated]
	private void dcm(CareerPair a)
	{
		lfe = a;
		dck();
	}

	[CompilerGenerated]
	private void dcn(CareerPair a)
	{
		lff = a;
		dck();
	}
}
