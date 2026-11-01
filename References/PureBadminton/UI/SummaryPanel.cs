using System;
using System.Collections;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Because the type might be a type called through reflection.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class SummaryPanel : AnimatedPanel
{
	private qu nmg;

	private Coroutine nmh;

	private int? nmi;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication TabLeftButtonIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication TabRightButtonIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication ContinueButtonIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private ButtonIndication ReportButtonIndication;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI NextSetTimerText;

	private int nmj = -1;

	public int? ptl
	{
		get
		{
			return nmi;
		}
		set
		{
			nmi = value;
			if (nmi.HasValue)
			{
				ContinueButtonIndication.gameObject.SetActive(value: false);
				NextSetTimerText.gameObject.SetActive(value: true);
				NextSetTimerText.text = this.gut("Match", "NextSetIn", nmi);
				if (base.gameObject.activeInHierarchy)
				{
					hkr();
				}
			}
			else
			{
				ContinueButtonIndication.gameObject.SetActive(value: true);
				NextSetTimerText.gameObject.SetActive(value: false);
				if (nmh != null)
				{
					StopCoroutine(nmh);
					nmh = null;
				}
			}
		}
	}

	public bool ptm
	{
		get
		{
			if (ReportButtonIndication != null)
			{
				return ReportButtonIndication.gameObject.activeSelf;
			}
			return false;
		}
		set
		{
			if (ReportButtonIndication != null)
			{
				ReportButtonIndication.gameObject.SetActive(value);
			}
		}
	}

	private int ptn
	{
		get
		{
			return nmj;
		}
		set
		{
			if (value >= 0 && value < nmg?.mui.Count)
			{
				nmj = value;
				hkq();
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		qi.pli.pki.performed += hkm;
		qi.pli.pkj.performed += hkn;
		if (nmi.HasValue)
		{
			hkr();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		qi.pli.pki.performed -= hkm;
		qi.pli.pkj.performed -= hkn;
	}

	private void hkm(InputAction.CallbackContext a)
	{
		if (ptn == 0)
		{
			ptn = nmg.mui.Count - 1;
		}
		else
		{
			ptn--;
		}
	}

	private void hkn(InputAction.CallbackContext a)
	{
		if (ptn == nmg.mui.Count - 1)
		{
			ptn = 0;
		}
		else
		{
			ptn++;
		}
	}

	public void hko(qu a)
	{
		nmg = a;
		ptn = nmg.mui.Count - 1;
		TabLeftButtonIndication.gameObject.SetActive(nmg.mui.Count > 1);
		TabRightButtonIndication.gameObject.SetActive(nmg.mui.Count > 1);
		hkp();
	}

	public void hkp()
	{
		Transform transform = base.transform.Find("Sets").transform;
		transform.GetChild(0).gameObject.SetActive(nmg.mui.Count > 0);
		transform.GetChild(1).gameObject.SetActive(nmg.mui.Count > 1);
		transform.GetChild(2).gameObject.SetActive(nmg.mui.Count > 2);
		for (int i = 0; i < nmg.mui.Count; i++)
		{
			transform.GetChild(i).GetChild(1).GetComponent<TextMeshProUGUI>()
				.text = hkt(nmg.mui[i]);
		}
	}

	public void hkq()
	{
		Transform transform = base.transform.Find("Sets").transform;
		for (int i = 0; i < transform.childCount; i++)
		{
			transform.GetChild(i).GetComponent<Image>().enabled = i == ptn;
		}
		re re2 = ((nmg.mui.Count > nmj) ? nmg.mui[nmj] : null);
		Transform transform2 = base.transform.Find("GlobalStats").transform;
		transform2.GetChild(0).GetComponent<TextMeshProUGUI>().text = re2.pmm.ToString();
		transform2.GetChild(1).GetComponent<TextMeshProUGUI>().text = this.gut("SummaryPanel", "XMinutes", Mathf.Round(re2.muu / 60f));
		transform2.GetChild(2).GetComponent<TextMeshProUGUI>().text = re2.pmn.ToString();
		Func<MatchSettings.TeamSettings, string> func = (MatchSettings.TeamSettings a) => (a.PlayerB?.CharacterInfo == null) ? a.PlayerA.CharacterInfo.lastName : (a.PlayerA.CharacterInfo.lastName + "\n" + a.PlayerB.CharacterInfo.lastName);
		Transform obj = base.transform.Find("Players").transform;
		obj.GetChild(0).GetComponent<TextMeshProUGUI>().text = func(nmg.muh.TeamA);
		obj.GetChild(1).GetComponent<TextMeshProUGUI>().text = hkt(re2);
		obj.GetChild(2).GetComponent<TextMeshProUGUI>().text = func(nmg.muh.TeamB);
		Transform obj2 = base.transform.Find("BadServe").transform;
		obj2.GetChild(0).GetComponent<TextMeshProUGUI>().text = $"{re2.gfp(a: true)}";
		obj2.GetChild(2).GetComponent<TextMeshProUGUI>().text = $"{re2.gfp(a: false)}";
		Transform obj3 = base.transform.Find("ShuttleOut").transform;
		obj3.GetChild(0).GetComponent<TextMeshProUGUI>().text = $"{re2.gfq(a: true)}";
		obj3.GetChild(2).GetComponent<TextMeshProUGUI>().text = $"{re2.gfq(a: false)}";
		Transform obj4 = base.transform.Find("ShuttleInNet").transform;
		obj4.GetChild(0).GetComponent<TextMeshProUGUI>().text = $"{re2.gfr(a: true)}";
		obj4.GetChild(2).GetComponent<TextMeshProUGUI>().text = $"{re2.gfr(a: false)}";
		Transform transform3 = base.transform.Find("Distance").transform;
		transform3.GetChild(0).GetComponent<TextMeshProUGUI>().text = this.gut("SummaryPanel", "XMeters", re2.gfs(a: true));
		transform3.GetChild(2).GetComponent<TextMeshProUGUI>().text = this.gut("SummaryPanel", "XMeters", re2.gfs(a: false));
	}

	private void hkr()
	{
		if (nmi.HasValue)
		{
			if (nmh != null)
			{
				StopCoroutine(nmh);
			}
			nmh = StartCoroutine(hks(nmi.Value));
		}
	}

	private IEnumerator hks(int a)
	{
		for (int num = a; num > 0; num--)
		{
			NextSetTimerText.text = this.gut("Match", "NextSetIn", num);
			yield return this.guu(1f);
		}
		NextSetTimerText.text = this.gut("Match", "NextSetIn", 0);
	}

	private string hkt(re a)
	{
		if (!a.pmk)
		{
			return $"{a.pmi} - <color=#8bc34a>{a.pmj}</color>";
		}
		return $"<color=#8bc34a>{a.pmi}</color> - {a.pmj}";
	}
}
