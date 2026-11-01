using System;
using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[CreateAssetMenu(fileName = "TrajectoryTable", menuName = "Pure Badminton/TrajectoryTable", order = 100)]
[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class ShuttleTrajectoryTable : ScriptableObject
{
	[Serializable]
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
	public class Entry
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public AnimationCurve yOverX = new AnimationCurve();

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public float ux;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
		public float uy;

		[NonSerialized]
		private float[] mfa;

		[NonSerialized]
		private float[] mfb;

		public void fad()
		{
			if (mfa == null)
			{
				Keyframe[] keys = yOverX.keys;
				mfa = new float[keys.Length];
				mfb = new float[keys.Length];
				for (int i = 0; i < keys.Length; i++)
				{
					mfa[i] = keys[i].time;
					mfb[i] = keys[i].value;
				}
			}
		}

		public float? fae(float a)
		{
			fad();
			float[] array = mfa;
			float[] array2 = mfb;
			for (int num = array2.Length - 1; num >= 0; num--)
			{
				if (array2[num] >= a)
				{
					if (num == array2.Length - 1 || array2[num] == a)
					{
						return array[num];
					}
					return Mathf.Lerp(array[num], array[num + 1], (array2[num] - a) / (array2[num] - array2[num + 1]));
				}
			}
			return null;
		}
	}

	[Header("Grid parameters")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float[] uxValues = new float[52]
	{
		0.5f, 1f, 1.5f, 2f, 2.5f, 3f, 3.5f, 4f, 5f, 6f,
		7f, 8f, 9f, 10f, 11f, 12f, 13f, 14f, 15f, 16f,
		17f, 18f, 19f, 20f, 22f, 24f, 26f, 28f, 30f, 33f,
		36f, 40f, 45f, 50f, 55f, 60f, 65f, 70f, 75f, 80f,
		85f, 90f, 95f, 100f, 105f, 110f, 115f, 120f, 125f, 130f,
		135f, 140f
	};

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float[] uyValues = new float[54]
	{
		-60f, -55f, -50f, -45f, -40f, -35f, -30f, -25f, -20f, -18f,
		-16f, -14f, -12f, -10f, -8f, -6f, -4f, -3f, -2f, -1f,
		-0.5f, -0.2f, 0f, 0.2f, 0.4f, 0.6f, 0.8f, 1f, 1.5f, 2f,
		2.5f, 3f, 3.5f, 4f, 4.5f, 5f, 5.5f, 6f, 6.5f, 7f,
		8f, 9f, 10f, 11f, 12f, 13f, 14f, 15f, 16f, 17f,
		18f, 19f, 20f, 22f
	};

	[Header("Spatial parameters")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float maxX = 16f;

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float maxY = 8f;

	[Tooltip("Maximum possible height (m) at which the shuttle can be hit in the game. Used to decide when a trajectory 'lands' relative to a launch at y=0.")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float maxHitHeight = 4f;

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float timeSampleResolution = 0.02f;

	[Header("Physics parameters used for generation (informational)")]
	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float mass = 0.005f;

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float dragK = 0.0008575f;

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Vector3 gravity = new Vector3(0f, -9.81f, 0f);

	[NotObfuscatedCause("Is in ScriptableObject and this ScriptableObject gets not obfuscated: Obfuscator Free is used.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public List<Entry> entries = new List<Entry>();

	public int pha => uxValues.Length;

	public void fag()
	{
		for (int i = 0; i < entries.Count; i++)
		{
			entries[i].fad();
		}
	}

	public int fah(int a, int b)
	{
		return b * uxValues.Length + a;
	}

	public int fai(float a)
	{
		return fak(uxValues, a);
	}

	public int faj(float a)
	{
		return fak(uyValues, a);
	}

	private int fak(float[] a, float b)
	{
		int num = 0;
		for (int i = 1; i < a.Length; i++)
		{
			if (Math.Abs(a[i] - b) <= Math.Abs(a[num] - b))
			{
				num = i;
			}
		}
		return num;
	}
}
