using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class MultiShuttleExerciseManager : BaseExerciseManager<tr>
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private class mm
	{
		public ShuttleManager mgw;

		public Rect? mgx;

		public HighlightZone mgy;

		public ShotType mgz;

		public mm(ShuttleManager a, Rect? b, HighlightZone c)
		{
			mgw = a;
			mgx = b;
			mgy = c;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mn
	{
		public ShuttleManager mha;

		internal bool fcn(mm a)
		{
			return a.mgw == mha;
		}
	}

	[CompilerGenerated]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private sealed class mo
	{
		public ShuttleManager mhb;

		internal bool fco(mm a)
		{
			return a.mgw == mhb;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public ShuttleManager originalShuttle;

	private ShuttleLauncherManager mho;

	private HighlightZone mhp;

	private List<Vector2> mhq = new List<Vector2>();

	private Vector2 mhr = new Vector2(0f, -3.8f);

	private Vector2? mhs;

	private List<mm> mht = new List<mm>();

	private float mhu;

	[NotObfuscatedCause("Because the method might be a method called through reflection.")]
	public override void Initialize()
	{
		base.Initialize();
		originalShuttle = base.phl.Shuttle;
		if (base.phm.ncv != null)
		{
			BotCharacter.transform.position = new Vector3(base.phl.Court.pcm.center.x, BotCharacter.transform.position.y, base.phl.Court.pcm.center.y);
			BotCharacter.gameObject.SetActive(value: true);
		}
	}

	public override void fcf()
	{
		base.fcf();
		mho = UnityEngine.Object.Instantiate(ShuttleLauncherManager.phw);
		mho.fed(base.phm.nco);
		mho.transform.position = base.phl.Court.pcc + new Vector3(0f, 0f, base.phm.ncp);
		if (base.phm.ncp < -6f)
		{
			mho.gameObject.gvf(20);
		}
		bool flag = base.phm.ncv != null;
		if (flag)
		{
			mho.transform.rotation = Quaternion.Euler(0f, 180f, 0f);
		}
		Rect[] nda = base.phm.nda;
		if (nda != null && nda.Length == 1)
		{
			Rect rect = base.phm.nda.First();
			mhp = UnityEngine.Object.Instantiate(HighlightZone.peg);
			mhp.transform.position = base.phl.Court.pcc + rect.center.jvo();
			mhp.transform.localScale = new Vector3(rect.width, 1f, rect.height);
		}
		MainCharacter.lhr += fcx;
		BotCharacter.lhr += fcy;
		MainCharacter.AllowedAction = CharacterManager.PossibleAction.All;
		Score = 0;
		fdb(flag ? MainCharacter : BotCharacter);
		StartCoroutine(fda(1f));
	}

	public override void fch()
	{
		base.fch();
		base.phl.ebp();
		MainCharacter.lhr -= fcx;
		BotCharacter.lhr -= fcy;
		UnityEngine.Object.Destroy(mho.gameObject);
		foreach (mm item in mht)
		{
			if (!item.mgw.gameObject.gui())
			{
				item.mgw.eyk();
				UnityEngine.Object.Destroy(item.mgw.gameObject);
			}
			if ((bool)item.mgy && !item.mgy.gameObject.gui())
			{
				UnityEngine.Object.Destroy(item.mgy.gameObject);
			}
		}
		if (mhp != null)
		{
			UnityEngine.Object.Destroy(mhp.gameObject);
		}
		mhs = null;
		fcl();
		if (base.phl.Shuttle != null)
		{
			base.phl.Shuttle.eyk();
		}
		if (originalShuttle != null)
		{
			base.phl.Shuttle = originalShuttle;
		}
	}

	private void fcx(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		Rect[] nda = base.phm.nda;
		if ((nda == null || !nda.Any()) && fdf(b))
		{
			fci();
			base.phl.ebm("+1", qh.mrr, d, new Vector2(0f, 10f));
		}
		mm mm = mht.Last();
		mm.mgz = b;
		mm.mgw.mdm -= fdc;
		mm.mgw.mdm += fdd;
		Rect[] nda2 = base.phm.nda;
		if (nda2 != null && nda2.Length > 1)
		{
			me me2 = mm.mgw.pgu;
			float num = ((me2.mee.Count > 0) ? me2.mee[0].Time : me2.meb.Last().Key);
			mm.mgy.ece(num - Time.time + 0.3f);
		}
		fcz();
	}

	private void fcy(CharacterManager a, ShotType b, bga.bfw c, Vector3 d, Vector3 e)
	{
		if (base.phm.ncz)
		{
			return;
		}
		this.gux(0.1f, delegate
		{
			BotCharacter.AllowedAction = CharacterManager.PossibleAction.Move;
			BotCharacter.dmt();
			if (base.phm.ncy.HasValue)
			{
				Vector2 vector = base.phm.ncy.Value + base.phl.Court.pcc.jvn();
				BotCharacter.lhg.dov(new Vector3(vector.x, BotCharacter.transform.position.y, vector.y));
			}
		});
	}

	private void fcz()
	{
		mhu = Time.time;
		if (base.phm.ncn)
		{
			mhs = mhr;
			fck(mhs.Value);
		}
		else
		{
			StartCoroutine(fda(base.phm.ncq));
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public override void FixedUpdate()
	{
		if (base.phm.ncn && mhs.HasValue && Time.time - mhu > base.phm.ncq && MainCharacter.jvv(base.phl.Court.pcc.jvn() + mhs.Value) < 0.8f)
		{
			mhs = null;
			fcl();
			StartCoroutine(fda(0.2f));
		}
	}

	private IEnumerator fda(float a)
	{
		if (!base.mgs)
		{
			yield break;
		}
		Debug.Log("Launch Shuttle Coroutine");
		yield return new WaitForSeconds(a);
		if (base.mgs)
		{
			Rect? b = base.phm.nda?.gtk();
			HighlightZone highlightZone = mhp;
			Rect[] nda = base.phm.nda;
			if (nda != null && nda.Length > 1)
			{
				highlightZone = UnityEngine.Object.Instantiate(HighlightZone.peg);
				highlightZone.transform.position = base.phl.Court.pcc + b.Value.center.jvo();
				highlightZone.transform.localScale = new Vector3(b.Value.width, 1f, b.Value.height);
			}
			ShuttleManager shuttleManager = base.phl.ebg();
			mht.Add(new mm(shuttleManager, b, highlightZone));
			yield return new WaitForEndOfFrame();
			shuttleManager.transform.position = mho.fee();
			shuttleManager.mdm += fdc;
			bool flag = base.phm.ncv == null;
			ShotType shotType = base.phm.ncs.gtk();
			Vector3 a2 = lv.ewz(f: new Vector2(base.phm.ncu.gtk(), base.phm.nct.gtk()), a: ShotContext.ewu(base.phl), b: shuttleManager.pgv, c: shuttleManager.pgx, d: shotType, e: 0.7f);
			a2.z = (float)((!flag) ? 1 : (-1)) * Math.Abs(a2.z);
			if (base.phm.ncr.HasValue && shotType == ShotType.Drop)
			{
				a2.y += base.phm.ncr.Value;
			}
			shuttleManager.eyl(a2, flag);
			fdb(flag ? BotCharacter : MainCharacter);
			if (!flag)
			{
				BotCharacter.AllowedAction = CharacterManager.PossibleAction.All;
				BotCharacter.lhi.nextShotType = base.phm.ncv.gtk();
				BotCharacter.lhi.nextShotDirection = new Vector2(base.phm.ncw.gtk(), base.phm.ncx.gtk());
				BotCharacter.lhn.dgw();
			}
		}
	}

	private void fdb(CharacterManager a)
	{
		base.phl.StatsManager.eib();
		base.phl.StatsManager.eih((a == MainCharacter) ? BotCharacter : MainCharacter);
		base.phl.StatsManager.eih(a);
	}

	private void fdc(ShuttleManager a, Vector3 b, string c)
	{
		base.phl.ebp();
		a.mdm -= fdc;
		a.eyk();
		MainCharacter.lhi.dtg(a: true);
		MainCharacter.lhi.dtf();
		MainCharacter.lht = false;
		base.phl.Shuttle = null;
		fcz();
		StartCoroutine(fde(a, 1f));
	}

	private void fdd(ShuttleManager a, Vector3 b, string c)
	{
		base.phl.ebp();
		a.mdm -= fdd;
		mm mm = mht.Find((mm a) => a.mgw == a);
		if (mm != null && mm.mgx.HasValue && mm.mgx.Value.Contains((b - base.phl.Court.pcc).jvn()) && fdf(mm.mgz))
		{
			fci();
			base.phl.ebm("+1", qh.mrr, b, new Vector2(0f, 20f));
		}
		a.eyk();
		StartCoroutine(fde(a, 1f));
	}

	private IEnumerator fde(ShuttleManager a, float b)
	{
		mm mm = mht.Find((mm a) => a.mgw == a);
		if (mm != null)
		{
			mht.Remove(mm);
		}
		yield return new WaitForSeconds(b);
		if (mm != null && mm.mgy != mhp)
		{
			UnityEngine.Object.Destroy(mm.mgy.gameObject);
		}
		UnityEngine.Object.Destroy(a.gameObject);
	}

	private bool fdf(ShotType a)
	{
		ShotType[] ndb = base.phm.ndb;
		if (ndb != null && ndb.Any())
		{
			return base.phm.ndb.Contains(a);
		}
		return true;
	}

	[CompilerGenerated]
	private void fdg()
	{
		BotCharacter.AllowedAction = CharacterManager.PossibleAction.Move;
		BotCharacter.dmt();
		if (base.phm.ncy.HasValue)
		{
			Vector2 vector = base.phm.ncy.Value + base.phl.Court.pcc.jvn();
			BotCharacter.lhg.dov(new Vector3(vector.x, BotCharacter.transform.position.y, vector.y));
		}
	}
}
