using System.Collections;
using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Rendering;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MatchMenuManager : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Volume BlurVolume;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AnimatedPanel Mask;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public PauseMenu PauseMenu;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CommandsMenu CommandsMenu;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TeamsMenu TeamsMenu;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public MatchSettingsMenu SettingsMenu;

	private Coroutine luv;

	private bool luw;

	public AnimatedPanel[] pfa => new AnimatedPanel[3] { CommandsMenu, TeamsMenu, SettingsMenu };

	public AnimatedPanel[] pfb => (from a in pfa.Prepend(PauseMenu)
		where a.pqc
		select a).ToArray();

	public bool pfc
	{
		get
		{
			if (!PauseMenu.pqc && !PauseMenu.pfn)
			{
				return pfd;
			}
			return true;
		}
	}

	public bool pfd => pfa.Any((AnimatedPanel a) => a.pqc);

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.plh.pkc.performed += ejy;
		qi.pli.pkm.performed += ejz;
		qi.pli.pkn.performed += eka;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.plh.pkc.performed -= ejy;
		qi.pli.pkm.performed -= ejz;
		qi.pli.pkn.performed -= eka;
	}

	private void ejy(InputAction.CallbackContext a)
	{
		bool flag = !GameManager.Current.lmu && !GameManager.Current.pdu;
		if (GameManager.Current.OnlineManager != null)
		{
			flag = !qu.mug.plz;
		}
		if (!pfc && flag)
		{
			Open();
		}
		else
		{
			if (!PauseMenu.pqc)
			{
				return;
			}
			Close();
		}
		qi.pli.pkn.Disable();
		this.guz(delegate
		{
			qi.pli.pkn.Enable();
		});
	}

	private void ejz(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (CommandsMenu.pqc)
		{
			if (!CommandsMenu.pex)
			{
				PlayerPrefs.SetInt("SeenCommands", 1);
				PlayerPrefs.Save();
				Close();
			}
		}
		else if (TeamsMenu.pqc)
		{
			if (!TeamsMenu.elm())
			{
				AudioManager.fiw();
			}
			else
			{
				Close();
			}
		}
		else if (SettingsMenu.pqc)
		{
			Close();
		}
	}

	private void eka(InputAction.CallbackContext a)
	{
		if (!this.gus())
		{
			return;
		}
		if (PauseMenu.pqc)
		{
			Close();
			return;
		}
		AnimatedPanel[] array = pfa;
		foreach (AnimatedPanel animatedPanel in array)
		{
			if (animatedPanel.pqc)
			{
				if (animatedPanel == TeamsMenu && !TeamsMenu.elm())
				{
					AudioManager.fiw();
				}
				else if (luw)
				{
					Open(PauseMenu);
				}
				else
				{
					Close();
				}
				break;
			}
		}
	}

	private void ekb(bool a)
	{
		AudioSource[] array = Object.FindObjectsByType<AudioSource>(FindObjectsSortMode.None);
		foreach (AudioSource audioSource in array)
		{
			if (audioSource.isActiveAndEnabled)
			{
				if (a)
				{
					audioSource.Pause();
				}
				else
				{
					audioSource.UnPause();
				}
			}
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	private void Open(AnimatedPanel panel)
	{
		if (panel == PauseMenu)
		{
			luw = true;
		}
		AnimatedPanel[] array = pfb;
		foreach (AnimatedPanel animatedPanel in array)
		{
			if (!(animatedPanel == panel))
			{
				animatedPanel.FadeOut();
			}
		}
		panel.FadeIn();
		RefreshRateManager.gjd();
		GameManager.Current.Characters.ForEach(delegate(CharacterManager a)
		{
			a.lhe.dir(a: false);
		});
		if (GameManager.Current.OnlineManager == null)
		{
			Time.timeScale = 0f;
			ekb(a: true);
			GameManager.Current.HudCanvas.gameObject.SetActive(value: false);
			GameManager.Current.PowerGaugesCanvas.gameObject.SetActive(value: false);
		}
		AudioManager.fiu();
		Mask.FadeIn();
		if (BlurVolume.weight < 1f)
		{
			if (luv != null)
			{
				StopCoroutine(luv);
				luv = null;
				BlurVolume.weight = 1f;
			}
			else
			{
				luv = StartCoroutine(ekd(a: true));
			}
		}
	}

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public void Open()
	{
		Open(PauseMenu);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenCommandsMenu()
	{
		Open(CommandsMenu);
	}

	public void ekc()
	{
		if (PlayerPrefs.GetInt("SeenCommands", 0) == 0)
		{
			OpenCommandsMenu();
		}
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenTeamsMenu(bool showDisconnectedMessage = false)
	{
		Open(TeamsMenu);
		TeamsMenu.DisconnectedText.gameObject.SetActive(showDisconnectedMessage);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void OpenSettingsMenu()
	{
		Open(SettingsMenu);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public void Close()
	{
		luw = false;
		PauseMenu.elb();
		AnimatedPanel[] array = pfb;
		for (int i = 0; i < array.Length; i++)
		{
			array[i].FadeOut();
		}
		RefreshRateManager.gje();
		Mask.FadeOut();
		if (!AbsencePanel.luf)
		{
			GameManager.Current.Characters.ForEach(delegate(CharacterManager a)
			{
				a.lhe.dir(a: true);
			});
		}
		if (GameManager.Current.OnlineManager == null)
		{
			ekb(a: false);
		}
		AudioManager.fiu();
		GameManager.Current.HudCanvas.gameObject.SetActive(value: true);
		GameManager.Current.PowerGaugesCanvas.gameObject.SetActive(value: true);
		if (!(BlurVolume.weight > 0f))
		{
			return;
		}
		if (luv != null)
		{
			StopCoroutine(luv);
			luv = null;
			BlurVolume.weight = 0f;
			if (GameManager.Current.OnlineManager == null)
			{
				Time.timeScale = GameManager.Current.pdy.plt;
			}
		}
		else
		{
			luv = StartCoroutine(ekd(a: false));
		}
	}

	private IEnumerator ekd(bool a)
	{
		float unscaledTime = Time.unscaledTime;
		float num = 0.25f;
		do
		{
			BlurVolume.weight += Mathf.Lerp(a ? 0.8f : 1f, a ? 1f : 0.8f, (Time.unscaledTime - unscaledTime) / num);
			yield return new WaitForEndOfFrame();
		}
		while (Time.unscaledTime < unscaledTime + num);
		BlurVolume.weight = (a ? 1 : 0);
		if (!a && GameManager.Current.OnlineManager == null)
		{
			Time.timeScale = GameManager.Current.pdy.plt;
		}
	}
}
