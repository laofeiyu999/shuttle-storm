using System;
using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[DefaultExecutionOrder(-100)]
[RequireComponent(typeof(Rigidbody))]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ShuttleTrajectoryRunner : MonoBehaviour
{
	[Tooltip("Minimum Y for the Rigidbody centre — prevents the shuttle from being embedded in the floor when at rest, since the runner drives a kinematic body that bypasses Unity's penetration resolution.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float groundClearance = 0.03f;

	[Tooltip("Seconds over which a corrected trajectory's position discrepancy is absorbed, instead of teleporting the shuttle. Only the rendered position is smoothed — the trajectory data itself switches instantly.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float blendDuration = 0.1f;

	[Tooltip("Discrepancy above which a correction snaps instead of blending. Blending a several-metre correction would fling the shuttle across the court along a path it never actually takes.")]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public float blendSnapThreshold = 1.5f;

	private Rigidbody mel;

	private bool mem;

	private float? men;

	private Vector3 meo;

	private float mep;

	private int meq;

	private int mer;

	private bool mev;

	public me mei { get; private set; }

	public Vector3 mej { get; private set; }

	public Vector3 mek { get; private set; }

	public bool pgz
	{
		get
		{
			if (mem)
			{
				return mei != null;
			}
			return false;
		}
	}

	public event Action<me.NetHit> mes;

	public event Action<me.FloorBounce> met;

	public event Action meu;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		mel = GetComponent<Rigidbody>();
	}

	public void ezk(me a, bool b = false)
	{
		meo = Vector3.zero;
		Vector3 c;
		if (b && mem && a.meb.Count > 0)
		{
			Vector3 vector = base.transform.position - ezo(a, Time.time, out c);
			if (vector.magnitude <= blendSnapThreshold)
			{
				meo = vector;
			}
		}
		mep = Time.time;
		mei = a;
		mem = true;
		men = null;
		meq = 0;
		mer = 0;
		mev = false;
		mel.isKinematic = true;
		mek = ((a.meb.Count > 0) ? ezo(a, Time.time, out c) : a.mdz);
		base.transform.position = mek + meo;
		mej = a.mea;
	}

	public void ezl()
	{
		mem = false;
		mei = null;
		mej = Vector3.zero;
		meo = Vector3.zero;
	}

	public void ezm()
	{
		if (mem && !men.HasValue)
		{
			men = Time.time;
		}
	}

	public void ezn()
	{
		if (men.HasValue)
		{
			float num = Time.time - men.Value;
			men = null;
			if (mei != null)
			{
				mei = mei.eys(num);
			}
			mep += num;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void FixedUpdate()
	{
		if (!pgz || men.HasValue)
		{
			return;
		}
		float time = Time.time;
		SortedList<float, Vector3> meb = mei.meb;
		if (meb.Count == 0)
		{
			return;
		}
		if (time >= meb.Keys[meb.Count - 1])
		{
			mek = ezr(meb.Values[meb.Count - 1]);
			mej = Vector3.zero;
			ezq(time);
			if (!mev)
			{
				mev = true;
				this.meu?.Invoke();
			}
		}
		else
		{
			mek = ezo(mei, time, out var c);
			mej = c;
			ezq(time);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (!pgz || men.HasValue)
		{
			return;
		}
		float time = Time.time;
		SortedList<float, Vector3> meb = mei.meb;
		if (meb.Count != 0)
		{
			if (time >= meb.Keys[meb.Count - 1])
			{
				base.transform.position = ezr(meb.Values[meb.Count - 1] + ezp(time));
			}
			else
			{
				base.transform.position = ezo(mei, time, out var _) + ezp(time);
			}
		}
	}

	private static Vector3 ezo(me a, float b, out Vector3 c)
	{
		SortedList<float, Vector3> meb = a.meb;
		int index = meb.Count - 1;
		if (b >= meb.Keys[index])
		{
			c = Vector3.zero;
			return meb.Values[index];
		}
		int num = ezs(meb.Keys, b);
		int index2 = Mathf.Max(0, num - 1);
		float num2 = meb.Keys[index2];
		float num3 = meb.Keys[num];
		Vector3 vector = meb.Values[index2];
		Vector3 vector2 = meb.Values[num];
		float num4 = num3 - num2;
		float t = ((num4 > 1E-06f) ? ((b - num2) / num4) : 0f);
		c = ((num4 > 1E-06f) ? ((vector2 - vector) / num4) : Vector3.zero);
		return Vector3.Lerp(vector, vector2, t);
	}

	private Vector3 ezp(float a)
	{
		if (meo == Vector3.zero)
		{
			return Vector3.zero;
		}
		float num = a - mep;
		if (blendDuration <= 0f || num >= blendDuration)
		{
			meo = Vector3.zero;
			return Vector3.zero;
		}
		return meo * (1f - Mathf.SmoothStep(0f, 1f, num / blendDuration));
	}

	private void ezq(float a)
	{
		me me2 = mei;
		while (meq < me2.med.Count && a >= me2.med[meq].Time)
		{
			this.mes?.Invoke(me2.med[meq]);
			meq++;
		}
		while (mer < me2.mee.Count && a >= me2.mee[mer].Time)
		{
			this.met?.Invoke(me2.mee[mer]);
			mer++;
		}
	}

	private Vector3 ezr(Vector3 a)
	{
		if (a.y < groundClearance)
		{
			a.y = groundClearance;
		}
		return a;
	}

	private static int ezs(IList<float> a, float b)
	{
		int num = 0;
		int num2 = a.Count;
		while (num < num2)
		{
			int num3 = num + num2 >> 1;
			if (a[num3] <= b)
			{
				num = num3 + 1;
			}
			else
			{
				num2 = num3;
			}
		}
		return Mathf.Min(num, a.Count - 1);
	}
}
