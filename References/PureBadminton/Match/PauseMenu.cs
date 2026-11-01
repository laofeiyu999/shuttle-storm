using System.ComponentModel;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class PauseMenu : AnimatedPanel
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button TeamsButton;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Button SettingsButton;

	private SimpleModal lvf;

	public bool pfn => lvf != null;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		bool flag = GameManager.Current.pdw || GameManager.Current.pdx;
		if (TeamsButton != null)
		{
			TeamsButton.gameObject.SetActive(!flag && MatchSettings.Current.Online == null);
		}
		if (SettingsButton != null)
		{
			SettingsButton.gameObject.SetActive(!flag);
		}
		GameManager.Current.lne += ekx;
		eky();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		GameManager.Current.lne -= ekx;
	}

	private void ekx(CancelEventArgs a)
	{
		eky();
	}

	private void eky()
	{
		Transform transform = base.transform.Find("Scores Panel").transform;
		GameManager current = GameManager.Current;
		transform.Find("TeamA").gameObject.SetActive(!current.pdw && !current.pdx);
		transform.Find("Sets").gameObject.SetActive(!current.pdw && !current.pdx);
		transform.Find("TeamB").gameObject.SetActive(!current.pdw && !current.pdx);
		transform.Find("Tutorial").gameObject.SetActive(current.pdw || current.pdx);
		if (current.pdx)
		{
			transform.Find("Tutorial").GetComponent<LocalizedTextMeshPro>().enabled = false;
			transform.Find("Tutorial").GetComponent<TextMeshProUGUI>().text = this.gut("Training", Career.Current.CurrentTraining.TrainingInfo.nca.ToString()) + " - " + this.gut("Training", "Level", Career.Current.CurrentTraining.TrainingInfo.ncb);
		}
		if (current.pdw || current.pdx)
		{
			return;
		}
		transform.Find("TeamA").GetComponent<TextMeshProUGUI>().text = ekz(a: true);
		transform.Find("TeamB").GetComponent<TextMeshProUGUI>().text = ekz(a: false);
		Transform transform2 = transform.Find("Sets").transform;
		int count = qu.mug.mui.Count;
		for (int i = 0; i < 3; i++)
		{
			Transform child = transform2.GetChild(i);
			child.gameObject.SetActive(i < count);
			if (i < count)
			{
				child.GetComponent<RectTransform>().anchorMin = new Vector2((float)i / (float)count, 0f);
				child.GetComponent<RectTransform>().anchorMax = new Vector2(((float)i + 1f) / (float)count, 1f);
				child.GetChild(1).GetComponent<TextMeshProUGUI>().text = ela(i);
			}
		}
	}

	private string ekz(bool a)
	{
		MatchSettings.TeamSettings teamSettings = (a ? MatchSettings.Current.TeamA : MatchSettings.Current.TeamB);
		if (MatchSettings.Current.IsDouble)
		{
			return string.Join("\r\n", teamSettings.PlayerA.CharacterInfo.lastName.ToUpper(), teamSettings.PlayerB.CharacterInfo.lastName.ToUpper());
		}
		return teamSettings.PlayerA.CharacterInfo.lastName.ToUpper();
	}

	private string ela(int a)
	{
		int count = qu.mug.mui.Count;
		re re2 = qu.mug.mui[a];
		if (a == count - 1)
		{
			return $"{re2.pmi} - {re2.pmj}";
		}
		if (!re2.pmk)
		{
			return $"{re2.pmi} - <color=#8bc34a>{re2.pmj}</color>";
		}
		return $"<color=#8bc34a>{re2.pmi}</color> - {re2.pmj}";
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void ExitButtonClicked()
	{
		bool flag = MatchSettings.Current.Online != null;
		FadeOut();
		lvf = SimpleModal.hia(this.gut("Match", flag ? "ForfeitOnlineMatchConfirm" : "ExitMatchConfirm"), ele, eld, d: true, elc);
	}

	public void elb()
	{
		SimpleModal simpleModal = lvf;
		lvf = null;
		if (simpleModal != null)
		{
			simpleModal.Close();
		}
	}

	private void elc()
	{
		SimpleModal simpleModal = lvf;
		lvf = null;
		if (simpleModal != null && !simpleModal.nlf)
		{
			eld();
		}
	}

	private void eld()
	{
		AudioManager.PlayMenuChange();
		FadeIn();
	}

	private void ele()
	{
		if (MatchSettings.Current.Online != null && qu.mug.plz)
		{
			return;
		}
		if (!GameManager.Current.pdw && !GameManager.Current.pdx)
		{
			wn.hpp(MatchSettings.Current, qu.mug);
		}
		if (MatchSettings.Current.Online != null)
		{
			OnlineMatchManager onlineManager = GameManager.Current.OnlineManager;
			if ((object)onlineManager != null && onlineManager.pgj)
			{
				OnlineMatchForfeit.erz();
			}
			else
			{
				OnlineMatchExit.erj(a: true, "left_by_player");
			}
		}
		else
		{
			LoadingScreen.hfx("MainMenu");
		}
	}
}
