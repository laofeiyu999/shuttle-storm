using System;
using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterMatchEmotions : CharacterComponent
{
	private float lhx = -90f;

	private float lhy = -90f;

	public void dnt()
	{
		GetComponent<CharacterBlendShapeCustomization>().frb(new Dictionary<string, int>
		{
			{ "Brow_Raise_Outer_L", 35 },
			{ "Brow_Raise_Outer_R", 35 },
			{ "Brow_Drop_L", 30 },
			{ "Brow_Drop_R", 30 },
			{ "Nose_Sneer_L", 25 },
			{ "Nose_Sneer_R", 25 },
			{ "Cheek_Raise_L", 50 },
			{ "Cheek_Raise_R", 50 },
			{ "Mouth_Frown_L", 10 },
			{ "Mouth_Frown_R", 10 },
			{ "Mouth_Shrug_Upper", 10 },
			{ "Mouth_Shrug_Lower", 15 },
			{ "Mouth_Dimple_L", -60 },
			{ "Mouth_Dimple_R", -60 },
			{ "Jaw_Open", 10 }
		});
		lhx = -94f;
	}

	public void dnu()
	{
		GetComponent<CharacterBlendShapeCustomization>().frb(new Dictionary<string, int>
		{
			{ "Brow_Raise_Outer_L", 30 },
			{ "Brow_Raise_Outer_R", 30 },
			{ "Brow_Drop_L", 75 },
			{ "Brow_Drop_R", 75 },
			{ "Eye_Wide_L", 30 },
			{ "Eye_Wide_R", 30 },
			{ "Nose_Sneer_L", 20 },
			{ "Nose_Sneer_R", 20 },
			{ "Cheek_Raise_L", 50 },
			{ "Cheek_Raise_R", 50 },
			{ "Mouth_Shrug_Upper", -5 },
			{ "Mouth_Shrug_Lower", -15 },
			{ "Mouth_Dimple_L", -80 },
			{ "Mouth_Dimple_R", -80 },
			{ "Jaw_Open", 35 }
		});
		lhx = -100f;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void LateUpdate()
	{
		float num = Mathf.DeltaAngle(lhy, lhx);
		float num2 = Time.deltaTime * 30f;
		float num3 = lhy;
		num3 = ((!(Math.Abs(num) > num2 * 2f)) ? lhx : (lhy + num.gtg(0f - num2, num2)));
		base.ozh.GetBoneTransform(HumanBodyBones.Jaw).localEulerAngles = new Vector3(0f, 0f, num3);
		lhy = num3;
	}
}
