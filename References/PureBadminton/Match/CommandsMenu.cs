using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.DualShock;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CommandsMenu : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject DefaultsCommandsGo;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private GameObject CustomizeCommandsGo;

	public bool pex
	{
		get
		{
			if (base.pqc)
			{
				return CustomizeCommandsGo.activeInHierarchy;
			}
			return false;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pkk.performed += eiq;
		if (rk.pnm)
		{
			DefaultsCommandsGo.SetActive(value: false);
			CustomizeCommandsGo.SetActive(value: true);
		}
		else
		{
			DefaultsCommandsGo.SetActive(value: true);
			CustomizeCommandsGo.SetActive(value: false);
		}
		eis();
		InputSystem.onDeviceChange += eir;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pkk.performed -= eiq;
		InputSystem.onDeviceChange -= eir;
	}

	private void eiq(InputAction.CallbackContext a)
	{
		if (DefaultsCommandsGo.activeSelf)
		{
			PlayerPrefs.SetInt("SeenCommands", 1);
			PlayerPrefs.Save();
			DefaultsCommandsGo.SetActive(value: false);
			CustomizeCommandsGo.SetActive(value: true);
		}
	}

	private void eir(InputDevice a, InputDeviceChange b)
	{
		eis();
	}

	private void eis()
	{
		bool flag = Gamepad.current != null;
		bool flag2 = flag && Gamepad.current is DualShockGamepad;
		DefaultsCommandsGo.transform.Find("XboxContainer").gameObject.SetActive(flag && !flag2);
		DefaultsCommandsGo.transform.Find("Ps5Container").gameObject.SetActive(flag && flag2);
		DefaultsCommandsGo.transform.Find("KeyboardContainer").gameObject.SetActive(!flag);
	}
}
