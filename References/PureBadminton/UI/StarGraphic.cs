using System;
using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(CanvasRenderer))]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class StarGraphic : MaskableGraphic
{
	private const int nlw = 5;

	private const int nlx = 6;

	[Range(0.2f, 0.8f)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float InnerRatio = 0.45f;

	[Range(0f, 0.3f)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float TipRounding = 0.08f;

	[Range(0f, 0.3f)]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float InnerRounding = 0.05f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float EdgeSoftness = 1.2f;

	private readonly List<Vector2> nly = new List<Vector2>();

	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	protected override void OnPopulateMesh(VertexHelper vh)
	{
		vh.Clear();
		Rect pixelAdjustedRect = GetPixelAdjustedRect();
		Vector2 center = pixelAdjustedRect.center;
		float num = Mathf.Min(pixelAdjustedRect.width, pixelAdjustedRect.height) / 2f;
		if (num <= 0f)
		{
			return;
		}
		hjq(center, num);
		vh.AddVert(center, this.color, Vector2.zero);
		foreach (Vector2 item in nly)
		{
			vh.AddVert(item, this.color, Vector2.zero);
		}
		for (int i = 0; i < nly.Count; i++)
		{
			vh.AddTriangle(0, 1 + i, 1 + (i + 1) % nly.Count);
		}
		float num2 = EdgeSoftness / ((base.canvas != null) ? base.canvas.scaleFactor : 1f);
		Color color = this.color;
		color.a = 0f;
		int currentVertCount = vh.currentVertCount;
		for (int j = 0; j < nly.Count; j++)
		{
			Vector2 a = nly[(j - 1 + nly.Count) % nly.Count];
			Vector2 b = nly[(j + 1) % nly.Count];
			vh.AddVert(nly[j] + hjr(a, b) * num2, color, Vector2.zero);
		}
		for (int k = 0; k < nly.Count; k++)
		{
			int num3 = (k + 1) % nly.Count;
			vh.AddTriangle(1 + k, currentVertCount + k, currentVertCount + num3);
			vh.AddTriangle(1 + k, currentVertCount + num3, 1 + num3);
		}
	}

	private void hjq(Vector2 a, float b)
	{
		Vector2[] array = new Vector2[10];
		for (int i = 0; i < array.Length; i++)
		{
			float f = MathF.PI / 2f + (float)i * MathF.PI / 5f;
			float num = ((i % 2 == 0) ? b : (b * InnerRatio));
			array[i] = a + new Vector2(Mathf.Cos(f), Mathf.Sin(f)) * num;
		}
		nly.Clear();
		for (int j = 0; j < array.Length; j++)
		{
			Vector2 vector = array[j];
			Vector2 normalized = (array[(j - 1 + array.Length) % array.Length] - vector).normalized;
			Vector2 normalized2 = (array[(j + 1) % array.Length] - vector).normalized;
			float num2 = ((j % 2 == 0) ? TipRounding : InnerRounding) * b;
			float num3 = Vector2.Angle(normalized, normalized2) * (MathF.PI / 180f) / 2f;
			if (num2 <= 0f || num3 <= 0f)
			{
				nly.Add(vector);
				continue;
			}
			Vector2 vector2 = vector + (normalized + normalized2).normalized * (num2 / Mathf.Sin(num3));
			Vector2 vector3 = vector + normalized * (num2 / Mathf.Tan(num3));
			Vector2 vector4 = vector + normalized2 * (num2 / Mathf.Tan(num3));
			float num4 = Mathf.Atan2(vector3.y - vector2.y, vector3.x - vector2.x);
			float num5 = Mathf.DeltaAngle(num4 * 57.29578f, Mathf.Atan2(vector4.y - vector2.y, vector4.x - vector2.x) * 57.29578f) * (MathF.PI / 180f);
			for (int k = 0; k <= 6; k++)
			{
				float f2 = num4 + num5 * (float)k / 6f;
				nly.Add(vector2 + new Vector2(Mathf.Cos(f2), Mathf.Sin(f2)) * num2);
			}
		}
	}

	private static Vector2 hjr(Vector2 a, Vector2 b)
	{
		Vector2 normalized = (b - a).normalized;
		return new Vector2(normalized.y, 0f - normalized.x);
	}
}
