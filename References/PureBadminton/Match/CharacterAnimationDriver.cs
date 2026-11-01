using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterAnimationDriver : CharacterComponent
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum AnimationKind
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Move,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Shot,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Idle,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		SplitStep,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Pose,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		MoveTransition
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	private struct PlayingAnimation
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public string Name;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float NormalizedTime;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public AnimationKind Kind;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public string FollowUpName;
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	public struct OffsetEntryState
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public Vector3 RemainingOffset;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float RemainingDuration;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float NotBefore;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float MOVE_TRANSITION_DURATION = 0.2f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float SHOT_TRANSITION_DURATION = 0.1f;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float SHOT_INSTANT_TRANSITION_DURATION = 0.05f;

	private MovementDeltaTable lfw;

	private PlayingAnimation lfx;

	private PlayingAnimation lfy;

	private float lfz;

	private float lga;

	private float lgb = 1f;

	private float lgc;

	private readonly List<OffsetEntryState> lgd = new List<OffsetEntryState>();

	public bool oys => lfx.Kind == AnimationKind.Move;

	public bool oyt => lfx.Kind == AnimationKind.Pose;

	public string oyu => lfx.Name;

	public string oyv
	{
		get
		{
			if (lfx.Kind != 0)
			{
				return string.Empty;
			}
			return lfx.Name ?? string.Empty;
		}
	}

	public float oyw => lfx.NormalizedTime;

	public string oyx
	{
		get
		{
			if (lfy.Kind != 0)
			{
				return string.Empty;
			}
			return lfy.Name ?? string.Empty;
		}
	}

	public float oyy => lfy.NormalizedTime;

	public float oyz => lfz;

	public float oza => base.ozh.GetCurrentAnimatorStateInfo(0).normalizedTime;

	public bool ozb => base.ozh.GetAnimatorTransitionInfo(0).duration > 0f;

	public bool dfl(string a)
	{
		return base.ozh.GetCurrentAnimatorStateInfo(0).IsName(a);
	}

	public bool dfo(string a)
	{
		switch (a)
		{
		case "RunningBackwards":
		case "StrafeRight-45":
		case "StrafeRight-90":
			if (lfx.Kind == AnimationKind.Move && lfx.Name == "Running")
			{
				return Time.time - lgc >= 0.3f;
			}
			break;
		}
		return false;
	}

	private float dfp(float a)
	{
		return a * base.ozc.pba;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		lfw = Resources.Load<MovementDeltaTable>("MovementDeltaTable");
		base.ozh.runtimeAnimatorController = Resources.Load<RuntimeAnimatorController>("PlayerController");
		base.ozh.speed = base.ozc.pba;
		base.ozh.applyRootMotion = false;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnEnable()
	{
		base.ozh.SetBool("IsMirrored", base.ozm);
	}

	private static bga.ShotAnimationStartPosition? dfq(PlayingAnimation a)
	{
		switch (a.Name)
		{
		case "Idle":
		case "DefenseSplitStep":
		case "SmashDefenseSplitStep":
			return bga.ShotAnimationStartPosition.Facing;
		case "IdleSideways":
			return bga.ShotAnimationStartPosition.RacketFootBackward;
		default:
			return null;
		}
	}

	private void dfr(PlayingAnimation a, float b)
	{
		if (lfx.Name != null && b > 0f)
		{
			lfy = lfx;
			lfz = b;
			lga = b;
		}
		else
		{
			lfy = default(PlayingAnimation);
			lfz = 0f;
		}
		lfx = a;
	}

	private static bool dfs(AnimationKind a)
	{
		if (a != 0 && a != AnimationKind.Idle)
		{
			return a == AnimationKind.Pose;
		}
		return true;
	}

	private Vector3 dft(ref PlayingAnimation a, float b)
	{
		if (a.Name == null)
		{
			return Vector3.zero;
		}
		if (a.Kind == AnimationKind.Idle || a.Kind == AnimationKind.Pose)
		{
			return Vector3.zero;
		}
		if (lfw == null)
		{
			return Vector3.zero;
		}
		MovementDeltaTable.AnimationEntry animationEntry = lfw.due(a.Name);
		if (animationEntry == null || animationEntry.clipLength <= 0f)
		{
			return Vector3.zero;
		}
		bool flag = dfs(a.Kind);
		if (!flag && a.NormalizedTime >= 1f)
		{
			return Vector3.zero;
		}
		float num = ((a.Kind == AnimationKind.Shot) ? lgb : ((a.Kind == AnimationKind.MoveTransition) ? 1f : base.ozc.lhg.pbf));
		float normalizedTime = a.NormalizedTime;
		float num2 = normalizedTime + b * num / animationEntry.clipLength;
		if (base.ozc.lhg.lih.HasValue || base.ozc.lhi.lju != null || !base.ozc.lhe.lgi || a.Kind == AnimationKind.Shot)
		{
			a.NormalizedTime = ((!flag) ? Mathf.Min(num2, 1f) : ((num2 >= 1f) ? (num2 - 1f) : num2));
		}
		if (a.Kind == AnimationKind.SplitStep)
		{
			return Vector3.zero;
		}
		Vector3 result = lfw.duf(a.Name, normalizedTime, num2, (float)base.ozc.Player.CharacterInfo.height / 100f);
		if (base.ozm)
		{
			result.x = 0f - result.x;
		}
		return result;
	}

	public void dfu(CharacterMovementManager.hu a, bool b = false)
	{
		if (a == null)
		{
			if (lfx.Kind == AnimationKind.Move)
			{
				dfv();
			}
		}
		else if ((lfx.Kind != 0 || !(lfx.Name == a.lhz)) && lfx.Kind != AnimationKind.MoveTransition)
		{
			base.ozh.CrossFadeInFixedTime(a.lhz, 0.2f);
			if (lfx.Kind == AnimationKind.Idle && lfy.Kind == AnimationKind.Shot && lfz > 0f)
			{
				lfx = new PlayingAnimation
				{
					Name = a.lhz,
					Kind = AnimationKind.Move,
					NormalizedTime = 0f
				};
				lgc = Time.time;
			}
			else if (!b && dfo(a.lhz))
			{
				base.ozh.CrossFadeInFixedTime("ForwardToBackwardLeft", 0.2f);
				dfr(new PlayingAnimation
				{
					Name = "ForwardToBackwardLeft",
					Kind = AnimationKind.MoveTransition,
					NormalizedTime = 0f,
					FollowUpName = "RunningBackwards"
				}, 0.2f);
			}
			else
			{
				dfr(new PlayingAnimation
				{
					Name = a.lhz,
					Kind = AnimationKind.Move,
					NormalizedTime = 0f
				}, 0.2f);
				lgc = Time.time;
			}
		}
	}

	public void dfv(string a = "Idle", float b = 0.2f)
	{
		AnimationKind animationKind = ((a == "Idle") ? AnimationKind.Idle : AnimationKind.Pose);
		if (lfx.Kind != animationKind || !(lfx.Name == a) || !base.ozh.GetCurrentAnimatorStateInfo(0).IsName(a))
		{
			base.ozh.CrossFadeInFixedTime(a, b);
			dfr(new PlayingAnimation
			{
				Name = a,
				Kind = animationKind,
				NormalizedTime = 0f
			}, b);
		}
	}

	public void dfw(string a, float b)
	{
		base.ozh.CrossFadeInFixedTime(a, b);
	}

	public void dfx(bga.bfw a)
	{
		bga.ShotAnimationStartPosition valueOrDefault = a.org.GetValueOrDefault();
		float num = ((dfq(lfx) == valueOrDefault || (lfz > 0f && dfq(lfy) == valueOrDefault)) ? 0.05f : 0.1f);
		base.ozh.CrossFadeInFixedTime(a.oqg, num);
		dfr(new PlayingAnimation
		{
			Name = a.oqg,
			Kind = AnimationKind.Shot,
			NormalizedTime = 0f
		}, num);
	}

	public void dfy(float a)
	{
		lgb = a;
		base.ozh.SetFloat("ShotSpeedFactor", a);
	}

	public void dfz(string a)
	{
		base.ozh.CrossFadeInFixedTime(a, 0.1f);
		dfr(new PlayingAnimation
		{
			Name = a,
			Kind = AnimationKind.SplitStep,
			NormalizedTime = 0f
		}, 0.1f);
	}

	public void dga()
	{
		base.ozh.CrossFadeInFixedTime("Idle", 0.2f);
		dfr(new PlayingAnimation
		{
			Name = "Idle",
			Kind = AnimationKind.Idle,
			NormalizedTime = 0f
		}, 0.2f);
	}

	public void dgb()
	{
		base.ozh.Play("Idle", 0, 0f);
		lfx = new PlayingAnimation
		{
			Name = "Idle",
			Kind = AnimationKind.Idle,
			NormalizedTime = 0f
		};
		lfy = default(PlayingAnimation);
		lfz = 0f;
		lgd.Clear();
		lgb = 1f;
		base.ozh.SetFloat("ShotSpeedFactor", 1f);
	}

	public void dgc(Vector3 a, float b, float c = 0f)
	{
		if (!(b <= 0f) && !(a == Vector3.zero))
		{
			lgd.Add(new OffsetEntryState
			{
				RemainingOffset = a,
				RemainingDuration = b,
				NotBefore = c
			});
		}
	}

	public Vector3 dgd(float a)
	{
		if (lfx.Name == null || lfw == null)
		{
			return Vector3.zero;
		}
		if (lfx.Kind == AnimationKind.Idle || lfx.Kind == AnimationKind.SplitStep)
		{
			return Vector3.zero;
		}
		MovementDeltaTable.AnimationEntry animationEntry = lfw.due(lfx.Name);
		if (animationEntry == null || animationEntry.clipLength <= 0f)
		{
			return Vector3.zero;
		}
		float num = dfp(Mathf.Max(0f, a - Time.time));
		if (num <= 0f)
		{
			return Vector3.zero;
		}
		float num2 = ((lfx.Kind == AnimationKind.Shot) ? lgb : base.ozc.lhg.pbf);
		float normalizedTime = lfx.NormalizedTime;
		float c = normalizedTime + num * num2 / animationEntry.clipLength;
		Vector3 direction = lfw.duf(lfx.Name, normalizedTime, c, (float)base.ozc.Player.CharacterInfo.height / 100f);
		if (base.ozm)
		{
			direction.x = 0f - direction.x;
		}
		return base.transform.TransformDirection(direction);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (base.ozc.paz)
		{
			return;
		}
		base.ozh.SetFloat("MoveSpeedFactor", (lfx.Kind == AnimationKind.MoveTransition) ? 1f : base.ozc.lhg.pbf);
		if (lfx.Kind == AnimationKind.Shot && lfx.Name != null && lfw != null)
		{
			MovementDeltaTable.AnimationEntry animationEntry = lfw.due(lfx.Name);
			if (animationEntry != null && animationEntry.clipLength > 0f)
			{
				float num = Mathf.Max(0.001f, lgb);
				float num2 = (1f - lfx.NormalizedTime) * animationEntry.clipLength / num;
				float num3 = 0f;
				CharacterShotManager.ib ib = base.ozc.lhi.lju;
				if (ib != null && ib.liz.oqg == lfx.Name)
				{
					float num4 = Mathf.Clamp01(dfp(ib.liz.oqi) * ib.liz.oqy / animationEntry.clipLength);
					num3 = Mathf.Min(1f, num4 + 0.03f * num / animationEntry.clipLength);
				}
				if (num2 <= 0.2f && lfx.NormalizedTime >= num3)
				{
					float fixedTransitionDuration = Mathf.Clamp(num2, 0.05f, 0.2f);
					base.ozh.CrossFadeInFixedTime("Idle", fixedTransitionDuration);
					lfy = lfx;
					lfz = fixedTransitionDuration;
					lga = fixedTransitionDuration;
					lfx = new PlayingAnimation
					{
						Name = "Idle",
						Kind = AnimationKind.Idle,
						NormalizedTime = 0f
					};
				}
			}
		}
		if (lfx.Kind == AnimationKind.SplitStep && lfx.NormalizedTime >= 1f)
		{
			dfv();
		}
		if (lfx.Kind == AnimationKind.MoveTransition && lfw != null)
		{
			MovementDeltaTable.AnimationEntry animationEntry2 = lfw.due(lfx.Name);
			if (animationEntry2 != null && animationEntry2.clipLength > 0f && (1f - lfx.NormalizedTime) * animationEntry2.clipLength <= 0.2f)
			{
				string followUpName = lfx.FollowUpName;
				base.ozh.CrossFadeInFixedTime(followUpName, 0.2f);
				dfr(new PlayingAnimation
				{
					Name = followUpName,
					Kind = AnimationKind.Move,
					NormalizedTime = 0f
				}, 0.2f);
				lgc = Time.time;
			}
		}
		float num5 = dfp(Time.fixedDeltaTime);
		Vector3 vector = dft(ref lfx, num5);
		Vector3 direction;
		if (lfz > 0f && lfy.Name != null)
		{
			Vector3 vector2 = dft(ref lfy, num5);
			float num6 = 1f - lfz / lga;
			direction = (1f - num6) * vector2 + num6 * vector;
			lfz = Mathf.Max(0f, lfz - num5);
			if (lfz <= 0f)
			{
				lfy.Name = null;
			}
		}
		else
		{
			direction = vector;
		}
		Vector3 vector3 = base.transform.TransformDirection(direction);
		Vector3 vector4 = dge(vector3, Time.fixedDeltaTime);
		bool flag = base.ozc.lhe.lgi && !base.ozc.lhg.lih.HasValue && base.ozc.lhi.lju == null;
		Vector3 vector5 = vector3 + vector4;
		if (vector5 != Vector3.zero && !flag)
		{
			base.ozg.MovePosition(base.ozg.position + vector5);
		}
	}

	private Vector3 dge(Vector3 a, float b)
	{
		if (lgd.Count == 0)
		{
			return Vector3.zero;
		}
		Vector3 zero = Vector3.zero;
		for (int num = lgd.Count - 1; num >= 0; num--)
		{
			OffsetEntryState a2 = lgd[num];
			if (a2.NotBefore > 0f && Time.time < a2.NotBefore)
			{
				lgd[num] = a2;
			}
			else
			{
				float magnitude = a.magnitude;
				float c = dgg(a2.RemainingDuration);
				Vector3 vector = dgf(ref a2, magnitude, c, b);
				zero += vector;
				if (a2.RemainingDuration <= 0f || a2.RemainingOffset.sqrMagnitude < 1E-08f)
				{
					lgd.RemoveAt(num);
				}
				else
				{
					lgd[num] = a2;
				}
			}
		}
		return zero;
	}

	public static Vector3 dgf(ref OffsetEntryState a, float b, float c, float d)
	{
		Vector3 vector;
		if (b > 1E-05f && c > 1E-05f)
		{
			float value = b / c;
			vector = a.RemainingOffset * Mathf.Clamp01(value);
		}
		else
		{
			float value2 = ((a.RemainingDuration > 0f) ? (d / a.RemainingDuration) : 1f);
			vector = a.RemainingOffset * Mathf.Clamp01(value2);
		}
		a.RemainingOffset -= vector;
		a.RemainingDuration -= d;
		return vector;
	}

	private float dgg(float a)
	{
		if (lfx.Name == null || lfw == null || a <= 0f)
		{
			return 0f;
		}
		if (lfx.Kind == AnimationKind.Idle || lfx.Kind == AnimationKind.SplitStep)
		{
			return 0f;
		}
		MovementDeltaTable.AnimationEntry animationEntry = lfw.due(lfx.Name);
		if (animationEntry == null || animationEntry.clipLength <= 0f)
		{
			return 0f;
		}
		float num = ((lfx.Kind == AnimationKind.Shot) ? lgb : base.ozc.lhg.pbf);
		float normalizedTime = lfx.NormalizedTime;
		float c = normalizedTime + dfp(a) * num / animationEntry.clipLength;
		return lfw.duf(lfx.Name, normalizedTime, c, (float)base.ozc.Player.CharacterInfo.height / 100f).magnitude;
	}

	public void dgh(string a, AnimationKind b, float c, string d, AnimationKind e, float f, float g, float h)
	{
		bool flag = a != lfx.Name;
		lfx = new PlayingAnimation
		{
			Name = a,
			Kind = b,
			NormalizedTime = c
		};
		lfy = new PlayingAnimation
		{
			Name = d,
			Kind = e,
			NormalizedTime = f
		};
		lfz = g;
		lga = h;
		if (!string.IsNullOrEmpty(a) && flag)
		{
			base.ozh.CrossFadeInFixedTime(a, (g > 0f) ? g : 0.2f);
		}
	}
}
