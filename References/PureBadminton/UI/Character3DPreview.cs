using System.Collections;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class Character3DPreview : MonoBehaviour
{
	private GameObject ngt;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private CharacterIdlePose pose;

	private float? ngu;

	private bool ngv;

	private Coroutine ngw;

	private Coroutine ngx;

	public GameObject ngs
	{
		get; [NotObfuscatedCause("Because the method might be a gui method.")]
		set;
	}

	public CharacterIdlePose pqh
	{
		get
		{
			return pose;
		}
		set
		{
			pose = value;
			if (ngt != null)
			{
				Animator component = ngt.GetComponent<Animator>();
				component.SetBool("CrossedArms", pose == CharacterIdlePose.CrossedArms);
				component.SetBool("Racket", pose == CharacterIdlePose.Racket);
				ngt.GetComponent<CharacterRacket>().pje = pose == CharacterIdlePose.Racket;
			}
		}
	}

	public bool pqi
	{
		get
		{
			return ngv;
		}
		set
		{
			ngv = value;
			if (!ngv && ngu.HasValue)
			{
				base.transform.rotation = Quaternion.Euler(0f, ngu.Value, 0f);
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Start()
	{
		ngu = base.transform.rotation.eulerAngles.y;
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	public void Update()
	{
		if (ngv && ModalManager.Current == null && ngx == null)
		{
			if (qi.pli.pki.IsPressed())
			{
				base.transform.rotation = Quaternion.Euler(0f, base.transform.rotation.eulerAngles.y + 90f * Time.deltaTime, 0f);
			}
			if (qi.pli.pkj.IsPressed())
			{
				base.transform.rotation = Quaternion.Euler(0f, base.transform.rotation.eulerAngles.y - 90f * Time.deltaTime, 0f);
			}
		}
	}

	public void gyp(CharacterInfo a, CharacterIdlePose? b = null)
	{
		if (ngw != null)
		{
			StopCoroutine(ngw);
			ngw = null;
		}
		if (ngu.HasValue)
		{
			base.transform.rotation = Quaternion.Euler(0f, ngu.Value, 0f);
		}
		ngw = StartCoroutine(gyq(a, b));
	}

	public IEnumerator gyq(CharacterInfo a, CharacterIdlePose? b = null)
	{
		ResourceRequest resourceRequest = Resources.LoadAsync<GameObject>("Characters/" + a.modelId);
		yield return resourceRequest;
		if (ngt != null)
		{
			Object.DestroyImmediate(ngt);
		}
		GameObject gameObject = Object.Instantiate(resourceRequest.asset as GameObject, base.transform);
		gameObject.gvf(LayerMask.NameToLayer("Hidden"));
		gameObject.name = "Character";
		Animator component = gameObject.GetComponent<Animator>();
		component.runtimeAnimatorController = Resources.Load<RuntimeAnimatorController>("IdleAnimator");
		if ((b ?? pose) == CharacterIdlePose.Racket)
		{
			component.SetBool("Racket", value: true);
			component.Play("Idle-Racket", 0, Random.Range(0, 1));
		}
		else if ((b ?? pose) == CharacterIdlePose.CrossedArms)
		{
			component.SetBool("CrossedArms", value: true);
			component.Play("Idle-CrossedArms", 0, Random.Range(0, 1));
		}
		component.SetBool("IsMirrored", a.leftHanded);
		gameObject.AddComponent<CharacterRandomBlink>();
		if (ngs != null)
		{
			gameObject.AddComponent<CharacterLookAt>();
		}
		CharacterRacket characterRacket = gameObject.AddComponent<CharacterRacket>();
		characterRacket.Initialize(a.leftHanded);
		characterRacket.pje = (b ?? pose) == CharacterIdlePose.Racket;
		ty.grs(gameObject, a);
		ngt = gameObject;
		yield return new WaitForEndOfFrame();
		if (ngs != null)
		{
			gys();
		}
		gameObject.gvf(LayerMask.NameToLayer("Default"));
	}

	public void gyr(CharacterInfo a)
	{
		if (ngt != null)
		{
			ty.grs(ngt, a);
		}
	}

	public void gys()
	{
		ngt.GetComponent<CharacterLookAt>().mnr.transform.position = ngt.transform.position + Quaternion.Euler(0f, -5f, 0f) * (ngs.transform.position - ngt.transform.position);
	}

	public void gyt(float a)
	{
		if (ngx != null)
		{
			StopCoroutine(ngx);
			ngx = null;
		}
		ngx = StartCoroutine(gyu(a));
	}

	private IEnumerator gyu(float a)
	{
		Quaternion rotation = base.transform.rotation;
		Quaternion quaternion = Quaternion.Euler(0f, a, 0f);
		float time = Time.time;
		float num = 0.3f;
		while (Time.time < time + num)
		{
			base.transform.rotation = Quaternion.Lerp(rotation, quaternion, (Time.time - time) / num);
			yield return new WaitForEndOfFrame();
		}
		base.transform.rotation = quaternion;
		ngx = null;
	}
}
