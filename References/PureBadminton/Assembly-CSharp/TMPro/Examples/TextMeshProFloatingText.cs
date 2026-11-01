using System.Collections;
using OPS.Obfuscator.Attribute;
using UnityEngine;

namespace TMPro.Examples;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class TextMeshProFloatingText : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Font TheFont;

	private GameObject kfn;

	private TextMeshPro kfo;

	private TextMesh kfp;

	private Transform kfq;

	private Transform kfr;

	private Transform kfs;

	private Vector3 kft = Vector3.zero;

	private Quaternion kfu = Quaternion.identity;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public int SpawnType;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool IsTextObjectScaleStatic;

	private static WaitForEndOfFrame kfv = new WaitForEndOfFrame();

	private static WaitForSeconds[] kfw = new WaitForSeconds[20]
	{
		new WaitForSeconds(0.05f),
		new WaitForSeconds(0.1f),
		new WaitForSeconds(0.15f),
		new WaitForSeconds(0.2f),
		new WaitForSeconds(0.25f),
		new WaitForSeconds(0.3f),
		new WaitForSeconds(0.35f),
		new WaitForSeconds(0.4f),
		new WaitForSeconds(0.45f),
		new WaitForSeconds(0.5f),
		new WaitForSeconds(0.55f),
		new WaitForSeconds(0.6f),
		new WaitForSeconds(0.65f),
		new WaitForSeconds(0.7f),
		new WaitForSeconds(0.75f),
		new WaitForSeconds(0.8f),
		new WaitForSeconds(0.85f),
		new WaitForSeconds(0.9f),
		new WaitForSeconds(0.95f),
		new WaitForSeconds(1f)
	};

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		kfq = base.transform;
		kfn = new GameObject(base.name + " floating text");
		kfs = Camera.main.transform;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		if (SpawnType == 0)
		{
			kfo = kfn.AddComponent<TextMeshPro>();
			kfo.rectTransform.sizeDelta = new Vector2(3f, 3f);
			kfr = kfn.transform;
			kfr.position = kfq.position + new Vector3(0f, 15f, 0f);
			kfo.alignment = TextAlignmentOptions.Center;
			kfo.color = new Color32((byte)Random.Range(0, 255), (byte)Random.Range(0, 255), (byte)Random.Range(0, 255), byte.MaxValue);
			kfo.fontSize = 24f;
			kfo.fontFeatures.Clear();
			kfo.text = string.Empty;
			kfo.isTextObjectScaleStatic = IsTextObjectScaleStatic;
			StartCoroutine(bja());
		}
		else if (SpawnType == 1)
		{
			kfr = kfn.transform;
			kfr.position = kfq.position + new Vector3(0f, 15f, 0f);
			kfp = kfn.AddComponent<TextMesh>();
			kfp.font = Resources.Load<Font>("Fonts/ARIAL");
			kfp.GetComponent<Renderer>().sharedMaterial = kfp.font.material;
			kfp.color = new Color32((byte)Random.Range(0, 255), (byte)Random.Range(0, 255), (byte)Random.Range(0, 255), byte.MaxValue);
			kfp.anchor = TextAnchor.LowerCenter;
			kfp.fontSize = 24;
			StartCoroutine(bjb());
		}
		else
		{
			_ = SpawnType;
			_ = 2;
		}
	}

	public IEnumerator bja()
	{
		float num = 2f;
		float num2 = Random.Range(5f, 20f);
		float num3 = num2;
		Vector3 position = kfr.position;
		Color32 color = kfo.color;
		float num4 = 255f;
		float num5 = 3f / num2 * num;
		while (num3 > 0f)
		{
			num3 -= Time.deltaTime / num * num2;
			if (num3 <= 3f)
			{
				num4 = Mathf.Clamp(num4 - Time.deltaTime / num5 * 255f, 0f, 255f);
			}
			kfo.text = ((int)num3).ToString();
			kfo.color = new Color32(color.r, color.g, color.b, (byte)num4);
			kfr.position += new Vector3(0f, num2 * Time.deltaTime, 0f);
			if (!kft.Compare(kfs.position, 1000) || !kfu.Compare(kfs.rotation, 1000))
			{
				kft = kfs.position;
				kfu = kfs.rotation;
				kfr.rotation = kfu;
				Vector3 vector = kfq.position - kft;
				kfq.forward = new Vector3(vector.x, 0f, vector.z);
			}
			yield return kfv;
		}
		yield return kfw[Random.Range(0, 19)];
		kfr.position = position;
		StartCoroutine(bja());
	}

	public IEnumerator bjb()
	{
		float num = 2f;
		float num2 = Random.Range(5f, 20f);
		float num3 = num2;
		Vector3 position = kfr.position;
		Color32 color = kfp.color;
		float num4 = 255f;
		float num5 = 3f / num2 * num;
		while (num3 > 0f)
		{
			num3 -= Time.deltaTime / num * num2;
			if (num3 <= 3f)
			{
				num4 = Mathf.Clamp(num4 - Time.deltaTime / num5 * 255f, 0f, 255f);
			}
			kfp.text = ((int)num3).ToString();
			kfp.color = new Color32(color.r, color.g, color.b, (byte)num4);
			kfr.position += new Vector3(0f, num2 * Time.deltaTime, 0f);
			if (!kft.Compare(kfs.position, 1000) || !kfu.Compare(kfs.rotation, 1000))
			{
				kft = kfs.position;
				kfu = kfs.rotation;
				kfr.rotation = kfu;
				Vector3 vector = kfq.position - kft;
				kfq.forward = new Vector3(vector.x, 0f, vector.z);
			}
			yield return kfv;
		}
		yield return kfw[Random.Range(0, 20)];
		kfr.position = position;
		StartCoroutine(bjb());
	}
}
