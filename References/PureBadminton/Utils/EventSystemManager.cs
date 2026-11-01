using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class EventSystemManager : MonoBehaviour
{
	private EventSystem mqw;

	private GameObject mqx;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (mqw == null)
		{
			mqw = base.gameObject.GetComponent<EventSystem>();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (mqw.currentSelectedGameObject == null)
		{
			mqw.SetSelectedGameObject(mqx);
		}
		else
		{
			mqx = mqw.currentSelectedGameObject;
		}
	}
}
