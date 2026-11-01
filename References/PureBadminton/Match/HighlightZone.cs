using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class HighlightZone : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject Base;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject Borders;

	public static HighlightZone peg => Resources.Load<HighlightZone>("Prefabs/HighlightSquare");

	public static HighlightZone peh => Resources.Load<HighlightZone>("Prefabs/HighlightCircle");

	public void ece(float a)
	{
		StartCoroutine(ecf(a));
	}

	public IEnumerator ecf(float a)
	{
		MeshRenderer component = Base.GetComponent<MeshRenderer>();
		MeshRenderer component2 = Borders.GetComponent<MeshRenderer>();
		Material material2 = (component.material = Object.Instantiate(component.material));
		Material material3 = material2;
		material2 = (component2.material = Object.Instantiate(component2.material));
		Material material5 = material2;
		Color color = material3.color;
		Vector4 vector = material5.GetVector("_Color");
		for (int num = 10; num >= 0; num--)
		{
			yield return new WaitForSeconds(a / 10f);
			material3.color = new Color(color.r, color.g, color.b, color.a * (float)num / 10f);
			material5.SetVector("_Color", new Vector4(vector.x, vector.y, vector.z, vector.w * (float)num / 10f));
		}
	}
}
