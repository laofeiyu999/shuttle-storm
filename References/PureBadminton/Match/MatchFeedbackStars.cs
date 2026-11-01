using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Serialization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchFeedbackStars : Selectable
{
	private const float lul = 0.2f;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private StarGraphic[] fills;

	[SerializeField]
	[FormerlySerializedAs("outlines")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private StarGraphic[] backgrounds;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Color fillColor = new Color(1f, 0.78f, 0.2f, 1f);

	[SerializeField]
	[FormerlySerializedAs("outlineColor")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Color emptyColor = new Color(1f, 1f, 1f, 4f / 51f);

	public bbx lum { get; private set; } = new bbx();


	public event Action lun;

	public event Action luo;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		Refresh();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public override void OnMove(AxisEventData eventData)
	{
		int num = ((eventData.moveDir == MoveDirection.Left) ? (-1) : ((eventData.moveDir == MoveDirection.Right) ? 1 : 0));
		if (num != 0)
		{
			AudioManager.PlayMenuChange();
			lum.Move(num);
			Refresh();
			this.lun?.Invoke();
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void OnPointerDown(PointerEventData eventData)
	{
		base.OnPointerDown(eventData);
		int num = ejk(eventData);
		if (num >= 0)
		{
			lum.inc(num + 1);
			Refresh();
			this.lun?.Invoke();
			this.luo?.Invoke();
		}
	}

	private int ejk(PointerEventData a)
	{
		for (int i = 0; i < backgrounds.Length; i++)
		{
			if (RectTransformUtility.RectangleContainsScreenPoint(backgrounds[i].rectTransform, a.position, a.pressEventCamera))
			{
				return i;
			}
		}
		return -1;
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Refresh()
	{
		if (fills != null && backgrounds != null)
		{
			for (int i = 0; i < fills.Length; i++)
			{
				fills[i].gameObject.SetActive(i < lum.nyu);
				backgrounds[i].color = emptyColor;
			}
			Color color = fillColor;
			color.a = fillColor.a * (lum.nyv ? 1f : 0.2f);
			StarGraphic[] array = fills;
			for (int j = 0; j < array.Length; j++)
			{
				array[j].color = color;
			}
		}
	}
}
