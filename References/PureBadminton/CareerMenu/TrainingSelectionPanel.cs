using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TrainingSelectionPanel : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CareerMenuManager careerMenu;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private PaginatedGridLayout trainingsContainer;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkm.performed += dcu;
		dcv();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkm.performed -= dcu;
	}

	private void dcu(InputAction.CallbackContext a)
	{
		if (this.gus())
		{
			tn tn2 = tn.ncf[trainingsContainer.ptf];
			if (tn2.gqw(Career.Current.MainCharacter.CharacterInfo.stats))
			{
				AudioManager.fiw();
			}
			else
			{
				careerMenu.SelectTraining(tn2);
			}
		}
	}

	private void dcv()
	{
		trainingsContainer.transform.guj();
		foreach (tn item in tn.ncf.OrderBy((tn a) => a.ncb))
		{
			Object.Instantiate(TrainingButton.oyj, trainingsContainer.transform).dcs(item);
		}
	}
}
