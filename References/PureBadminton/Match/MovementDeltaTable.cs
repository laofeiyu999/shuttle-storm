using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[CreateAssetMenu(menuName = "Pure Badminton/Movement Delta Table")]
[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class MovementDeltaTable : ScriptableObject
{
	[Serializable]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class AnimationEntry
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public string animationName;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public float clipLength;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public float orientationOffsetY;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public AnimationCurve cumulativeDeltaX;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public AnimationCurve cumulativeDeltaZ;
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ig
	{
		public string lkc;

		internal bool dud(AnimationEntry a)
		{
			return a.animationName == lkc;
		}
	}

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float ReferenceHeight = 1.8f;

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<AnimationEntry> entries = new List<AnimationEntry>();

	public AnimationEntry due(string a)
	{
		return entries.Find((AnimationEntry a) => a.animationName == a);
	}

	public Vector3 duf(string a, float b, float c, float d)
	{
		AnimationEntry animationEntry = due(a);
		if (animationEntry == null)
		{
			return Vector3.zero;
		}
		float num = d / 1.8f;
		float x;
		float num2;
		if (c <= 1f)
		{
			x = animationEntry.cumulativeDeltaX.Evaluate(c) - animationEntry.cumulativeDeltaX.Evaluate(b);
			num2 = animationEntry.cumulativeDeltaZ.Evaluate(c) - animationEntry.cumulativeDeltaZ.Evaluate(b);
		}
		else
		{
			float time = c - 1f;
			x = animationEntry.cumulativeDeltaX.Evaluate(1f) - animationEntry.cumulativeDeltaX.Evaluate(b) + (animationEntry.cumulativeDeltaX.Evaluate(time) - animationEntry.cumulativeDeltaX.Evaluate(0f));
			num2 = animationEntry.cumulativeDeltaZ.Evaluate(1f) - animationEntry.cumulativeDeltaZ.Evaluate(b) + (animationEntry.cumulativeDeltaZ.Evaluate(time) - animationEntry.cumulativeDeltaZ.Evaluate(0f));
		}
		return Quaternion.Euler(0f, 0f - animationEntry.orientationOffsetY, 0f) * new Vector3(x, 0f, num2) * num;
	}
}
