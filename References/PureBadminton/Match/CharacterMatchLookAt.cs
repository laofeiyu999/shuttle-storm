using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterMatchLookAt : CharacterLookAt
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterManager Character;

	private float pbd => (float)Character.Player.CharacterInfo.height / 100f * 0.95f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (!(base.mnr != null))
		{
			return;
		}
		GameManager game = Character.Game;
		Vector3 zero = Vector3.zero;
		int num = 0;
		List<CharacterManager> characters = game.Characters;
		for (int i = 0; i < characters.Count; i++)
		{
			CharacterManager characterManager = characters[i];
			if (characterManager.teamA != Character.teamA && characterManager.gameObject.activeInHierarchy)
			{
				zero += characterManager.transform.position;
				num++;
			}
		}
		Vector3 vector = ((num > 0) ? (zero / num) : (Character.transform.position + (Character.par ? Vector3.forward : Vector3.back)));
		vector.y = pbd;
		if (game.Shuttle == null || !game.Shuttle.gameObject.activeInHierarchy)
		{
			base.mnr.transform.position = vector;
			return;
		}
		float num2 = 0f;
		if (!game.peb || game.lmu)
		{
			num2 = 1f;
		}
		else
		{
			CharacterShotManager.ib ib = Character.lhi.lju;
			num2 = ((ib == null || !ib.pbk) ? (0.5f - 0.5f * (game.Shuttle.transform.position.z - base.transform.position.z) * (float)(Character.par ? 1 : (-1))).gtg(0f, 1f) : 0f);
		}
		base.mnr.transform.position = Vector3.Lerp(game.Shuttle.transform.position, vector, num2);
	}
}
