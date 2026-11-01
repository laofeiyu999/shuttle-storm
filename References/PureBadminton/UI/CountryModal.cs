using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Nobi.UiRoundedCorners;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CountryModal : ModalManager
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class vl
	{
		public Country nkf;

		internal bool hgv(Country a)
		{
			return a.alpha3 == nkf?.alpha3;
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Table table;

	private List<Country> nkl;

	private Action<Country> nkm;

	private List<Country> psv
	{
		get
		{
			if (nkl == null)
			{
				nkl = Countries.pky.OrderBy((Country a) => a.name).ToList();
			}
			return nkl;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += hhb;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= hhb;
	}

	private void hhb(InputAction.CallbackContext a)
	{
		Close();
		nkm(psv.ToArray()[table.pto]);
	}

	private IEnumerator hhc(Country a)
	{
		yield return new WaitForEndOfFrame();
		table.Alignment = TextAlignmentOptions.MidlineLeft;
		table.Columns = new List<TableColumn>
		{
			new TableColumn("", hhd, 100f),
			new TableColumn("", "Name", TableColumn.ColumnType.String)
		};
		table.BodyRowHeight = 60f;
		table.Rows = psv.Select((Country a) => new vu
		{
			nmq = new Dictionary<string, object>
			{
				{
					"Image",
					Countries.fxd(a.alpha3)
				},
				{ "Name", a.name }
			}
		}).ToList();
		table.Refresh();
		int num = psv.ToList().FindIndex((Country a) => a.alpha3 == a?.alpha3);
		table.pto = ((num >= 0) ? num : 0);
	}

	public static void hhd(GameObject a, vu b, int c, bool d, Table e)
	{
		GameObject obj = new GameObject();
		obj.transform.SetParent(a.transform, worldPositionStays: false);
		Image image = obj.AddComponent<Image>();
		image.sprite = b.nmq["Image"] as Sprite;
		RectTransform component = image.GetComponent<RectTransform>();
		Vector2 anchorMin = (component.anchorMax = new Vector2(0.5f, 0.5f));
		component.anchorMin = anchorMin;
		component.anchoredPosition = Vector2.zero;
		component.sizeDelta = new Vector2(60f, 40f);
		ImageWithRoundedCorners imageWithRoundedCorners = obj.AddComponent<ImageWithRoundedCorners>();
		imageWithRoundedCorners.radius = 5f;
		imageWithRoundedCorners.Validate();
		imageWithRoundedCorners.Refresh();
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Open(Action<Country> onChooseCountry, Country selectedCountry = null)
	{
		CountryModal component = UnityEngine.Object.Instantiate(Resources.Load<GameObject>("UI/CountryModal")).GetComponent<CountryModal>();
		component.AutoClose = true;
		component.CloseOnBack = true;
		component.DestroyOnClose = true;
		component.Open((Action)delegate
		{
		});
		component.nkm = onChooseCountry;
		component.StartCoroutine(component.hhc(selectedCountry));
	}
}
