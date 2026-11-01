using System.Runtime.CompilerServices;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TeamsMenu : AnimatedPanel
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class ks
	{
		public GameManager lvn;

		internal void elk(CharacterManager a)
		{
			kt CS_0024_003C_003E8__locals0 = new kt();
			CS_0024_003C_003E8__locals0.lvo = a;
			CS_0024_003C_003E8__locals0.lvo.Player = lvn.pdy.plv.Find((MatchSettings.PlayerSettings a) => a.Position == CS_0024_003C_003E8__locals0.lvo.Player.Position);
			CS_0024_003C_003E8__locals0.lvo.dnd();
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kt
	{
		public CharacterManager lvo;

		internal bool ell(MatchSettings.PlayerSettings a)
		{
			return a.Position == lvo.Player.Position;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject DisconnectedText;

	private TeamsSelection lvp;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void Awake()
	{
		base.Awake();
		lvp = base.transform.Find("Court").gameObject.GetComponent<TeamsSelection>();
	}

	public bool elm()
	{
		if (!lvp.ptq)
		{
			return false;
		}
		GameManager lvn = GameManager.Current;
		lvp.Save();
		lvn.Characters.ForEach(delegate(CharacterManager a)
		{
			a.Player = lvn.pdy.plv.Find((MatchSettings.PlayerSettings a) => a.Position == a.Player.Position);
			a.dnd();
		});
		lvn.Cameras.dex();
		lvn.EnergyPanel.Initialize(lvn.Characters);
		return true;
	}
}
