using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Assets.Scripts.Utils;
using FSG.MeshAnimator;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class StadiumSpectators : MonoBehaviour
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	public class mj
	{
		public List<MeshAnimatorBase> mfl = new List<MeshAnimatorBase>();

		public List<MeshAnimatorBase> mfm = new List<MeshAnimatorBase>();
	}

	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate struct classes' settings.")]
	private struct CrossfadeRequest
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public MeshAnimatorBase Animator;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public string Animation;

		[NotObfuscatedCause("Because of the deactivated 'Obfuscate struct fields' setting.")]
		public float Duration;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool NoSpectators;

	private const int mfu = 72;

	private const int mfv = 2;

	private const int mfw = 5;

	private const float mfx = 0.3f;

	private const float mfy = 0.35f;

	private const int mfz = 4;

	private const float mga = 0.1f;

	private const string mgb = "Materials/Spectators";

	private static List<string> mgc = new List<string> { "Male 1", "Male 2", "Male 3", "Male 4", "Female 1" };

	private static List<string> mgd = new List<string> { "SittingIdle", "SittingIdle2", "SittingIdle3" };

	private static List<string> mge = new List<string> { "SittingClap", "SittingClap2", "SittingClap3", "SittingClap4", "SittingYell" };

	private static List<string> mgf = new List<string> { "StandingCheering", "StandingClap" };

	private static List<string> mgg = new List<string> { "SittingYell", "StandingCheering", "StandingClap" };

	private bool mgh;

	private bool mgi;

	private bool mgj;

	private bool mgk;

	private Dictionary<int, mj> mgl = new Dictionary<int, mj>();

	private List<MeshAnimatorBase> mgm = new List<MeshAnimatorBase>();

	private Queue<CrossfadeRequest> mgn = new Queue<CrossfadeRequest>();

	private Coroutine mgo;

	private int mgp = 2;

	public bool phi => mgh;

	public bool phj
	{
		get
		{
			return mgj;
		}
		set
		{
			if (mgj != value)
			{
				foreach (KeyValuePair<int, mj> item in mgl)
				{
					foreach (MeshAnimatorBase item2 in item.Value.mfl)
					{
						item2.speed = (value ? 1 : 0);
					}
				}
				if (value)
				{
					fbo();
				}
			}
			mgj = value;
		}
	}

	public bool phk
	{
		get
		{
			return mgk;
		}
		set
		{
			if (mgk != value)
			{
				foreach (KeyValuePair<int, mj> item in mgl)
				{
					foreach (MeshAnimatorBase item2 in item.Value.mfm)
					{
						item2.speed = (value ? 1 : 0);
					}
				}
				if (value)
				{
					fbo();
				}
			}
			mgk = value;
		}
	}

	public void fbh(bool a, bool b = false)
	{
		bool num = a != mgh;
		mgh = a;
		mgi = a && b;
		if (num && mgl.Any())
		{
			mgn.Clear();
			for (int i = 0; i < mgc.Count; i++)
			{
				fbp(i, a);
			}
			fbs();
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Start()
	{
		if (NoSpectators)
		{
			return;
		}
		Stadium component = GetComponent<Stadium>();
		List<GameObject> list = new List<GameObject>();
		for (int i = 0; i < mgc.Count; i++)
		{
			list.Add(Resources.Load<GameObject>("Characters/Spectators/" + mgc[i]));
		}
		Material[] b = Resources.LoadAll<Material>("Materials/Spectators");
		GameObject gameObject = new GameObject("Spectators");
		List<int> list2 = new List<int>();
		int num = 0;
		Vector3 position = GameManager.Current.Court.transform.position;
		int qualityLevel = QualitySettings.GetQualityLevel();
		if (qualityLevel <= 1)
		{
			return;
		}
		float num2 = 0.9f;
		if (qualityLevel == 2)
		{
			num2 = 0.5f;
		}
		if (qualityLevel == 3)
		{
			num2 = 0.7f;
		}
		if (SystemInfo.systemMemorySize < 16000)
		{
			num2 = Mathf.Min(num2, 0.7f);
		}
		if (SystemInfo.systemMemorySize < 10000)
		{
			num2 = Mathf.Min(num2, 0.5f);
		}
		foreach (Stadium.Seat item in component.phb)
		{
			float num3 = num2;
			float num4 = Vector3.Distance(item.Position, position);
			if (qualityLevel < 5)
			{
				num3 *= 1f - (num4 - 15f) * (1f - num2) / 15f;
			}
			if (Random.Range(0f, 1f) > num3)
			{
				continue;
			}
			do
			{
				num = Random.Range(0, list.Count);
			}
			while (list2.Contains(num));
			GameObject gameObject2 = Object.Instantiate(list[num], item.Position + new Vector3(0f, -0.4f, 0f), Quaternion.Euler(0f, item.Angle, 0f), gameObject.transform);
			MeshAnimatorBase component2 = gameObject2.GetComponent<MeshAnimatorBase>();
			fbm(gameObject2, b);
			if (item.Side == Stadium.Seat.VisibleFromSide.SideA)
			{
				gameObject2.layer = 21;
			}
			if (item.Side == Stadium.Seat.VisibleFromSide.SideB)
			{
				gameObject2.layer = 20;
			}
			if (item.Side == Stadium.Seat.VisibleFromSide.None || num4 > 30f || Random.Range(0f, 1f) > Mathf.Min(num3, 0.7f))
			{
				mgm.Add(component2);
				continue;
			}
			mj mj = mgl.GetValueOrDefault(num);
			if (mj == null)
			{
				mj = new mj();
				mgl.Add(num, mj);
			}
			if (item.Side == Stadium.Seat.VisibleFromSide.SideA)
			{
				mj.mfl.Add(component2);
			}
			else
			{
				mj.mfm.Add(component2);
			}
		}
		StartCoroutine(fbn());
	}

	private void fbm(GameObject a, Material[] b)
	{
		if (b.Length == 0)
		{
			return;
		}
		MeshRenderer component = a.GetComponent<MeshRenderer>();
		if (!(component == null))
		{
			Material material = b.gtk();
			Material[] sharedMaterials = component.sharedMaterials;
			for (int i = 0; i < sharedMaterials.Length; i++)
			{
				sharedMaterials[i] = material;
			}
			component.sharedMaterials = sharedMaterials;
		}
	}

	private IEnumerator fbn()
	{
		yield return new WaitForSeconds(0.5f);
		foreach (MeshAnimatorBase item in mgm)
		{
			item.speed = 0f;
			item.enabled = false;
			item.gameObject.isStatic = true;
		}
		foreach (mj value in mgl.Values)
		{
			foreach (MeshAnimatorBase item2 in value.mfl)
			{
				item2.speed = (phj ? 1 : 0);
			}
			foreach (MeshAnimatorBase item3 in value.mfm)
			{
				item3.speed = (phk ? 1 : 0);
			}
		}
		foreach (mj value2 in mgl.Values)
		{
			MeshAnimatorBase meshAnimatorBase = value2.mfl.Concat(value2.mfm).FirstOrDefault();
			if (!(meshAnimatorBase == null))
			{
				meshAnimatorBase.izu(4);
				yield return null;
			}
		}
	}

	private void fbo()
	{
		if (mgl.Any())
		{
			mgn.Clear();
			for (int i = 0; i < mgc.Count; i++)
			{
				fbp(i, false);
			}
			fbs();
		}
	}

	private void fbp(int a, bool? b = null)
	{
		if (!b.HasValue)
		{
			b = mgh;
		}
		float c = (b.Value ? 0.3f : 0.35f);
		if (mgj)
		{
			fbq(mgl[a].mfl, b.Value, c);
		}
		if (mgk)
		{
			fbq(mgl[a].mfm, b.Value, c);
		}
	}

	private void fbq(List<MeshAnimatorBase> a, bool b, float c)
	{
		foreach (MeshAnimatorBase item in a)
		{
			mgn.Enqueue(new CrossfadeRequest
			{
				Animator = item,
				Animation = fbr(b),
				Duration = c
			});
		}
	}

	private string fbr(bool a)
	{
		if (!a)
		{
			return mgd.gtk();
		}
		if (mgi && Random.Range(0f, 1f) < 0.1f)
		{
			return mgf.gtk();
		}
		return mge.gtk();
	}

	private void fbs()
	{
		mgp = Mathf.Clamp(Mathf.CeilToInt((float)mgn.Count / 72f), 2, 5);
		if (mgo == null && mgn.Count > 0)
		{
			mgo = StartCoroutine(fbt());
		}
	}

	private IEnumerator fbt()
	{
		while (mgn.Count > 0)
		{
			for (int i = 0; i < mgp; i++)
			{
				if (mgn.Count <= 0)
				{
					break;
				}
				CrossfadeRequest crossfadeRequest = mgn.Dequeue();
				if (!(crossfadeRequest.Animator == null))
				{
					crossfadeRequest.Animator.izt(crossfadeRequest.Animation, crossfadeRequest.Duration);
					if (!mgg.Contains(crossfadeRequest.Animation))
					{
						crossfadeRequest.Animator.iyn(Random.Range(0f, 1f));
					}
				}
			}
			yield return null;
		}
		mgo = null;
	}
}
