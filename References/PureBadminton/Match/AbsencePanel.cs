using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class AbsencePanel : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	private enum TitleState
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		None,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Offline,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Waiting
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kl
	{
		public bool lue;

		internal void eik(CharacterManager a)
		{
			a.lhe.dir(!lue);
		}
	}

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject _root;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI _title;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI _countdown;

	private MatchAbsenceWatcher lug;

	private TitleState luh;

	private const float lui = 5f;

	public static bool luf { get; private set; }

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		lug = MatchAbsenceWatcher.lxr;
		if (lug == null)
		{
			base.gameObject.SetActive(value: false);
			return;
		}
		if (_countdown != null)
		{
			_countdown.gameObject.SetActive(value: false);
		}
		lug.lxx += Refresh;
		Refresh();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		if (lug != null)
		{
			lug.lxx -= Refresh;
		}
		luf = false;
	}

	private static void ein(bool a)
	{
		if (a == luf)
		{
			return;
		}
		luf = a;
		GameManager current = GameManager.Current;
		if (!(current == null) && (a || !current.MenuManager.pfc))
		{
			current.Characters.ForEach(delegate(CharacterManager a)
			{
				a.lhe.dir(!a);
			});
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (lug != null)
		{
			Refresh();
		}
	}

	private bool eio()
	{
		GameManager current = GameManager.Current;
		if (current == null || !current.peb || current.Shuttle.pgy)
		{
			return false;
		}
		return Time.unscaledTime - lug.lxz < 5f;
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Refresh()
	{
		bool flag = lug.lxy && !eio();
		int num;
		if (lug.lxt)
		{
			GameManager current = GameManager.Current;
			num = (((object)current == null || !current.peb) ? 1 : 0);
		}
		else
		{
			num = 0;
		}
		bool flag2 = (byte)num != 0;
		bool flag3 = flag || flag2;
		_root.SetActive(flag3);
		ein(flag3);
		if (!flag3)
		{
			luh = TitleState.None;
			return;
		}
		TitleState titleState = (flag ? TitleState.Offline : TitleState.Waiting);
		if (titleState != luh)
		{
			_title.text = (flag ? this.gut("Match", "AbsenceReconnecting") : this.gut("Match", "AbsenceWaitingForPlayer"));
			luh = titleState;
		}
	}
}
