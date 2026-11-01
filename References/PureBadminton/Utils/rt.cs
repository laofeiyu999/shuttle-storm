using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class rt
{
	[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
	public class EmptyMonoBehavior : MonoBehaviour
	{
	}

	private static EmptyMonoBehavior myi;

	public static void gjl()
	{
		if (myi == null)
		{
			GameObject gameObject = new GameObject("StaticCoroutineGameObject");
			gameObject.AddComponent<EmptyMonoBehavior>();
			myi = gameObject.GetComponent<EmptyMonoBehavior>();
			Object.DontDestroyOnLoad(gameObject);
		}
	}

	public static Coroutine gjm(IEnumerator a)
	{
		if (myi == null)
		{
			gjl();
		}
		return myi.StartCoroutine(a);
	}
}
