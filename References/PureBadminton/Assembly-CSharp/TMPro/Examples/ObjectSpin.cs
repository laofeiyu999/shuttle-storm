using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ObjectSpin : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum MotionType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Rotation,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SearchLight,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Translation
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MotionType Motion;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Vector3 TranslationDistance = new Vector3(5f, 0f, 0f);

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float TranslationSpeed = 1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float SpinSpeed = 5f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int RotationRange = 15;

	private Transform kbj;

	private float kbk;

	private Vector3 kbl;

	private Vector3 kbm;

	private Vector3 kbn;

	private Color32 kbo;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kbj = base.transform;
		kbm = kbj.rotation.eulerAngles;
		kbn = kbj.position;
		Light component = GetComponent<Light>();
		kbo = ((component != null) ? component.color : Color.black);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		switch (Motion)
		{
		case MotionType.Rotation:
			kbj.Rotate(0f, SpinSpeed * Time.deltaTime, 0f);
			break;
		case MotionType.SearchLight:
			kbk += SpinSpeed * Time.deltaTime;
			kbj.rotation = Quaternion.Euler(kbm.x, Mathf.Sin(kbk) * (float)RotationRange + kbm.y, kbm.z);
			break;
		case MotionType.Translation:
		{
			kbk += TranslationSpeed * Time.deltaTime;
			float x = TranslationDistance.x * Mathf.Cos(kbk);
			float z = TranslationDistance.y * Mathf.Sin(kbk) * Mathf.Cos(kbk * 1f);
			float y = TranslationDistance.z * Mathf.Sin(kbk);
			kbj.position = kbn + new Vector3(x, y, z);
			kbl = kbj.position;
			break;
		}
		}
	}
}
