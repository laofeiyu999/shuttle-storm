using System;
using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
public class jc
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class jb
	{
		public int loo;

		internal float edd(float a, float b)
		{
			return a + (b - a) * (float)(5 - loo) / 5f;
		}
	}

	public static void ede(GameManager a)
	{
		int loo = QualitySettings.GetQualityLevel();
		Func<float, float, float> func = (float a, float b) => a + (b - a) * (float)(5 - loo) / 5f;
		foreach (CharacterManager character in a.Characters)
		{
			if (loo <= 3)
			{
				character.lho.mns.transform.Find("Ropes").gameObject.SetActive(value: false);
			}
			character.transform.Find("CC_Base_Body").GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = func(0f, 1.5f);
			character.transform.Find("CC_Base_Body_TShirt").GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = func(0f, 1.5f);
			character.transform.Find("TShirt").GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = func(1f, 4f);
			character.transform.Find("TankTop").GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = func(1f, 4f);
			character.transform.Find("Polo").GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = func(1f, 4f);
			character.transform.Find("Shoes_1").GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = func(1f, 3f);
			character.transform.Find("Short").GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = ((loo < 2) ? func(0.5f, 2f) : 0.5f);
			for (int i = 0; i < character.transform.childCount; i++)
			{
				Transform child = character.transform.GetChild(i);
				if (!(child.name == "Hair_M_Haircap") && !(child.name == "Hair_M_23") && !(child.name == "Hair_M_24") && child.name.StartsWith("Hair_") && child.gameObject.activeInHierarchy)
				{
					child.GetComponent<SkinnedMeshRenderer>().meshLodSelectionBias = func(1f, 2f);
				}
			}
		}
		a.Shuttle.transform.GetChild(0).GetComponent<MeshRenderer>().meshLodSelectionBias = func(1f, 4f);
	}
}
