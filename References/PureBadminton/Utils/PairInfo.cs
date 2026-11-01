using System;
using OPS.Obfuscator.Attribute;

[Serializable]
[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate serializable classes' settings.")]
public class PairInfo
{
	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string id;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string category;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public int points;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string characterId1;

	[NotObfuscatedCause("Because of the deactivated 'Obfuscate serializable classes' setting.")]
	public string characterId2;

	public CharacterInfo pjs => os.fsk(characterId1);

	public CharacterInfo pjt => os.fsk(characterId2);

	public TournamentCategory pju
	{
		get
		{
			string text = category;
			if (!(text == "MD"))
			{
				if (text == "WD")
				{
					return TournamentCategory.WomenDoubles;
				}
				return TournamentCategory.MixedDoubles;
			}
			return TournamentCategory.MenDoubles;
		}
	}
}
