using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMP_UiFrameRateCounter : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum FpsCounterAnchorPositions
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TopLeft,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		BottomLeft,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TopRight,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		BottomRight
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float UpdateInterval = 5f;

	private float kdj;

	private int kdk;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public FpsCounterAnchorPositions AnchorPosition = FpsCounterAnchorPositions.TopRight;

	private string kdl;

	private const string kdm = "{0:2}</color> <#8080ff>FPS \n<#FF8000>{1:2} <#8080ff>MS";

	private TextMeshProUGUI kdn;

	private RectTransform kdo;

	private FpsCounterAnchorPositions kdp;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (base.enabled)
		{
			Application.targetFrameRate = 1000;
			GameObject gameObject = new GameObject("Frame Counter");
			kdo = gameObject.AddComponent<RectTransform>();
			kdo.SetParent(base.transform, worldPositionStays: false);
			kdn = gameObject.AddComponent<TextMeshProUGUI>();
			kdn.font = Resources.Load<TMP_FontAsset>("Fonts & Materials/LiberationSans SDF");
			kdn.fontSharedMaterial = Resources.Load<Material>("Fonts & Materials/LiberationSans SDF - Overlay");
			kdn.textWrappingMode = TextWrappingModes.NoWrap;
			kdn.fontSize = 36f;
			kdn.isOverlay = true;
			bib(AnchorPosition);
			kdp = AnchorPosition;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		kdj = Time.realtimeSinceStartup;
		kdk = 0;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (AnchorPosition != kdp)
		{
			bib(AnchorPosition);
		}
		kdp = AnchorPosition;
		kdk++;
		float realtimeSinceStartup = Time.realtimeSinceStartup;
		if (realtimeSinceStartup > kdj + UpdateInterval)
		{
			float num = (float)kdk / (realtimeSinceStartup - kdj);
			float arg = 1000f / Mathf.Max(num, 1E-05f);
			if (num < 30f)
			{
				kdl = "<color=yellow>";
			}
			else if (num < 10f)
			{
				kdl = "<color=red>";
			}
			else
			{
				kdl = "<color=green>";
			}
			kdn.SetText(kdl + "{0:2}</color> <#8080ff>FPS \n<#FF8000>{1:2} <#8080ff>MS", num, arg);
			kdk = 0;
			kdj = realtimeSinceStartup;
		}
	}

	private void bib(FpsCounterAnchorPositions a)
	{
		switch (a)
		{
		case FpsCounterAnchorPositions.TopLeft:
			kdn.alignment = TextAlignmentOptions.TopLeft;
			kdo.pivot = new Vector2(0f, 1f);
			kdo.anchorMin = new Vector2(0.01f, 0.99f);
			kdo.anchorMax = new Vector2(0.01f, 0.99f);
			kdo.anchoredPosition = new Vector2(0f, 1f);
			break;
		case FpsCounterAnchorPositions.BottomLeft:
			kdn.alignment = TextAlignmentOptions.BottomLeft;
			kdo.pivot = new Vector2(0f, 0f);
			kdo.anchorMin = new Vector2(0.01f, 0.01f);
			kdo.anchorMax = new Vector2(0.01f, 0.01f);
			kdo.anchoredPosition = new Vector2(0f, 0f);
			break;
		case FpsCounterAnchorPositions.TopRight:
			kdn.alignment = TextAlignmentOptions.TopRight;
			kdo.pivot = new Vector2(1f, 1f);
			kdo.anchorMin = new Vector2(0.99f, 0.99f);
			kdo.anchorMax = new Vector2(0.99f, 0.99f);
			kdo.anchoredPosition = new Vector2(1f, 1f);
			break;
		case FpsCounterAnchorPositions.BottomRight:
			kdn.alignment = TextAlignmentOptions.BottomRight;
			kdo.pivot = new Vector2(1f, 0f);
			kdo.anchorMin = new Vector2(0.99f, 0.01f);
			kdo.anchorMax = new Vector2(0.99f, 0.01f);
			kdo.anchoredPosition = new Vector2(1f, 0f);
			break;
		}
	}
}
