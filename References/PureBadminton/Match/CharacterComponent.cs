using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public abstract class CharacterComponent : MonoBehaviour
{
	private CharacterManager lgf;

	public CharacterManager ozc
	{
		get
		{
			return lgf ?? (lgf = GetComponent<CharacterManager>());
		}
		set
		{
			lgf = value;
		}
	}

	public GameManager ozd => ozc.Game;

	public CourtManager oze => ozc.pal;

	public ShuttleManager ozf => ozc.pam;

	public Rigidbody ozg => ozc.lhd;

	public Animator ozh => ozc.lhb;

	public bool ozi => ozc.IsBot;

	public bool ozj => ozc.pap;

	public bool ozk => ozc.teamA;

	public bool ozl => ozc.par;

	public bool ozm => ozc.pao;

	public CharacterManager ozn => ozc.paw;
}
