using System;
using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CustomGridLayout : LayoutGroup
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Vector2 CellSize;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int MinSpacing;

	public int nig { get; private set; }

	public int nih { get; private set; }

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		StartCoroutine(hch());
	}

	public IEnumerator hch()
	{
		yield return new WaitForEndOfFrame();
		CalculateLayoutInputHorizontal();
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void CalculateLayoutInputHorizontal()
	{
		base.CalculateLayoutInputHorizontal();
		float width = base.rectTransform.rect.width;
		_ = base.rectTransform.rect.height;
		nih = Mathf.FloorToInt((width - (float)MinSpacing) / (CellSize.x + (float)MinSpacing));
		nig = Mathf.CeilToInt((float)base.transform.childCount / (float)nih);
		int num = 0;
		int num2 = 0;
		float num3 = (width - CellSize.x * (float)nih) / (float)(nih + 1);
		for (int i = 0; i < base.rectChildren.Count; i++)
		{
			num2 = i / nih;
			num = i % nih;
			RectTransform rect = base.rectChildren[i];
			float pos = num3 + (CellSize.x + num3) * (float)num;
			float pos2 = num3 + (CellSize.y + num3) * (float)num2;
			SetChildAlongAxis(rect, 0, pos, CellSize.x);
			SetChildAlongAxis(rect, 1, pos2, CellSize.y);
		}
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void CalculateLayoutInputVertical()
	{
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void SetLayoutHorizontal()
	{
	}

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void SetLayoutVertical()
	{
	}

	public int hci(int a, MoveDirection b)
	{
		var (num, num2) = hck(a);
		switch (b)
		{
		case MoveDirection.Left:
			if (num2 != 0)
			{
				return a - 1;
			}
			return Math.Min(a + nih - 1, base.transform.childCount - 1);
		case MoveDirection.Right:
			if (num2 != nih - 1 && a < base.transform.childCount - 1)
			{
				return a + 1;
			}
			return Math.Max(0, a - nih + 1);
		case MoveDirection.Up:
			if (num != 0)
			{
				return a - nih;
			}
			if (base.transform.childCount <= hcj(nig - 1, num2))
			{
				return hcj(nig - 2, num2);
			}
			return hcj(nig - 1, num2);
		case MoveDirection.Down:
			if (a + nih < base.transform.childCount)
			{
				return a + nih;
			}
			return hcj(0, num2);
		default:
			return 0;
		}
	}

	public int hcj(int a, int b)
	{
		return a * nih + b;
	}

	public (int, int) hck(int a)
	{
		return (Mathf.FloorToInt(a / nih), a % nih);
	}
}
