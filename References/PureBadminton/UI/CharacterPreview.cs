using System.Collections;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class CharacterPreview : MonoBehaviour
{
	[NotObfuscatedCause("Class: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
	[NotObfuscatedCause("Namespace: Because of the deactivation of the 'Obfuscate enum classes' settings.")]
	public enum CharacterRotation
	{
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		None,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Left,
		[NotObfuscatedCause("Because of the deactivated 'Obfuscate enum values' setting.")]
		Right
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Image CountryImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI FirstNameText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI LastNameText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public RawImage PreviewImage;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public AnimatedPanel PreviewImageContainer;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject PreviewContainer;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public Camera Camera;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public GameObject Character;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI HandednessText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI SpeedText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI PowerText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI PrecisionText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI DefenseText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI StaminaText;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public TextMeshProUGUI HeightText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private bool crossedArms;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public bool FullBody;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public CharacterRotation Rotation;

	private Coroutine nhs;

	public bool prc
	{
		get
		{
			return crossedArms;
		}
		set
		{
			crossedArms = value;
			if (Character != null)
			{
				Character.GetComponent<Animator>().SetBool("CrossedArms", value);
			}
		}
	}

	public void hbc(CharacterInfo a)
	{
		if (nhs != null)
		{
			StopCoroutine(nhs);
			nhs = null;
		}
		CountryImage.sprite = Countries.fxd(a.country);
		FirstNameText.text = a.firstName;
		LastNameText.text = a.lastName;
		if (PreviewImage.texture == null)
		{
			Rect rect = PreviewImage.GetComponent<RectTransform>().rect;
			float num = GetComponentInParent<CanvasScaler>().guh() * 4f;
			RenderTexture renderTexture = new RenderTexture(Mathf.RoundToInt(rect.width * num), Mathf.RoundToInt(rect.height * num), 32);
			renderTexture.antiAliasing = 1;
			renderTexture.Create();
			Camera.targetTexture = renderTexture;
			PreviewImage.texture = renderTexture;
			PreviewImage.color = Color.white;
			PreviewImageContainer.GetComponent<RectMask2D>().enabled = !FullBody;
			Camera.fieldOfView = (FullBody ? 25 : 10);
			Camera.transform.gty(FullBody ? 1.9f : (0.6f + (float)a.height / 100f));
		}
		if (HandednessText != null)
		{
			HandednessText.text = this.gut("List_Handedness", a.leftHanded ? "Left" : "Right");
		}
		if (SpeedText != null)
		{
			SpeedText.text = a.stats.speed.ToString();
		}
		if (PowerText != null)
		{
			PowerText.text = a.stats.power.ToString();
		}
		if (PrecisionText != null)
		{
			PrecisionText.text = a.stats.precision.ToString();
		}
		if (DefenseText != null)
		{
			DefenseText.text = a.stats.defense.ToString();
		}
		if (StaminaText != null)
		{
			StaminaText.text = a.stats.stamina.ToString();
		}
		if (HeightText != null)
		{
			HeightText.text = a.height.ToString().Insert(1, "m");
		}
		nhs = StartCoroutine(hbd(a));
	}

	public IEnumerator hbd(CharacterInfo a)
	{
		PreviewImageContainer.gxs();
		ResourceRequest resourceRequest = Resources.LoadAsync<GameObject>("Characters/" + a.modelId);
		yield return resourceRequest;
		if (Character != null)
		{
			Object.DestroyImmediate(Character);
		}
		GameObject gameObject = Object.Instantiate(resourceRequest.asset as GameObject, PreviewContainer.transform);
		gameObject.name = "Character";
		gameObject.GetComponent<Animator>().runtimeAnimatorController = Resources.Load<RuntimeAnimatorController>("IdleAnimator");
		if (crossedArms)
		{
			gameObject.GetComponent<Animator>().SetBool("CrossedArms", value: true);
			gameObject.GetComponent<Animator>().Play("Idle-CrossedArms", 0, Random.Range(0, 1));
		}
		gameObject.AddComponent<CharacterRandomBlink>();
		ty.grs(gameObject, a);
		Character = gameObject;
		PreviewImageContainer.FadeIn();
		yield return new WaitForSeconds(0f);
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void LateUpdate()
	{
		if (Character != null && Rotation != 0)
		{
			Character.transform.eulerAngles = new Vector3(0f, (Rotation == CharacterRotation.Left) ? 30 : (-30), 0f);
			Character.GetComponent<Animator>().GetBoneTransform(HumanBodyBones.Neck).Rotate(0f, (Rotation == CharacterRotation.Left) ? (-20) : 20, 0f);
		}
	}
}
