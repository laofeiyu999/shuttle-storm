using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class NavigationSound : MonoBehaviour, ISelectHandler, IEventSystemHandler
{
	[NotObfuscatedCause("Method is in group that has external definition (is in some assembly that gets not obfuscated).")]
	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public void OnSelect(BaseEventData eventData)
	{
		AudioManager.PlayMenuChange();
	}
}
