using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;

[RequireComponent(typeof(TextMeshProUGUI))]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TextMeshProWithButtonIndication : MonoBehaviour
{
	private TextMeshProUGUI myr;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		myr = GetComponent<TextMeshProUGUI>();
		if (myr.textPreprocessor == null)
		{
			myr.textPreprocessor = new rz();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		InputSystem.onDeviceChange += gjs;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		InputSystem.onDeviceChange -= gjs;
	}

	private void gjs(InputDevice a, InputDeviceChange b)
	{
		myr.ForceMeshUpdate();
	}
}
