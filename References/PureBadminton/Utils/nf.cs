using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public static class nf
{
	public static void fib()
	{
		fic(Screen.height);
	}

	public static void fic(int a)
	{
		if (GraphicsSettings.currentRenderPipeline is UniversalRenderPipelineAsset universalRenderPipelineAsset)
		{
			switch (QualitySettings.GetQualityLevel())
			{
			case 0:
				universalRenderPipelineAsset.renderScale = Mathf.Clamp(720f / (float)a, 0.6f, 1f);
				break;
			case 1:
				universalRenderPipelineAsset.renderScale = Mathf.Clamp(900f / (float)a, 0.7f, 1f);
				break;
			default:
				return;
			}
			universalRenderPipelineAsset.upscalingFilter = ((universalRenderPipelineAsset.renderScale < 1f) ? UpscalingFilterSelection.FSR : UpscalingFilterSelection.Auto);
		}
	}
}
