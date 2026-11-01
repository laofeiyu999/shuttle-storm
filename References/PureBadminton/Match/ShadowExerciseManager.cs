using System.Collections.Generic;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ShadowExerciseManager : BaseExerciseManager<tq>
{
	private List<Vector2> mhv = new List<Vector2>();

	private Vector2 mhw = new Vector2(0f, -3.8f);

	private Vector2? mhx;

	public override void fcf()
	{
		base.fcf();
		if (base.phm.ncm.HasFlag(tq.ShadowZones.FrontCorners))
		{
			mhv.Add(new Vector2(2.2f, -1.5f));
			mhv.Add(new Vector2(-2.2f, -1.5f));
		}
		if (base.phm.ncm.HasFlag(tq.ShadowZones.Side))
		{
			mhv.Add(new Vector2(2.2f, -3.8f));
			mhv.Add(new Vector2(-2.2f, -3.8f));
		}
		if (base.phm.ncm.HasFlag(tq.ShadowZones.RearCorners))
		{
			mhv.Add(new Vector2(2.2f, -6f));
			mhv.Add(new Vector2(-2.2f, -6f));
		}
		MainCharacter.AllowedAction = CharacterManager.PossibleAction.Move;
		Score = 0;
		mhx = mhv.gtk();
		fck(mhx.Value);
	}

	public override void fch()
	{
		base.fch();
		mhx = null;
		fcl();
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public override void FixedUpdate()
	{
		if (base.mgs && mhx.HasValue && MainCharacter.jvv(base.phl.Court.transform.position.jvn() + mhx.Value) < 1f)
		{
			if (mhx == mhw)
			{
				mhx = mhv.gtk();
			}
			else
			{
				mhx = mhw;
				fci();
				Vector3 c = new Vector3(MainCharacter.transform.position.x, (float)MainCharacter.Player.CharacterInfo.height / 100f, MainCharacter.transform.position.z);
				base.phl.ebm("+1", qh.mrr, c, new Vector2(0f, 20f));
			}
			fck(mhx.Value);
		}
	}
}
