using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class PlayerReportModal : MonoBehaviour
{
	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kp
	{
		public Action<List<string>> lvg;

		public List<string> lvh;

		internal void elg()
		{
			lvg(lvh.ToList());
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kq
	{
		public List<string> lvi;

		public Button lvj;
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class kr
	{
		public OnlinePlayerReportService.bcp lvk;

		public kq lvl;

		internal void elh(bool a)
		{
			AudioManager.PlayMenuChange();
			if (a)
			{
				lvl.lvi.Add(lvk.oan);
			}
			else
			{
				lvl.lvi.Remove(lvk.oan);
			}
			lvl.lvj.interactable = lvl.lvi.Count > 0;
		}
	}

	private const string lvm = "PlayerReportModal";

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private RectTransform panel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Toggle[] playerToggles;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private float rowHeight = 40f;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private float rowSpacing = 6f;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public static void Open(List<OnlinePlayerReportService.bcp> candidates, Action<List<string>> onReport, Action onClose = null)
	{
		List<string> lvh = new List<string>();
		SimpleModal simpleModal = SimpleModal.hhy(tt.gra("Match", "ReportSelectPlayers"), tt.gra("Global", "Cancel"), delegate
		{
			AudioManager.PlayMenuChange();
		}, tt.gra("Match", "ReportSend"), delegate
		{
			onReport(lvh.ToList());
		}, f: true, onClose, null, "PlayerReportModal");
		simpleModal?.GetComponent<PlayerReportModal>().eli(simpleModal, candidates, lvh);
	}

	private void eli(SimpleModal a, List<OnlinePlayerReportService.bcp> b, List<string> c)
	{
		Button lvj = a.RightButton;
		lvj.interactable = false;
		Toggle toggle = null;
		for (int i = 0; i < playerToggles.Length; i++)
		{
			Toggle toggle2 = playerToggles[i];
			bool flag = i < b.Count;
			toggle2.gameObject.SetActive(flag);
			if (!flag)
			{
				continue;
			}
			OnlinePlayerReportService.bcp lvk = b[i];
			toggle2.GetComponentInChildren<TextMeshProUGUI>(includeInactive: true).text = (lvk.oap ? (lvk.oao + "  <alpha=#99>(" + tt.gra("Match", "ReportPartner") + ")") : lvk.oao);
			toggle2.isOn = false;
			toggle2.onValueChanged.AddListener(delegate(bool a)
			{
				AudioManager.PlayMenuChange();
				if (a)
				{
					c.Add(lvk.oan);
				}
				else
				{
					c.Remove(lvk.oan);
				}
				lvj.interactable = c.Count > 0;
			});
			toggle = toggle2;
		}
		int num = Mathf.Max(0, playerToggles.Length - b.Count);
		panel.gum(panel.rect.height - (float)num * (rowHeight + rowSpacing));
		if (toggle != null)
		{
			elj(a.LeftButton, toggle);
			elj(a.RightButton, toggle);
		}
	}

	private static void elj(Selectable a, Selectable b)
	{
		Navigation navigation = a.navigation;
		navigation.selectOnUp = b;
		a.navigation = navigation;
	}
}
