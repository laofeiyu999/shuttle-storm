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

[ExecuteInEditMode]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class Table : Selectable
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnSelectedRowChanged(int rowId);

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TMP_FontAsset Font;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextAlignmentOptions Alignment = TextAlignmentOptions.Center;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool DynamicHeight;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float? MaxHeight;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool HeaderVisible = true;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float? HeadRowHeight;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Color HeadBackgroundColor;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Color HeadForegroundColor = Color.white;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float HeadFontSize = 12f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public FontStyles HeadFontStyle;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float? BodyRowHeight;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Color BodyBackgroundColor;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Color BodyForegroundColor = Color.white;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Color BodyAlternativeBackgroundColor;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float BodyFontSize;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public FontStyles BodyFontStyle;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool NavigateOutAtEdges;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Color SelectedRowBackgroundColor;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Color? SelectedRowForegroundColor;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<TableColumn> Columns = new List<TableColumn>();

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<vu> Rows = new List<vu>();

	private int nmk;

	private int nml;

	private int nmm;

	private bool nmn;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject head;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject body;

	public int pto
	{
		get
		{
			return nmk;
		}
		set
		{
			if (value.gth(0, Rows.Count - 1) != nmk)
			{
				nmk = value.gth(0, Rows.Count - 1);
				this.nmo?.Invoke(nmk);
			}
			hlb();
			hla();
		}
	}

	public event OnSelectedRowChanged nmo;

	public event Action nmp;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Start()
	{
		base.Start();
		Refresh();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		this.guz(delegate
		{
			hlb(a: true);
		});
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Refresh()
	{
		bool flag = EventSystem.current?.currentSelectedGameObject == base.gameObject;
		head.transform.guj();
		body.transform.guj();
		head.SetActive(HeaderVisible);
		head.GetComponent<Image>().color = HeadBackgroundColor;
		if (HeadRowHeight.HasValue)
		{
			head.GetComponent<LayoutElement>().minHeight = HeadRowHeight.Value;
		}
		foreach (TableColumn column in Columns)
		{
			GameObject obj = new GameObject(column.Label ?? "");
			obj.transform.SetParent(head.transform);
			obj.transform.localScale = Vector3.one;
			LayoutElement layoutElement = obj.AddComponent<LayoutElement>();
			if (column.Size.HasValue)
			{
				layoutElement.minWidth = column.Size.Value;
			}
			else
			{
				layoutElement.preferredWidth = 10000f;
			}
			TextMeshProUGUI textMeshProUGUI = obj.AddComponent<TextMeshProUGUI>();
			textMeshProUGUI.font = Font;
			textMeshProUGUI.fontSize = HeadFontSize;
			textMeshProUGUI.fontStyle = HeadFontStyle;
			textMeshProUGUI.color = HeadForegroundColor;
			textMeshProUGUI.alignment = Alignment;
			if (column.LocalizedString != null)
			{
				textMeshProUGUI.gur(column.LocalizedString);
			}
			else
			{
				textMeshProUGUI.text = column.Label;
			}
		}
		nmm = (BodyRowHeight.HasValue ? ((int)Math.Floor(body.GetComponent<RectTransform>().rect.height / BodyRowHeight.Value)) : Rows.Count);
		nml = nml.gth(0, Math.Max(0, Rows.Count - nmm));
		int num = nml;
		foreach (vu item in Rows.Skip(nml).Take(nmm))
		{
			GameObject gameObject = new GameObject($"Row {num}");
			gameObject.transform.SetParent(body.transform);
			gameObject.transform.localScale = Vector3.one;
			gameObject.AddComponent<RectTransform>().pivot = new Vector2(0f, 1f);
			if (BodyRowHeight.HasValue)
			{
				LayoutElement layoutElement2 = gameObject.AddComponent<LayoutElement>();
				layoutElement2.preferredHeight = BodyRowHeight.Value;
				layoutElement2.flexibleHeight = 0f;
			}
			Image obj2 = gameObject.AddComponent<Image>();
			Color color;
			if (flag && num == nmk)
			{
				_ = SelectedRowBackgroundColor;
				color = SelectedRowBackgroundColor;
			}
			else
			{
				_ = BodyAlternativeBackgroundColor;
				color = (((num - nml) % 2 == 1) ? BodyAlternativeBackgroundColor : BodyBackgroundColor);
			}
			obj2.color = color;
			if (item.nmw != null)
			{
				item.nmw(gameObject, item, num, flag && num == nmk, this);
			}
			else
			{
				gameObject.AddComponent<HorizontalLayoutGroup>();
				foreach (TableColumn column2 in Columns)
				{
					GameObject gameObject2 = new GameObject(column2.Label ?? "");
					gameObject2.transform.SetParent(gameObject.transform);
					gameObject2.transform.localScale = Vector3.one;
					LayoutElement layoutElement3 = gameObject2.AddComponent<LayoutElement>();
					if (column2.Size.HasValue)
					{
						layoutElement3.minWidth = column2.Size.Value;
					}
					else
					{
						layoutElement3.preferredWidth = 10000f;
					}
					if (column2.Type == TableColumn.ColumnType.String || column2.Type == TableColumn.ColumnType.Int || column2.Type == TableColumn.ColumnType.Rank || (column2.Type == TableColumn.ColumnType.Gauge && item.nmq[column2.Field] is string))
					{
						TextMeshProUGUI textMeshProUGUI2 = gameObject2.AddComponent<TextMeshProUGUI>();
						textMeshProUGUI2.font = Font;
						textMeshProUGUI2.fontSize = item.nmu ?? BodyFontSize;
						textMeshProUGUI2.fontStyle = item.nmv ?? BodyFontStyle;
						textMeshProUGUI2.alignment = Alignment;
						textMeshProUGUI2.color = ((flag && num == nmk && SelectedRowForegroundColor.HasValue) ? SelectedRowForegroundColor.Value : (item.nmt ?? BodyForegroundColor));
						if (column2.Type == TableColumn.ColumnType.Rank)
						{
							textMeshProUGUI2.text = ((item.nmq[column2.Field] != null) ? $"#{item.nmq[column2.Field]}" : "");
						}
						else
						{
							textMeshProUGUI2.text = item.nmq[column2.Field]?.ToString();
						}
					}
					else if (column2.Type == TableColumn.ColumnType.Image)
					{
						gameObject2.AddComponent<Image>().sprite = item.nmq[column2.Field] as Sprite;
					}
					else if (column2.Type == TableColumn.ColumnType.Gauge)
					{
						if (item.nmq[column2.Field] != null)
						{
							GameObject gameObject3 = new GameObject("Gauge container");
							gameObject3.transform.SetParent(gameObject2.transform);
							gameObject3.transform.localScale = Vector3.one;
							RectTransform rectTransform = gameObject3.AddComponent<RectTransform>();
							rectTransform.anchorMin = new Vector2(0f, 0.5f);
							rectTransform.anchorMax = new Vector2(1f, 0.5f);
							rectTransform.offsetMin = new Vector2(20f, 0f);
							rectTransform.offsetMax = new Vector2(-20f, 0f);
							rectTransform.gum(BodyFontSize);
							gameObject3.AddComponent<Image>().color = new Color32(40, 40, 40, byte.MaxValue);
							GameObject obj3 = new GameObject("Gauge");
							obj3.transform.SetParent(gameObject3.transform);
							obj3.transform.localScale = Vector3.one;
							RectTransform rectTransform2 = obj3.AddComponent<RectTransform>();
							rectTransform2.anchorMin = new Vector2(0f, 0f);
							rectTransform2.anchorMax = new Vector2((float)item.nmq[column2.Field], 1f);
							rectTransform2.anchoredPosition = new Vector2(0f, 0f);
							rectTransform2.sizeDelta = new Vector2(0f, 0f);
							obj3.AddComponent<Image>().color = qh.mrj;
						}
					}
					else
					{
						column2.Render?.Invoke(gameObject2, item, num, flag && num == nmk, this);
					}
				}
			}
			num++;
		}
		if (DynamicHeight && BodyRowHeight.HasValue)
		{
			float num2 = (float)Rows.Count * BodyRowHeight.Value;
			GetComponent<RectTransform>().SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, ((!HeaderVisible) ? 0f : (HeadRowHeight ?? 80f)) + (MaxHeight.HasValue ? Math.Min(MaxHeight.Value, num2) : num2));
		}
	}

	public void hla(bool? a = null)
	{
		if (!a.HasValue)
		{
			a = EventSystem.current?.currentSelectedGameObject == base.gameObject;
		}
		for (int i = nml; i < nml + nmm && i - nml < body.transform.childCount; i++)
		{
			Image component = body.transform.GetChild(i - nml).gameObject.GetComponent<Image>();
			Color color;
			if (a.Value && i == nmk)
			{
				_ = SelectedRowBackgroundColor;
				color = SelectedRowBackgroundColor;
			}
			else
			{
				_ = BodyAlternativeBackgroundColor;
				color = (((i - nml) % 2 == 1) ? BodyAlternativeBackgroundColor : BodyBackgroundColor);
			}
			component.color = color;
		}
	}

	public void hlb(bool a = false)
	{
		if (nmk < nml || nmk > nml + nmm)
		{
			nml = (nmk - (int)Math.Floor((double)nmm / 2.0)).gth(0, Rows.Count - nmm);
			Refresh();
		}
		else if (a)
		{
			Refresh();
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnSelect(BaseEventData eventData)
	{
		base.OnSelect(eventData);
		hla(IsInteractable());
		this.nmp?.Invoke();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnDeselect(BaseEventData eventData)
	{
		base.OnDeselect(eventData);
		hla(false);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public override void OnMove(AxisEventData eventData)
	{
		AudioManager.PlayMenuChange();
		int num = nmk;
		if (NavigateOutAtEdges && eventData.moveDir == MoveDirection.Up && nmk <= 0 && FindSelectableOnUp() != null)
		{
			EventSystem.current.SetSelectedGameObject(FindSelectableOnUp().gameObject);
			return;
		}
		if (NavigateOutAtEdges && eventData.moveDir == MoveDirection.Down && nmk >= Rows.Count - 1 && FindSelectableOnDown() != null)
		{
			EventSystem.current.SetSelectedGameObject(FindSelectableOnDown().gameObject);
			return;
		}
		if (eventData.moveDir == MoveDirection.Up && nmk > 0)
		{
			nmk--;
			if (nml > nmk)
			{
				nml = nmk;
				Refresh();
			}
			else
			{
				hla();
			}
		}
		if (eventData.moveDir == MoveDirection.Down && nmk < Rows.Count - 1)
		{
			nmk++;
			if (nml + nmm - 1 < nmk)
			{
				nml = nmk - nmm + 1;
				Refresh();
			}
			else
			{
				hla();
			}
		}
		if (eventData.moveDir == MoveDirection.Left)
		{
			EventSystem.current.SetSelectedGameObject(FindSelectableOnLeft()?.gameObject);
		}
		if (eventData.moveDir == MoveDirection.Right)
		{
			EventSystem.current.SetSelectedGameObject(FindSelectableOnRight()?.gameObject);
		}
		if (num != nmk)
		{
			this.nmo?.Invoke(nmk);
		}
	}

	public void hlc(TextMeshProUGUI a, vu b, bool c = false)
	{
		a.font = Font;
		a.fontSize = b.nmu ?? BodyFontSize;
		a.fontStyle = b.nmv ?? BodyFontStyle;
		a.color = ((c && SelectedRowForegroundColor.HasValue) ? SelectedRowForegroundColor.Value : (b.nmt ?? BodyForegroundColor));
		a.alignment = Alignment;
	}

	[CompilerGenerated]
	private void hld()
	{
		hlb(a: true);
	}
}
