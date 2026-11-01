using System;
using System.Linq;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.Localization.SmartFormat.PersistentVariables;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TrainingButton : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hj
	{
		public tn lfg;

		public Func<CareerTrainingScore, bool> lfh;

		internal bool dcp(CareerTrainingScore a)
		{
			if (a.TrainingInfo.nca == lfg.nca)
			{
				return a.TrainingInfo.ncb == lfg.ncb;
			}
			return false;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hk
	{
		public int lfi;

		internal int? dcq(CareerTrainingScore a)
		{
			return a.Scores[lfi];
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro titleText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro levelText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image lockIcon;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private HorizontalLayoutGroup medalsContainer;

	public static TrainingButton oyj => Resources.Load<TrainingButton>("UI/Career/TrainingButton");

	public void dcs(tn a)
	{
		titleText.plk = new LocalizedString("Training", a.nca.ToString());
		levelText.plk = new LocalizedString("Training", "Level") { 
		{
			"0",
			new StringVariable
			{
				Value = a.ncb.ToString()
			}
		} };
		bool flag = a.gqw(Career.Current.MainCharacter.CharacterInfo.stats);
		lockIcon.gameObject.SetActive(flag);
		medalsContainer.gameObject.SetActive(!flag);
		if (flag)
		{
			return;
		}
		GameObject original = medalsContainer.transform.GetChild(0).gameObject;
		for (int i = 1; i < a.ncc.Count; i++)
		{
			UnityEngine.Object.Instantiate(original, medalsContainer.transform);
		}
		int lfi;
		for (lfi = 0; lfi < a.ncc.Count; lfi++)
		{
			int valueOrDefault = (from a in Career.Current.Trainings
				select a.Item2 into a
				where a.TrainingInfo.nca == a.nca && a.TrainingInfo.ncb == a.ncb
				select a).Max((CareerTrainingScore a) => a.Scores[lfi]).GetValueOrDefault();
			MedalType? a2 = a.ncc[lfi].gqz(valueOrDefault);
			medalsContainer.transform.GetChild(lfi).GetChild(0).GetComponent<Image>()
				.sprite = vk.hgm(a2);
		}
	}
}
