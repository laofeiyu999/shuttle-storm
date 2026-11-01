using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMP_FrameRateCounter : MonoBehaviour
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

	private float kch;

	private int kci;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public FpsCounterAnchorPositions AnchorPosition = FpsCounterAnchorPositions.TopRight;

	private string kcj;

	private const string kck = "{0:2}</color> <#8080ff>FPS \n<#FF8000>{1:2} <#8080ff>MS";

	private TextMeshPro kcl;

	private Transform kcm;

	private Camera kcn;

	private FpsCounterAnchorPositions kco;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (base.enabled)
		{
			kcn = Camera.main;
			Application.targetFrameRate = 9999;
			GameObject gameObject = new GameObject("Frame Counter");
			kcl = gameObject.AddComponent<TextMeshPro>();
			kcl.font = Resources.Load<TMP_FontAsset>("Fonts & Materials/LiberationSans SDF");
			kcl.fontSharedMaterial = Resources.Load<Material>("Fonts & Materials/LiberationSans SDF - Overlay");
			kcm = gameObject.transform;
			kcm.SetParent(kcn.transform);
			kcm.localRotation = Quaternion.identity;
			kcl.textWrappingMode = TextWrappingModes.NoWrap;
			kcl.fontSize = 24f;
			bht(AnchorPosition);
			kco = AnchorPosition;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		kch = Time.realtimeSinceStartup;
		kci = 0;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (AnchorPosition != kco)
		{
			bht(AnchorPosition);
		}
		kco = AnchorPosition;
		kci++;
		float realtimeSinceStartup = Time.realtimeSinceStartup;
		if (realtimeSinceStartup > kch + UpdateInterval)
		{
			float num = (float)kci / (realtimeSinceStartup - kch);
			float arg = 1000f / Mathf.Max(num, 1E-05f);
			if (num < 30f)
			{
				kcj = "<color=yellow>";
			}
			else if (num < 10f)
			{
				kcj = "<color=red>";
			}
			else
			{
				kcj = "<color=green>";
			}
			kcl.SetText(kcj + "{0:2}</color> <#8080ff>FPS \n<#FF8000>{1:2} <#8080ff>MS", num, arg);
			kci = 0;
			kch = realtimeSinceStartup;
		}
	}

	private void bht(FpsCounterAnchorPositions a)
	{
		kcl.margin = new Vector4(1f, 1f, 1f, 1f);
		switch (a)
		{
		case FpsCounterAnchorPositions.TopLeft:
			kcl.alignment = TextAlignmentOptions.TopLeft;
			kcl.rectTransform.pivot = new Vector2(0f, 1f);
			kcm.position = kcn.ViewportToWorldPoint(new Vector3(0f, 1f, 100f));
			break;
		case FpsCounterAnchorPositions.BottomLeft:
			kcl.alignment = TextAlignmentOptions.BottomLeft;
			kcl.rectTransform.pivot = new Vector2(0f, 0f);
			kcm.position = kcn.ViewportToWorldPoint(new Vector3(0f, 0f, 100f));
			break;
		case FpsCounterAnchorPositions.TopRight:
			kcl.alignment = TextAlignmentOptions.TopRight;
			kcl.rectTransform.pivot = new Vector2(1f, 1f);
			kcm.position = kcn.ViewportToWorldPoint(new Vector3(1f, 1f, 100f));
			break;
		case FpsCounterAnchorPositions.BottomRight:
			kcl.alignment = TextAlignmentOptions.BottomRight;
			kcl.rectTransform.pivot = new Vector2(1f, 0f);
			kcm.position = kcn.ViewportToWorldPoint(new Vector3(1f, 0f, 100f));
			break;
		}
	}
}
