using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.TextCore.LowLevel;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class Benchmark03 : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum BenchmarkType
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TMP_SDF_MOBILE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TMP_SDF__MOBILE_SSD,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TMP_SDF,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TMP_BITMAP_MOBILE,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		TEXTMESH_BITMAP
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int NumberOfSamples = 100;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public BenchmarkType Benchmark;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Font SourceFont;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		TMP_FontAsset tMP_FontAsset = null;
		switch (Benchmark)
		{
		case BenchmarkType.TMP_SDF_MOBILE:
			tMP_FontAsset = TMP_FontAsset.CreateFontAsset(SourceFont, 90, 9, GlyphRenderMode.SDFAA, 256, 256);
			break;
		case BenchmarkType.TMP_SDF__MOBILE_SSD:
			tMP_FontAsset = TMP_FontAsset.CreateFontAsset(SourceFont, 90, 9, GlyphRenderMode.SDFAA, 256, 256);
			tMP_FontAsset.material.shader = Shader.Find("TextMeshPro/Mobile/Distance Field SSD");
			break;
		case BenchmarkType.TMP_SDF:
			tMP_FontAsset = TMP_FontAsset.CreateFontAsset(SourceFont, 90, 9, GlyphRenderMode.SDFAA, 256, 256);
			tMP_FontAsset.material.shader = Shader.Find("TextMeshPro/Distance Field");
			break;
		case BenchmarkType.TMP_BITMAP_MOBILE:
			tMP_FontAsset = TMP_FontAsset.CreateFontAsset(SourceFont, 90, 9, GlyphRenderMode.SMOOTH, 256, 256);
			break;
		}
		for (int i = 0; i < NumberOfSamples; i++)
		{
			switch (Benchmark)
			{
			case BenchmarkType.TMP_SDF_MOBILE:
			case BenchmarkType.TMP_SDF__MOBILE_SSD:
			case BenchmarkType.TMP_SDF:
			case BenchmarkType.TMP_BITMAP_MOBILE:
			{
				GameObject obj2 = new GameObject();
				obj2.transform.position = new Vector3(0f, 1.2f, 0f);
				TextMeshPro textMeshPro = obj2.AddComponent<TextMeshPro>();
				textMeshPro.font = tMP_FontAsset;
				textMeshPro.fontSize = 128f;
				textMeshPro.text = "@";
				textMeshPro.alignment = TextAlignmentOptions.Center;
				textMeshPro.color = new Color32(byte.MaxValue, byte.MaxValue, 0, byte.MaxValue);
				if (Benchmark == BenchmarkType.TMP_BITMAP_MOBILE)
				{
					textMeshPro.fontSize = 132f;
				}
				break;
			}
			case BenchmarkType.TEXTMESH_BITMAP:
			{
				GameObject obj = new GameObject();
				obj.transform.position = new Vector3(0f, 1.2f, 0f);
				TextMesh textMesh = obj.AddComponent<TextMesh>();
				textMesh.GetComponent<Renderer>().sharedMaterial = SourceFont.material;
				textMesh.font = SourceFont;
				textMesh.anchor = TextAnchor.MiddleCenter;
				textMesh.fontSize = 130;
				textMesh.color = new Color32(byte.MaxValue, byte.MaxValue, 0, byte.MaxValue);
				textMesh.text = "@";
				break;
			}
			}
		}
	}
}
