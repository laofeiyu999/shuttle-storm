using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentItem : MonoBehaviour
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image badgeImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro badgeText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro nameText;

	public static TournamentItem ptv => Resources.Load<TournamentItem>("UI/TournamentItem");

	public void hnf(sz a)
	{
		badgeImage.color = qh.fzq(a.Series);
		badgeText.plk = new LocalizedString("List_TournamentSeries", a.Series.ToString() + ((a.Series == TournamentSeries.WorldTournaments || a.Series == TournamentSeries.InternationalChallenge) ? "_Short" : ""));
		nameText.plk = new LocalizedString("List_TournamentType", a.Id);
	}
}
