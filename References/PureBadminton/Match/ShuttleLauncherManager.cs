using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ShuttleLauncherManager : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject Launcher;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject Column;

	public static ShuttleLauncherManager phw => Resources.Load<ShuttleLauncherManager>("ShuttleLauncher");

	public void fed(float a)
	{
		Launcher.transform.gty(a);
		Column.transform.localScale = new Vector3(Column.transform.localScale.x, Column.transform.localScale.y, (a - 0.65f) * 55f);
	}

	public Vector3 fee()
	{
		return Launcher.transform.position + base.transform.rotation * new Vector3(0f, 0f, -0.3f);
	}
}
