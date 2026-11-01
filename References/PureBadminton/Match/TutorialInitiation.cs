using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.UI;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.InputSystem;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TutorialInitiation : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate delegate classes' settings.")]
	public delegate void OnInitiationFinished();

	private const int mjq = 1;

	private const int mjr = 2;

	private const int mjs = 3;

	private const int mjt = 4;

	private const int mju = 5;

	private const int mjv = 6;

	private const int mjw = 7;

	private const int mjx = 8;

	private const int mjy = 9;

	private const int mjz = 10;

	private const int mka = 11;

	private const int mkb = 12;

	private const float mkc = 0.8f;

	private bool mkd;

	private int mke = 1;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameManager Game;

	private CharacterManager mkh;

	private CharacterManager mki;

	private Vector2 mkj = new Vector2(19.5f, 17.5f);

	private Vector2 mkk = new Vector2(18f, 16f);

	private Vector2 mkl = new Vector2(18f, 14.5f);

	public bool mkf { get; private set; }

	public event OnInitiationFinished mkg;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		mkh = Game.Characters.First((CharacterManager a) => a.teamA);
		mki = Game.Characters.First((CharacterManager a) => !a.teamA);
		mkh.lhr += fgp;
		mki.lhr += fgq;
	}

	public void fgh()
	{
		mkf = false;
		mke = 1;
		mkh.lhi.LimitShotPower = 0.7f;
		mkh.lhm.dql("Kill", "NetShot-High", "BackhandDrive", "Stick");
		mki.lhm.dql("Dive", "LongBackhandDefense");
		for (int i = 0; i < base.transform.childCount; i++)
		{
			Transform child = base.transform.GetChild(i);
			child.gameObject.SetActive(value: true);
			AnimatedPanel component = child.GetComponent<AnimatedPanel>();
			if ((bool)component)
			{
				component.gxs();
			}
		}
		StartCoroutine(fgk());
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		qi.plh.pjz.performed += fgl;
		qi.plh.pjx.performed += fgn;
		qi.plh.pjw.performed += fgm;
		qi.plh.pjv.performed += fgo;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDisable()
	{
		qi.plh.pjz.performed -= fgl;
		qi.plh.pjx.performed -= fgn;
		qi.plh.pjw.performed -= fgm;
		qi.plh.pjv.performed -= fgo;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void FixedUpdate()
	{
		if (!mkd)
		{
			return;
		}
		switch (mke)
		{
		case 1:
			if (mkh.lhi.nextShotType == ShotType.Drop)
			{
				fgi();
			}
			break;
		case 2:
			if (mkh.lhi.nextShotPower >= 0.7f)
			{
				Time.timeScale = 0.8f;
				mkh.lhi.nextShotDirection = Vector2.zero;
				fgi();
			}
			else if (qi.plh.pjz.IsPressed())
			{
				Time.timeScale = 0.2f;
			}
			else
			{
				Time.timeScale = 0f;
			}
			break;
		case 4:
			mkh.lhi.dtg();
			mkh.lhg.dow();
			if (mkh.jvv(mkj) < 0.7f)
			{
				mkh.lhg.dox();
				fgi();
			}
			break;
		case 5:
			if (mkh.lhi.nextShotPower >= 0.7f)
			{
				Time.timeScale = 0.8f;
				mkh.lhi.nextShotPower = 0.7f;
				mkh.lhi.nextShotDirection = new Vector2(-0.5f, 1f);
				fgi();
			}
			else if (qi.plh.pjw.IsPressed())
			{
				Time.timeScale = 0.2f;
			}
			else
			{
				Time.timeScale = 0f;
			}
			break;
		case 6:
			if (mkh.jvv(mkk) < 0.7f)
			{
				mkh.lhg.dox();
				fgi();
			}
			break;
		case 7:
			if (mkh.lhi.nextShotType == ShotType.Drop && mkh.lhi.nextShotPower >= 0.7f)
			{
				Time.timeScale = 0.8f;
				fgi();
			}
			else if (qi.plh.pjz.IsPressed())
			{
				Time.timeScale = 0.2f;
			}
			else
			{
				Time.timeScale = 0f;
			}
			break;
		case 9:
			if (mkh.jvv(mkl) < 0.7f)
			{
				mkh.lhg.dox();
				fgi();
			}
			break;
		case 10:
			if (mkh.lhi.nextShotType == ShotType.Smash && mkh.lhi.nextShotPower >= 0.7f)
			{
				Time.timeScale = 0.8f;
				if (mkh.lhi.lju != null)
				{
					fgi();
				}
			}
			else if (qi.plh.pjx.IsPressed())
			{
				Time.timeScale = 0.2f;
			}
			else
			{
				Time.timeScale = 0f;
			}
			break;
		case 11:
		{
			if (mkh.lhe.ozq.x > 0.8f)
			{
				Time.timeScale = 0.7f;
				break;
			}
			float time = Time.time;
			CharacterShotManager.ib ib = mkh.lhi.lju;
			if (time < ((ib != null) ? new float?(ib.lje - 0.1f) : null))
			{
				Time.timeScale = 0.2f;
			}
			else
			{
				Time.timeScale = 0f;
			}
			break;
		}
		case 3:
		case 8:
			break;
		}
	}

	private void fgi()
	{
		wn.hpm("FinishTutorialStep", new Dictionary<string, object> { { "tutorialStep", mke } });
		mke++;
		StartCoroutine(fgk());
	}

	private IEnumerator fgj(string a, bool b)
	{
		AnimatedPanel animatedPanel = base.transform.Find(a)?.GetComponent<AnimatedPanel>();
		if ((bool)animatedPanel)
		{
			yield return b ? animatedPanel.gxj() : animatedPanel.gxk();
		}
	}

	private IEnumerator fgk()
	{
		mkd = false;
		yield return fgj($"Step {mke - 1}", b: false);
		yield return fgj($"Step {mke}", b: true);
		switch (mke)
		{
		case 1:
			mkh.AllowedAction = CharacterManager.PossibleAction.Drop;
			break;
		case 2:
			mkh.AllowedAction = CharacterManager.PossibleAction.Drop;
			break;
		case 3:
			mki.lhi.nextShotType = ShotType.Drop;
			mki.lhi.nextShotDirection = new Vector2(-0.8f, -0.5f);
			mkh.AllowedAction = CharacterManager.PossibleAction.None;
			break;
		case 4:
			mkh.AllowedAction = CharacterManager.PossibleAction.Move;
			mkh.lhm.dqo();
			Time.timeScale = 0.8f;
			Game.Shuttle.eyo();
			mki.dnn();
			mki.lhi.dtg();
			Game.TargetDecal.transform.position = new Vector3(mkj.x, Game.TargetDecal.transform.position.y, mkj.y);
			Game.TargetDecal.enabled = true;
			break;
		case 5:
			mki.dnn(a: false);
			Game.Shuttle.eyo(a: false);
			mkh.AllowedAction = CharacterManager.PossibleAction.Clear;
			mkh.lhi.nextShotPower = 0.2f;
			Game.TargetDecal.enabled = false;
			break;
		case 6:
			yield return new WaitUntil(() => mkh.pav && Game.Shuttle.transform.position.z > Game.Court.pci + 3f);
			mki.lhi.dtg();
			mki.dnn();
			Game.Shuttle.eyo();
			mkk = new Vector2(Game.Shuttle.transform.position.x, mkk.y);
			Game.TargetDecal.transform.position = new Vector3(mkk.x, Game.TargetDecal.transform.position.y, mkk.y);
			Game.TargetDecal.enabled = true;
			mkh.AllowedAction = CharacterManager.PossibleAction.Move;
			break;
		case 7:
			Game.TargetDecal.enabled = false;
			mkh.AllowedAction = CharacterManager.PossibleAction.Drop;
			break;
		case 8:
			mki.dnn(a: false);
			Game.Shuttle.eyo(a: false);
			mki.GetComponent<Animator>().speed = 1f;
			mki.lhi.nextShotType = ShotType.Clear;
			mki.lhi.nextShotDirection = new Vector2(-0.5f, 0.5f);
			mki.lhi.nextShotPower = 0.2f;
			mki.lhn.dgw();
			mkh.AllowedAction = CharacterManager.PossibleAction.None;
			break;
		case 9:
			mki.dnn();
			Game.Shuttle.eyo();
			mkl = new Vector2(Game.Shuttle.transform.position.x, mkl.y);
			Game.TargetDecal.transform.position = new Vector3(mkl.x, Game.TargetDecal.transform.position.y, mkl.y);
			Game.TargetDecal.enabled = true;
			mkh.AllowedAction = CharacterManager.PossibleAction.Move;
			mkh.lhm.dqo();
			break;
		case 10:
			mki.dnn(a: false);
			Game.Shuttle.eyo(a: false);
			Game.TargetDecal.enabled = false;
			mki.lhg.dov(new Vector3(mkh.transform.position.x, 0f, Game.Court.pci + CourtManager.halfCourtLength / 2f));
			mkh.AllowedAction = CharacterManager.PossibleAction.Smash;
			mkh.lhi.nextShotDirection = new Vector2(1f, -1f);
			break;
		case 11:
			mkh.AllowedAction = CharacterManager.PossibleAction.None;
			break;
		}
		mkd = true;
	}

	private void fgl(InputAction.CallbackContext a)
	{
		if (mke == 2 || mke == 7)
		{
			Time.timeScale = 0.8f;
		}
	}

	private void fgm(InputAction.CallbackContext a)
	{
		if (mke == 5)
		{
			Time.timeScale = 0.8f;
		}
	}

	private void fgn(InputAction.CallbackContext a)
	{
		if (mke == 10)
		{
			Time.timeScale = 0.8f;
		}
	}

	private void fgo(InputAction.CallbackContext a)
	{
		if ((mke == 9 || mke == 11) && a.ReadValue<Vector2>().x > 0.8f)
		{
			Time.timeScale = 0.8f;
		}
	}

	private void fgp(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		if (mke == 11)
		{
			Time.timeScale = 1f;
			fgi();
		}
	}

	private void fgq(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		if (mke == 3)
		{
			Time.timeScale = 0.1f;
		}
		if (mke == 3 || mke == 8)
		{
			fgi();
		}
	}

	public void fgr()
	{
		mkh.dmt();
		mki.dmt();
		if (mke == 12 && mkh.pav && Game.Shuttle.transform.position.z > Game.Court.pci)
		{
			if (!mkf)
			{
				mkf = true;
				mkh.lhi.LimitShotPower = null;
				mkh.lhm.dqj();
				mki.lhm.dqj();
				this.guv(1f, delegate
				{
					this.mkg?.Invoke();
				});
			}
		}
		else
		{
			wn.hpk("RestartTutorialInitiation");
			Game.eay(1f);
		}
	}

	[CompilerGenerated]
	private bool fgs()
	{
		if (mkh.pav)
		{
			return Game.Shuttle.transform.position.z > Game.Court.pci + 3f;
		}
		return false;
	}

	[CompilerGenerated]
	private void fgt()
	{
		this.mkg?.Invoke();
	}
}
