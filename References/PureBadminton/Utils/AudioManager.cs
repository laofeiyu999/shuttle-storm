using OPS.Obfuscator.Attribute;
using UnityEngine;
using UnityEngine.Audio;

[NotObfuscatedCause("Class: Because of compatibility component: Unity - Compatibility : The class or base class contains some serializeable fields and the 'Obfuscate Serializeable Fields' settings is deactivated.")]
[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class AudioManager : MonoBehaviour
{
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The class is a Unity class (MonoBehaviour/...) and the setting 'Obfuscate Public unity fields' is deactivated.")]
	public static AudioManager instance;

	[SerializeField]
	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : The field has a 'SerializeField' attribute and therefore is serializeable. The disabled setting 'Obfuscate SerializeAble Fields' deactivates obfuscation this field.")]
	private AudioMixer mixer;

	private AudioClip mkw;

	private AudioClip mkx;

	private AudioClip mky;

	private AudioClip mkz;

	private AudioClip mla;

	private AudioClip mlb;

	private AudioClip mlc;

	private AudioClip mld;

	private AudioClip mle;

	private AudioClip mlf;

	private AudioSource pin => GetComponent<AudioSource>();

	public AudioClip[] mlg { get; private set; }

	public AudioClip[] mlh { get; private set; }

	public AudioClip[] mli { get; private set; }

	public AudioClip[] mlj { get; private set; }

	public AudioClip[] mlk { get; private set; }

	public AudioClip[] mll { get; private set; }

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Awake()
	{
		if (instance == null)
		{
			instance = this;
			fiq();
			Object.DontDestroyOnLoad(base.gameObject);
		}
		else
		{
			Object.Destroy(base.gameObject);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Start()
	{
		fir();
	}

	public void fiq()
	{
		if (!(mkw != null))
		{
			mkw = Resources.Load<AudioClip>("Sounds/menu-change");
			mkx = Resources.Load<AudioClip>("Sounds/menu-navigate");
			mky = Resources.Load<AudioClip>("Sounds/menu-start");
			mkz = Resources.Load<AudioClip>("Sounds/menu-error");
			mla = Resources.Load<AudioClip>("Sounds/small-success");
			mlb = Resources.Load<AudioClip>("Sounds/small-success-2");
			mlc = Resources.Load<AudioClip>("Sounds/success-1");
			mld = Resources.Load<AudioClip>("Sounds/success-2");
			mle = Resources.Load<AudioClip>("Sounds/success-3");
			mlf = Resources.Load<AudioClip>("Sounds/item-equip");
			mlg = new AudioClip[2]
			{
				Resources.Load<AudioClip>("Sounds/Shots/Smash"),
				Resources.Load<AudioClip>("Sounds/Shots/Smash2")
			};
			mlh = new AudioClip[2]
			{
				Resources.Load<AudioClip>("Sounds/Shots/BigSmash"),
				Resources.Load<AudioClip>("Sounds/Shots/BigSmash2")
			};
			mli = new AudioClip[2]
			{
				Resources.Load<AudioClip>("Sounds/Shots/Net"),
				Resources.Load<AudioClip>("Sounds/Shots/Net2")
			};
			mlj = new AudioClip[3]
			{
				Resources.Load<AudioClip>("Sounds/Shots/Slice"),
				Resources.Load<AudioClip>("Sounds/Shots/Slice2"),
				Resources.Load<AudioClip>("Sounds/Shots/Slice3")
			};
			mlk = new AudioClip[2]
			{
				Resources.Load<AudioClip>("Sounds/Shots/Lift"),
				Resources.Load<AudioClip>("Sounds/Shots/Lift2")
			};
			mll = new AudioClip[2]
			{
				Resources.Load<AudioClip>("Sounds/Shots/Clear"),
				Resources.Load<AudioClip>("Sounds/Shots/Clear2")
			};
		}
	}

	public static void fir()
	{
		instance?.mixer.SetFloat("volume", 0f);
		SetVolume(rk.pni);
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public static void SetVolume(float volume)
	{
		AudioListener.volume = volume;
	}

	public static void fis()
	{
		if ((bool)instance && !instance.pin.isPlaying)
		{
			instance.pin.Play();
		}
	}

	public static void fit()
	{
		instance?.pin?.Stop();
	}

	[NotObfuscatedCause("Because the method might be a gui method.")]
	public static void PlayMenuChange()
	{
		instance?.pin?.PlayOneShot(instance.mkw);
	}

	public static void fiu()
	{
		instance?.pin?.PlayOneShot(instance.mkx);
	}

	public static void fiv()
	{
		instance?.pin?.PlayOneShot(instance.mky);
	}

	public static void fiw()
	{
		instance?.pin?.PlayOneShot(instance.mkz);
	}

	public static void fix()
	{
		instance?.pin?.PlayOneShot(instance.mla);
	}

	public static void fiy()
	{
		instance?.pin?.PlayOneShot(instance.mlb);
	}

	public static void fiz()
	{
		instance?.pin?.PlayOneShot(instance.mlc);
	}

	public static void fja()
	{
		instance?.pin?.PlayOneShot(instance.mld);
	}

	public static void fjb()
	{
		instance?.pin?.PlayOneShot(instance.mle);
	}

	public static void fjc()
	{
		instance?.pin?.PlayOneShot(instance.mlf);
	}
}
