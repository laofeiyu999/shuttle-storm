using System.Collections.Generic;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterBlendShapeCustomization : MonoBehaviour
{
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	private class om
	{
		public string mnd;

		public int[] mne;

		public float mnf;

		public float mng;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float BLEND_SHAPE_TRANSITION_TIME = 0.5f;

	private List<SkinnedMeshRenderer> mnh;

	private readonly Dictionary<string, float> mni = new Dictionary<string, float>();

	private readonly Dictionary<string, float> mnj = new Dictionary<string, float>();

	private readonly List<string> mnk = new List<string>();

	private readonly List<om> mnl = new List<om>();

	private int mnm;

	private bool mnn;

	private readonly Dictionary<string, int[]> mno = new Dictionary<string, int[]>();

	private float? mnp;

	public List<SkinnedMeshRenderer> pjd
	{
		get
		{
			return mnh;
		}
		set
		{
			mnh = value;
			mno.Clear();
			mnn = true;
		}
	}

	public void fra(Dictionary<string, int> a)
	{
		frc(mni, a);
		mnn = true;
	}

	public void frb(Dictionary<string, int> a)
	{
		if (!frd(mnj, a))
		{
			frc(mnj, a);
			mnn = true;
			fre();
			mnp = Time.time;
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void LateUpdate()
	{
		if (mnh == null || mnh.Count == 0)
		{
			return;
		}
		if (mnn)
		{
			fre();
		}
		if (mnm == 0)
		{
			return;
		}
		float num = 1f;
		if (mnp.HasValue)
		{
			num = (Time.time - mnp.Value) / 0.5f;
			if (num >= 1f)
			{
				num = 1f;
				mnp = null;
			}
		}
		for (int i = 0; i < mnm; i++)
		{
			om om = mnl[i];
			float value = ((num >= 1f) ? om.mnf : Mathf.Lerp(om.mng, om.mnf, num));
			int[] mne = om.mne;
			int num2 = Mathf.Min(mnh.Count, mne.Length);
			for (int j = 0; j < num2; j++)
			{
				if (mne[j] >= 0)
				{
					mnh[j].SetBlendShapeWeight(mne[j], value);
				}
			}
		}
	}

	private void frc(Dictionary<string, float> a, Dictionary<string, int> b)
	{
		a.Clear();
		if (b == null)
		{
			return;
		}
		foreach (KeyValuePair<string, int> item in b)
		{
			a[item.Key] = item.Value;
			if (!mnk.Contains(item.Key))
			{
				mnk.Add(item.Key);
			}
		}
	}

	private bool frd(Dictionary<string, float> a, Dictionary<string, int> b)
	{
		if (b == null)
		{
			return a.Count == 0;
		}
		if (a.Count != b.Count)
		{
			return false;
		}
		foreach (KeyValuePair<string, int> item in b)
		{
			if (!a.TryGetValue(item.Key, out var value) || value != (float)item.Value)
			{
				return false;
			}
		}
		return true;
	}

	private void fre()
	{
		if (mnh == null || mnh.Count == 0)
		{
			return;
		}
		mnn = false;
		mnm = 0;
		foreach (string item in mnk)
		{
			if (!mnj.TryGetValue(item, out var value) && !mni.TryGetValue(item, out value))
			{
				value = 0f;
			}
			om om;
			if (mnm < mnl.Count)
			{
				om = mnl[mnm];
			}
			else
			{
				om = new om();
				mnl.Add(om);
			}
			mnm++;
			om.mnd = item;
			om.mnf = value;
			om.mne = frf(item);
			om.mng = frg(om);
		}
	}

	private int[] frf(string a)
	{
		if (mno.TryGetValue(a, out var value))
		{
			return value;
		}
		value = new int[mnh.Count];
		for (int i = 0; i < mnh.Count; i++)
		{
			Mesh mesh = ((mnh[i] != null) ? mnh[i].sharedMesh : null);
			value[i] = ((mesh != null) ? mesh.GetBlendShapeIndex(a) : (-1));
		}
		mno[a] = value;
		return value;
	}

	private float frg(om a)
	{
		int num = Mathf.Min(mnh.Count, a.mne.Length);
		for (int i = 0; i < num; i++)
		{
			if (a.mne[i] >= 0)
			{
				return mnh[i].GetBlendShapeWeight(a.mne[i]);
			}
		}
		return a.mnf;
	}
}
