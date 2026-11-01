using System;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class sa
{
	public static RenderTexture gjw(Action<TextMeshPro> a, float b = 1f, int c = 512, int d = 512)
	{
		GameObject gameObject = new GameObject("Texture generation (temporary)");
		gameObject.transform.position = new Vector3(100 + UnityEngine.Random.Range(0, 1000) * 2, 100f, 100f);
		GameObject gameObject2 = new GameObject("Text");
		TextMeshPro obj = gameObject2.AddComponent<TextMeshPro>();
		a(obj);
		RectTransform component = gameObject2.GetComponent<RectTransform>();
		component.SetParent(gameObject.transform);
		component.anchoredPosition = new Vector2(0.5f, 0f);
		component.localPosition = Vector3.zero;
		component.localRotation = Quaternion.identity;
		component.sizeDelta = new Vector2(3f, 1f);
		GameObject gameObject3 = new GameObject("Camera");
		gameObject3.transform.parent = gameObject.transform;
		gameObject3.transform.localPosition = new Vector3(0f, 0f, -2f);
		gameObject3.transform.rotation = Quaternion.identity;
		Camera camera = gameObject3.AddComponent<Camera>();
		camera.orthographic = true;
		camera.orthographicSize = 1f / b;
		camera.clearFlags = CameraClearFlags.Color;
		RenderTexture renderTexture = new RenderTexture(c, d, 32);
		renderTexture.antiAliasing = 1;
		renderTexture.Create();
		camera.targetTexture = renderTexture;
		camera.Render();
		gameObject.SetActive(value: false);
		camera.targetTexture = null;
		UnityEngine.Object.Destroy(gameObject);
		return renderTexture;
	}
}
