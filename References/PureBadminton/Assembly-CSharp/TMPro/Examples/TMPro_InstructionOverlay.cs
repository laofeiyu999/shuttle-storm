using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TMPro_InstructionOverlay : MonoBehaviour
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
	public FpsCounterAnchorPositions AnchorPosition = FpsCounterAnchorPositions.BottomLeft;

	private const string kdq = "Camera Control - <#ffff00>Shift + RMB\n</color>Zoom - <#ffff00>Mouse wheel.";

	private TextMeshPro kdr;

	private TextContainer kds;

	private Transform kdt;

	private Camera kdu;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (base.enabled)
		{
			kdu = Camera.main;
			GameObject gameObject = new GameObject("Frame Counter");
			kdt = gameObject.transform;
			kdt.parent = kdu.transform;
			kdt.localRotation = Quaternion.identity;
			kdr = gameObject.AddComponent<TextMeshPro>();
			kdr.font = Resources.Load<TMP_FontAsset>("Fonts & Materials/LiberationSans SDF");
			kdr.fontSharedMaterial = Resources.Load<Material>("Fonts & Materials/LiberationSans SDF - Overlay");
			kdr.fontSize = 30f;
			kdr.isOverlay = true;
			kds = gameObject.GetComponent<TextContainer>();
			bic(AnchorPosition);
			kdr.text = "Camera Control - <#ffff00>Shift + RMB\n</color>Zoom - <#ffff00>Mouse wheel.";
		}
	}

	private void bic(FpsCounterAnchorPositions a)
	{
		switch (a)
		{
		case FpsCounterAnchorPositions.TopLeft:
			kds.anchorPosition = TextContainerAnchors.TopLeft;
			kdt.position = kdu.ViewportToWorldPoint(new Vector3(0f, 1f, 100f));
			break;
		case FpsCounterAnchorPositions.BottomLeft:
			kds.anchorPosition = TextContainerAnchors.BottomLeft;
			kdt.position = kdu.ViewportToWorldPoint(new Vector3(0f, 0f, 100f));
			break;
		case FpsCounterAnchorPositions.TopRight:
			kds.anchorPosition = TextContainerAnchors.TopRight;
			kdt.position = kdu.ViewportToWorldPoint(new Vector3(1f, 1f, 100f));
			break;
		case FpsCounterAnchorPositions.BottomRight:
			kds.anchorPosition = TextContainerAnchors.BottomRight;
			kdt.position = kdu.ViewportToWorldPoint(new Vector3(1f, 0f, 100f));
			break;
		}
	}
}
