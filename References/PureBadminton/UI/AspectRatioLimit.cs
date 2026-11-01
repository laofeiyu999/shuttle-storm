using OPS.Obfuscator.Attribute;
using UnityEngine;

[RequireComponent(typeof(RectTransform))]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class AspectRatioLimit : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float targetAspect = 1.7777778f;

	private RectTransform nfz;

	private Canvas nga;

	private float ngb = -1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		nfz = GetComponent<RectTransform>();
		nga = GetComponentInParent<Canvas>();
		gxx();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnRectTransformDimensionsChange()
	{
		if (nga != null && nfz != null)
		{
			gxx();
		}
	}

	private void gxx()
	{
		if ((float)Screen.width / (float)Screen.height > targetAspect)
		{
			float num = (float)Screen.height * targetAspect;
			float num2 = ((float)Screen.width - num) / 2f;
			float scaleFactor = nga.scaleFactor;
			float num3 = num2 / scaleFactor;
			if (Mathf.Abs(num3 - ngb) > 0.5f)
			{
				ngb = num3;
				nfz.anchorMin = new Vector2(0f, 0f);
				nfz.anchorMax = new Vector2(1f, 1f);
				nfz.offsetMin = new Vector2(num3, 0f);
				nfz.offsetMax = new Vector2(0f - num3, 0f);
			}
		}
		else if (ngb != 0f)
		{
			ngb = 0f;
			nfz.anchorMin = new Vector2(0f, 0f);
			nfz.anchorMax = new Vector2(1f, 1f);
			nfz.offsetMin = Vector2.zero;
			nfz.offsetMax = Vector2.zero;
		}
	}
}
