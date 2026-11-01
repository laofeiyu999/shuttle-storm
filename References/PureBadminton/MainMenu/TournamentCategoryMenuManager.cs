using System;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TournamentCategoryMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button MenSingleButton;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button WomenSingleButton;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button MenDoubleButton;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button WomenDoubleButton;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button MixedDoubleButton;

	public TournamentCategory pyz
	{
		get
		{
			GameObject currentSelectedGameObject = EventSystem.current.currentSelectedGameObject;
			if (currentSelectedGameObject == MenSingleButton.gameObject)
			{
				return TournamentCategory.MenSingles;
			}
			if (currentSelectedGameObject == WomenSingleButton.gameObject)
			{
				return TournamentCategory.WomenSingles;
			}
			if (currentSelectedGameObject == MenDoubleButton.gameObject)
			{
				return TournamentCategory.MenDoubles;
			}
			if (currentSelectedGameObject == WomenDoubleButton.gameObject)
			{
				return TournamentCategory.WomenDoubles;
			}
			return TournamentCategory.MixedDoubles;
		}
	}

	private Button pza => rk.pms switch
	{
		TournamentCategory.MenSingles => MenSingleButton, 
		TournamentCategory.WomenSingles => WomenSingleButton, 
		TournamentCategory.MenDoubles => MenDoubleButton, 
		TournamentCategory.WomenDoubles => WomenDoubleButton, 
		TournamentCategory.MixedDoubles => MixedDoubleButton, 
		_ => throw new NotImplementedException(), 
	};

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		EventSystem.current.SetSelectedGameObject(pza.gameObject);
	}

	public void jiy()
	{
		rk.pms = TournamentCategory.MenSingles;
	}

	public void jiz()
	{
		rk.pms = TournamentCategory.MenDoubles;
	}

	public void jja()
	{
		rk.pms = TournamentCategory.WomenSingles;
	}

	public void jjb()
	{
		rk.pms = TournamentCategory.WomenDoubles;
	}

	public void jjc()
	{
		rk.pms = TournamentCategory.MixedDoubles;
	}
}
