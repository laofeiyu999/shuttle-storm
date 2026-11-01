using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Assets.Scripts.Utils;
using OPS.Obfuscator.Attribute;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;
using UnityEngine.UI;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class ExerciseResultPanel : AnimatedPanel
{
	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private LocalizedTextMeshPro title;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image goldImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI goldScore;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image silverImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI silverScore;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private Image bronzeImage;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI bronzeScore;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI scoreText;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI previousScoreLabel;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private TextMeshProUGUI previousScoreText;

	private DateTime? mij;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const int SCORE_ANIMATION_DURATION = 4000;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public const float MEDAL_ANIMATION_DURATION = 500f;

	private tp mik;

	private int mil;

	private HashSet<MedalType> mim = new HashSet<MedalType>();

	private AudioSource mio;

	private AudioSource mip;

	private AudioClip miq;

	private AudioClip mir;

	private AudioClip mis;

	private AudioClip mit;

	private AudioClip miu;

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		mio = base.gameObject.AddComponent<AudioSource>();
		mip = base.gameObject.AddComponent<AudioSource>();
		miq = Resources.Load<AudioClip>("Sounds/countdown-single");
		mir = Resources.Load<AudioClip>("Sounds/countdown-single");
		mis = Resources.Load<AudioClip>("Sounds/success-1");
		mit = Resources.Load<AudioClip>("Sounds/success-2");
		miu = Resources.Load<AudioClip>("Sounds/success-3");
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnEnable()
	{
		base.OnEnable();
		StartCoroutine(fdu(0.5f));
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	protected override void OnDisable()
	{
		base.OnDisable();
		scoreText.text = "0";
	}

	public void fdt(tp a, int b, int? c)
	{
		mik = a;
		mil = b;
		title.plk = new LocalizedString("Training", mik.nch);
		goldScore.text = mik.gqy(MedalType.Gold).ToString();
		silverScore.text = mik.gqy(MedalType.Silver).ToString();
		bronzeScore.text = mik.gqy(MedalType.Bronze).ToString();
		previousScoreLabel.gameObject.SetActive(c.HasValue);
		previousScoreText.gameObject.SetActive(c.HasValue);
		previousScoreText.text = c?.ToString() ?? string.Empty;
	}

	private IEnumerator fdu(float a = 0f)
	{
		if (mil == 0)
		{
			yield break;
		}
		yield return new WaitForSeconds(a);
		DateTime now = DateTime.Now;
		mim.Clear();
		if (mil > 10)
		{
			mio.PlayOneShot(miq);
		}
		scoreText.text = "0";
		Image image = bronzeImage;
		Image image2 = silverImage;
		Color color2 = (goldImage.color = new Color32(150, 150, 150, byte.MaxValue));
		Color color4 = (image2.color = color2);
		image.color = color4;
		Transform obj = bronzeImage.transform;
		Transform obj2 = silverImage.transform;
		Vector3 vector2 = (goldImage.transform.localScale = new Vector3(0.8f, 0.8f, 0.8f));
		Vector3 localScale = (obj2.localScale = vector2);
		obj.localScale = localScale;
		yield return new WaitForEndOfFrame();
		int num = 0;
		while ((DateTime.Now - now).TotalMilliseconds <= 4000.0)
		{
			float num2 = ((float)(DateTime.Now - now).TotalMilliseconds / 4000f).gtg(0f, 1f);
			float t = 1f - Mathf.Pow(1f - num2, 3f);
			int num3 = Mathf.RoundToInt(Mathf.Lerp(0f, mil, t));
			if (mil <= 10 && num != num3 && !mio.isPlaying)
			{
				mio.PlayOneShot(mir);
			}
			num = num3;
			scoreText.text = num3.ToString();
			foreach (MedalType item in Enum.GetValues(typeof(MedalType)).Cast<MedalType>())
			{
				int num4 = mik.gqy(item);
				if (num3 >= num4 && !mim.Contains(item))
				{
					mim.Add(item);
					StartCoroutine(fdx(fdv(item)));
					mip.PlayOneShot(fdw(item));
				}
			}
			yield return new WaitForEndOfFrame();
		}
		scoreText.text = mil.ToString();
	}

	private Image fdv(MedalType a)
	{
		return a switch
		{
			MedalType.Bronze => bronzeImage, 
			MedalType.Silver => silverImage, 
			_ => goldImage, 
		};
	}

	private AudioClip fdw(MedalType a)
	{
		return a switch
		{
			MedalType.Bronze => mis, 
			MedalType.Silver => mit, 
			_ => miu, 
		};
	}

	private IEnumerator fdx(Image a)
	{
		DateTime now = DateTime.Now;
		while ((DateTime.Now - now).TotalMilliseconds <= 500.0)
		{
			float t = ((float)(DateTime.Now - now).TotalMilliseconds / 500f).gtg(0f, 1f);
			byte b = (byte)Mathf.Round(Mathf.Lerp(150f, 255f, t));
			float num = Mathf.Lerp(0.8f, 1f, t);
			a.color = new Color32(b, b, b, byte.MaxValue);
			a.transform.localScale = new Vector3(num, num, num);
			yield return new WaitForEndOfFrame();
		}
		a.color = new Color32(byte.MaxValue, byte.MaxValue, byte.MaxValue, byte.MaxValue);
		a.transform.localScale = Vector3.one;
	}
}
