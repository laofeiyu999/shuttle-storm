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
public class TournamentLoadMenuManager : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GridLayoutGroup Grid;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public ButtonIndication DeleteButtonIndication;

	private Dictionary<string, GameObject> ojw = new Dictionary<string, GameObject>();

	private Transform pzb => Grid.transform.GetChild(0);

	public string pzc => ojw.FirstOrDefault((KeyValuePair<string, GameObject> a) => a.Value == EventSystem.current.currentSelectedGameObject).Key;

	public void jjh(Dictionary<string, sb> a)
	{
		foreach (KeyValuePair<string, GameObject> item in ojw)
		{
			Object.Destroy(item.Value);
		}
		pzb.GetChild(0).GetComponent<TextMeshProUGUI>().text = "<size=200%><b>+</b></size>\r\n<size=80%><alpha=#cc>" + tt.gra("Global", "New") + "</size>";
		ojw.Clear();
		foreach (KeyValuePair<string, sb> item2 in a.OrderByDescending((KeyValuePair<string, sb> a) => a.Value.mlq))
		{
			GameObject gameObject = Object.Instantiate(Grid.transform.GetChild(0).gameObject, Grid.transform);
			gameObject.name = $"{item2.Value.myv} - {item2.Value.mlq}";
			gameObject.transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = string.Format("<b>{0}</b>\r\n\r\n<size=80%><alpha=#cc>{1}</size>", this.gut("List_TournamentType", item2.Value.myv), item2.Value.mlq);
			ojw.Add(item2.Key, gameObject);
		}
		EventSystem.current.SetSelectedGameObject(pzb.gameObject);
		DeleteButtonIndication.gameObject.SetActive(value: false);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.msf += jji;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.msf -= jji;
	}

	private void jji(MoveDirection a, InputAction.CallbackContext b)
	{
		this.guv(0.1f, delegate
		{
			DeleteButtonIndication.gameObject.SetActive(EventSystem.current.currentSelectedGameObject != pzb.gameObject);
		});
	}

	[CompilerGenerated]
	private void jjj()
	{
		DeleteButtonIndication.gameObject.SetActive(EventSystem.current.currentSelectedGameObject != pzb.gameObject);
	}
}
