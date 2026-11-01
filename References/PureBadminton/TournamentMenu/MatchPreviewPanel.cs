using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine.Localization;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchPreviewPanel : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LocalizedTextMeshPro TournamentNameText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public LocalizedTextMeshPro TournamentPhaseText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharactersPreviewScene CharactersPreview;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterCountryName TeamACharacterA;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterCountryName TeamACharacterB;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterCountryName TeamBCharacterA;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterCountryName TeamBCharacterB;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI TeamARanking;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI TeamBRanking;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		TournamentMatch tournamentMatch = Tournament.Current.pnw;
		TournamentNameText.plk = new LocalizedString("List_TournamentType", Tournament.Current.Properties.Id);
		TournamentPhaseText.plk = ss.gnx(Tournament.Current, Tournament.Current.pnz, Tournament.Current.poa == TournamentPhase.Qualifications);
		bool flag = tournamentMatch.TeamA.pog != null && tournamentMatch.TeamB.pog != null;
		CharacterIdlePose item = CharacterIdlePose.CrossedArms;
		TeamACharacterA.gyv(tournamentMatch.TeamA.pof);
		TeamBCharacterA.gyv(tournamentMatch.TeamB.pof);
		TeamACharacterB.gameObject.SetActive(flag);
		TeamBCharacterB.gameObject.SetActive(flag);
		int? num = tournamentMatch.TeamA.gos();
		int? num2 = tournamentMatch.TeamB.gos();
		TeamARanking.text = (num.HasValue ? $"#{num}" : "");
		TeamBRanking.text = (num2.HasValue ? $"#{num2}" : "");
		if (flag)
		{
			TeamACharacterB.gyv(tournamentMatch.TeamA.pog);
			TeamBCharacterB.gyv(tournamentMatch.TeamB.pog);
			CharactersPreview.hbh((CharactersPreviewScenePosition.LeftPairA, tournamentMatch.TeamA.pof, item), (CharactersPreviewScenePosition.LeftPairB, tournamentMatch.TeamA.pog, item), (CharactersPreviewScenePosition.RightPairA, tournamentMatch.TeamB.pof, item), (CharactersPreviewScenePosition.RightPairB, tournamentMatch.TeamB.pog, item));
		}
		else
		{
			CharactersPreview.hbh((CharactersPreviewScenePosition.Left, tournamentMatch.TeamA.pof, item), (CharactersPreviewScenePosition.Right, tournamentMatch.TeamB.pof, item));
		}
	}

	protected override void cyr()
	{
		base.cyr();
		CharactersPreview.hbi();
	}
}
