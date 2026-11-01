using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterBotAI : CharacterComponent
{
	private Coroutine lge;

	public void dgq()
	{
		if (base.ozc.lhi.lju == null && base.ozn?.lhi?.lju == null)
		{
			dgw();
		}
		if (base.ozd.pdy.IsDouble && !base.ozn.IsBot)
		{
			lr a = base.ozc.lhm.dqp();
			lr b = base.ozn.lhm.dqp(a: true);
			if (base.ozc.dng(a, b))
			{
				base.ozc.dne(a);
			}
		}
	}

	public void dgr()
	{
		this.guv(0.5f, dgs);
	}

	private void dgs()
	{
		if (base.ozd.peb || base.ozc.lhi.lju != null)
		{
			return;
		}
		MatchAbsenceWatcher matchAbsenceWatcher = MatchAbsenceWatcher.lxr;
		if ((object)matchAbsenceWatcher != null && matchAbsenceWatcher.lxt)
		{
			this.gvd(delegate
			{
				MatchAbsenceWatcher matchAbsenceWatcher2 = MatchAbsenceWatcher.lxr;
				return (object)matchAbsenceWatcher2 == null || !matchAbsenceWatcher2.lxt;
			}, dgs);
		}
		else
		{
			base.ozc.lhi.dtj();
		}
	}

	public void dgt(ShotType a)
	{
		if (base.ozi && base.ozd.pdt)
		{
			float num = hr.ddt(base.ozd.pdy.Difficulty);
			if (base.ozd.pdw)
			{
				num = 0f;
			}
			if (base.ozd.pea == 1 && a == ShotType.Smash)
			{
				num = 0f;
			}
			else if (a == ShotType.Smash)
			{
				num *= 0.5f;
			}
			num /= base.ozd.pdy.plt;
			lge = this.gux(num, dgw);
		}
	}

	public void dgu()
	{
		if (lge != null)
		{
			StopCoroutine(lge);
		}
	}

	public void dgv()
	{
		(Vector3, float?)? tuple = dgx();
		if (tuple.HasValue)
		{
			base.ozc.lhg.dov(tuple.Value.Item1);
			if (base.ozc.lhj != null)
			{
				base.ozc.lhj.emd(tuple.Value.Item1);
			}
		}
	}

	public void dgw()
	{
		if (!base.ozi || !base.ozd.pdt || base.ozf?.pgu == null || !base.ozc.pay || base.ozc.lhi.lju != null)
		{
			return;
		}
		CharacterManager characterManager = base.ozn;
		if ((object)characterManager != null && characterManager.lhi?.lju?.pbl == false)
		{
			return;
		}
		if (!base.ozf.pgu.meg)
		{
			base.ozc.lht = true;
			return;
		}
		if (dgz())
		{
			base.ozc.lht = true;
			Vector3 mdz = base.ozf.pgu.mdz;
			Vector3 mef = base.ozf.pgu.mef;
			float? num = dha(base.transform.position, mdz, mef);
			if (base.ozf.pgu.mec.Any((KeyValuePair<float, Vector3> a) => a.Value.y <= (float)base.ozc.Player.CharacterInfo.height + 0.3f && this.jvu(a.Value) < 0.5f))
			{
				Vector3 a2 = base.transform.position + Quaternion.Euler(0f, (num > 0f) ? 90 : (-90), 0f) * (mef - mdz).normalized;
				dhb(a2);
				return;
			}
			bool flag = true;
			if (base.ozd.pdy.IsDouble)
			{
				bool num2 = base.ozd.pea > 1 || base.ozc.pat;
				bool flag2 = base.ozd.pea == 1 && base.ozc.pat;
				flag = num2 && (flag2 || (mef - base.transform.position).magnitude < (mef - base.ozn.transform.position).magnitude);
			}
			if (flag)
			{
				Vector3 a3 = mef + Quaternion.Euler(0f, (num > 0f) ? 90 : (-90), 0f) * (mef - mdz).normalized;
				dhb(a3);
			}
			return;
		}
		lr lr2 = base.ozc.lhm.dqp();
		if (base.ozd.pdy.IsDouble)
		{
			lr lr3 = base.ozn.lhm.dqp(a: true);
			bool flag3 = base.ozd.pea > 1 || base.ozc.pat;
			bool flag4 = base.ozd.pea == 1 && base.ozc.pat;
			if (lr2 == null && lr3 == null)
			{
				base.ozc.lht = true;
				base.ozn.lht = true;
				lr2 = base.ozc.lhm.dqx();
				lr3 = base.ozn.lhm.dqx();
			}
			if (lr2 == null && lr3 == null)
			{
				Debug.Log("None of the players of team " + (base.ozk ? "A" : "B") + " can reach the shuttle");
				return;
			}
			if (flag3 && (flag4 || base.ozc.dng(lr2, lr3)))
			{
				base.ozc.dne(lr2);
				return;
			}
			Vector3 vector = base.oze.dvp(base.ozl).center.jvo();
			Vector3 a4 = Vector3.zero;
			if (lr3 != null)
			{
				float num3 = Mathf.Abs(lr3.ljf.z - base.oze.pci);
				a4 = ((num3 < CourtManager.halfCourtLength / 3f) ? new Vector3(base.oze.pcc.x - (lr3.ljf.x - base.oze.pcc.x) * 0.5f / (base.oze.pcd / 2f), 0f, base.oze.pci + 5.5f * (float)((!base.ozl) ? 1 : (-1))) : ((!(num3 < CourtManager.halfCourtLength * 2f / 3f)) ? new Vector3(base.oze.pcc.x + (lr3.ljf.x - base.oze.pcc.x) * 0.7f / (base.oze.pcd / 2f), 0f, base.oze.pci + 2.8f * (float)((!base.ozl) ? 1 : (-1))) : ((!(Mathf.Abs(lr3.mbq.x - base.oze.pcc.x) < 1f)) ? new Vector3(base.oze.pcc.x + 1.1f * (float)((!(lr3.mbq.x > base.oze.pcc.x)) ? 1 : (-1)), 0f, base.oze.pci + 3.7f * (float)((!base.ozl) ? 1 : (-1))) : new Vector3(base.oze.pcc.x, 0f, lr3.ljf.z + (float)((!(base.transform.position.z < base.ozn.transform.position.z)) ? 1 : (-1))))));
				Vector3 vector2 = vector - lr3.mbq;
				if (vector2.magnitude < 1.5f)
				{
					vector2 = vector2.normalized * 1.5f;
				}
				float? num4 = dha(base.transform.position, base.ozn.transform.position, lr3.mbq);
				float? num5 = dha(a4, base.ozn.transform.position, lr3.mbq);
				if ((num4.HasValue && Mathf.Abs(num4.Value) < 0.8f) || (num5.HasValue && Mathf.Abs(num5.Value) < 0.8f))
				{
					a4 += Quaternion.Euler(0f, (num4 > 0f) ? 90 : (-90), 0f) * (lr3.mbq - base.ozn.transform.position).normalized * 0.8f;
				}
				dhb(a4);
			}
			return;
		}
		if (lr2 == null)
		{
			base.ozc.lht = true;
			lr2 = base.ozc.lhm.dqx();
		}
		if (lr2 == null)
		{
			KeyValuePair<float, Vector3> keyValuePair = base.ozf.pgu.mec.LastOrDefault((KeyValuePair<float, Vector3> a) => a.Value.y > 1f);
			float num6 = ((keyValuePair.Value.x > base.transform.position.x) ? (-0.5f) : 0.5f);
			if (keyValuePair.Key > 0f)
			{
				Vector3 a5 = new Vector3(keyValuePair.Value.x + num6, 0f, base.ozl ? Math.Min(keyValuePair.Value.z, base.oze.pci - 1f) : Math.Max(keyValuePair.Value.z, base.oze.pci + 1f));
				dhb(a5);
			}
		}
		else
		{
			base.ozc.dne(lr2);
		}
	}

	public (Vector3, float?)? dgx()
	{
		if (base.ozf?.pgu == null)
		{
			return null;
		}
		if (base.ozd.pdt && base.ozi)
		{
			KeyValuePair<float, Vector3> keyValuePair = base.ozf.pgu.mec.LastOrDefault((KeyValuePair<float, Vector3> a) => a.Value.y > 0.5f);
			if (keyValuePair.Key > 0f)
			{
				lq lq2 = (from a in base.ozc.pax
					select a.lhi.lju into a
					where a != null
					select a).FirstOrDefault();
				if (lq2 == null)
				{
					lq2 = (from a in base.ozc.pax
						select a.lhm.dqp() into a
						where a != null
						orderby a.lje
						select a).FirstOrDefault();
				}
				bool flag = (lq2 != null && lq2.ljf.y > 2.55f) || (lq2 != null && lq2.ljf.y > 1.55f && base.oze.dvu(lq2.ljf) >= 10f);
				float? num = ((lq2 != null) ? new float?(Mathf.Abs(lq2.ljf.z - base.oze.pci)) : null);
				Vector3? vector = null;
				if (base.ozd.pdy.IsDouble)
				{
					if (flag)
					{
						Debug.Log("Team " + (base.ozk ? "A" : "B") + " go defense");
						float num2 = ((lq2 != null) ? ((lq2.ljf.x - base.oze.pcc.x) * 0.7f / (base.oze.pcd / 2f)) : 0f);
						bool flag2 = base.transform.position.x < base.ozn.transform.position.x;
						if (base.ozc.paq.HasValue && base.ozc.paq < 1f)
						{
							flag2 = base.transform.position.x + RandomHelper.giz(-1f, 1f) * (1f - base.ozc.paq.Value) < base.ozn.transform.position.x;
						}
						vector = new Vector3(base.oze.pcc.x + 1.1f * (float)((!flag2) ? 1 : (-1)) + num2, 0f, base.oze.pci + 3.7f * (float)((!base.ozl) ? 1 : (-1)));
						float num3 = base.ozc.lhg.dpb(vector.Value);
						if (lq2?.lje - Time.time < num3 / 2f)
						{
							vector = null;
						}
					}
					else
					{
						Debug.Log("Team " + (base.ozk ? "A" : "B") + " go attack");
						Vector3 b = lq2?.ljf ?? keyValuePair.Value;
						float num4 = Vector3.Distance(base.transform.position, b);
						float num5 = Vector3.Distance(base.ozn.transform.position, b);
						if (base.ozc.paq.HasValue && base.ozc.paq < 1f)
						{
							num4 += RandomHelper.giz(-1f, 1f) * (1f - base.ozc.paq.Value);
						}
						bool flag3 = num4 < num5;
						float num6 = (b.x - base.oze.pcc.x) * 0.5f / (base.oze.pcd / 2f);
						vector = new Vector3(base.oze.pcc.x + num6, 0f, base.oze.pci + (flag3 ? 2.3f : 5.5f) * (float)((!base.ozl) ? 1 : (-1)));
					}
				}
				else
				{
					float num7 = ((lq2 != null) ? ((lq2.ljf.x - base.oze.pcc.x) * 0.7f / (base.oze.pcd / 2f)) : 0f);
					vector = new Vector3(base.oze.pcc.x + num7, 0f, base.oze.pci - (flag ? 3.5f : ((num <= CourtManager.frontZoneLength) ? 2.7f : 3.1f)) * (float)(base.ozl ? 1 : (-1)));
				}
				if (vector.HasValue)
				{
					return (dgy(vector.Value), lq2?.lje);
				}
			}
		}
		return null;
	}

	private Vector3 dgy(Vector3 a)
	{
		if (base.ozi)
		{
			CharacterManager characterManager = base.ozn;
			if ((object)characterManager == null || characterManager.IsBot)
			{
				float num = hr.ded(base.ozd.pdy.Difficulty);
				if (num == 0f)
				{
					return a;
				}
				float num2 = RandomHelper.giy() * num * (base.ozd.pdy.IsDouble ? 0.6f : 1f);
				Debug.Log($"Player {base.name} reposition with incorrect distance of {num2}");
				return a + (base.transform.position.jvp() - a).normalized * num2;
			}
		}
		return a;
	}

	private bool dgz()
	{
		Vector3 mef = base.ozf.pgu.mef;
		float b = hr.ddu(base.ozd.pdy.Difficulty);
		return !((base.ozd.pea == 1) ? base.oze.dvq(base.ozl, base.ozd.ped) : base.oze.pck).jvq(b).Contains(mef.jvn());
	}

	private float? dha(Vector3 a, Vector3 b, Vector3 c)
	{
		float num = Vector3.Distance(b, a);
		float num2 = Vector2.SignedAngle((a - b).jvn(), (c - b).jvn());
		if (num2 > 90f)
		{
			return null;
		}
		if (Vector3.Angle(b - c, a - c) > 90f)
		{
			return null;
		}
		return num * Mathf.Sin(num2 * (MathF.PI / 180f));
	}

	private void dhb(Vector3 a)
	{
		base.ozc.lhg.dov(a);
		if (base.ozc.lhj != null)
		{
			base.ozc.lhj.emd(a);
		}
	}

	[CompilerGenerated]
	private bool dhc(KeyValuePair<float, Vector3> a)
	{
		if (a.Value.y <= (float)base.ozc.Player.CharacterInfo.height + 0.3f)
		{
			return this.jvu(a.Value) < 0.5f;
		}
		return false;
	}
}
