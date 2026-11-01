using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class WeekActionPanel : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hl
	{
		public int lfj;

		public WeekActionPanel lfk;

		public Func<sz, bool> lfl;

		internal bool dcw(sz a)
		{
			return lfj <= (a.pop ?? a.poo);
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class hm
	{
		public sz lfm;

		public hl lfn;

		internal void dcx()
		{
			lfn.lfk.careerMenu.cye(lfm);
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject buttonsContainer;

	private List<Button> lfo = new List<Button>();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		foreach (Button item in lfo)
		{
			UnityEngine.Object.DestroyImmediate(item.gameObject);
		}
		lfo.Clear();
		int lfj = Career.Current.flq(Career.Current.MainCharacter);
		Button original = Resources.Load<Button>("UI/ImageButton");
		foreach (sz lfm in Career.Current.piq.Where((sz a) => lfj <= (a.pop ?? a.poo)))
		{
			Button button = UnityEngine.Object.Instantiate(original, buttonsContainer.transform);
			button.transform.SetSiblingIndex(lfo.Count);
			button.name = lfm.Id;
			Sprite sprite = lfm.gpr();
			button.transform.Find("Mask/Image").GetComponent<Image>().sprite = sprite;
			button.transform.Find("Mask/Image").GetComponent<AspectRatioFitter>().aspectRatio = (float)sprite.texture.width / (float)sprite.texture.height;
			button.transform.Find("Title").gameObject.SetActive(value: false);
			button.transform.Find("Title1").gameObject.SetActive(value: true);
			button.transform.Find("Title2").gameObject.SetActive(value: true);
			button.transform.Find("Title1").GetComponent<TextMeshProUGUI>().text = this.gut("List_TournamentType", lfm.Id);
			button.transform.Find("Title2").GetComponent<TextMeshProUGUI>().text = this.gut("List_TournamentSeries", lfm.Series.ToString());
			button.transform.Find("Title2").GetComponent<TextMeshProUGUI>().color = qh.fzq(lfm.Series);
			button.onClick.AddListener(delegate
			{
				careerMenu.cye(lfm);
			});
			lfo.Add(button);
		}
		EventSystem.current.SetSelectedGameObject(buttonsContainer.transform.GetChild(0).gameObject);
	}
}
