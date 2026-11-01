using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CareerLoadMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GridLayoutGroup Grid;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public ButtonIndication DeleteButtonIndication;

	private Dictionary<string, GameObject> ohk = new Dictionary<string, GameObject>();

	private Transform pxy => Grid.transform.GetChild(0);

	public string pxz => ohk.FirstOrDefault((KeyValuePair<string, GameObject> a) => a.Value == EventSystem.current.currentSelectedGameObject).Key;

	public void jcr(Dictionary<string, ng> a)
	{
		foreach (KeyValuePair<string, GameObject> item in ohk)
		{
			Object.Destroy(item.Value);
		}
		ohk.Clear();
		pxy.GetChild(0).GetComponent<TextMeshProUGUI>().text = "<size=200%><b>+</b></size>\r\n<size=80%><alpha=#cc>" + tt.gra("Global", "New") + "</size>";
		foreach (KeyValuePair<string, ng> item2 in a.OrderByDescending((KeyValuePair<string, ng> a) => a.Value.mlq))
		{
			GameObject gameObject = Object.Instantiate(Grid.transform.GetChild(0).gameObject, Grid.transform);
			gameObject.name = $"{item2.Value.mlp} - {item2.Value.mlq}";
			gameObject.transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = $"<b>{item2.Value.mlp}</b>\r\n\r\n<size=80%><alpha=#cc>{item2.Value.mlq}</size>";
			ohk.Add(item2.Key, gameObject);
		}
		EventSystem.current.SetSelectedGameObject(pxy.gameObject);
		DeleteButtonIndication.gameObject.SetActive(value: false);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.msf += jcs;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.msf -= jcs;
	}

	private void jcs(MoveDirection a, InputAction.CallbackContext b)
	{
		this.guv(0.1f, delegate
		{
			DeleteButtonIndication.gameObject.SetActive(EventSystem.current.currentSelectedGameObject != pxy.gameObject);
		});
	}

	[CompilerGenerated]
	private void jct()
	{
		DeleteButtonIndication.gameObject.SetActive(EventSystem.current.currentSelectedGameObject != pxy.gameObject);
	}
}
